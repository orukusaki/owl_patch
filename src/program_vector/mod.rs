extern crate alloc;

use crate::ffi::program_vector as ffi;
use crate::ffi::service_call::{
    OWL_SERVICE_GET_ARRAY, OWL_SERVICE_OK, OWL_SERVICE_REGISTER_CALLBACK,
    OWL_SERVICE_REQUEST_CALLBACK, SYSTEM_FUNCTION_DRAW, SYSTEM_FUNCTION_MIDI,
};
use crate::sample_buffer::Sample;
use ffi::MemorySegment;

pub use ffi::ProgramVector as FfiProgramVector;

mod audio;
pub use audio::{AudioBuffers, AudioFormat, AudioSettings};

mod parameters;
use midi::{midi_callback, Midi};
use parameters::button_changed_callback;
pub use parameters::{Parameters, PatchButtonId, PatchParameterId};

mod messages;
pub use messages::debug_message;
use messages::Messages;

pub mod midi;

pub mod meta;
pub use meta::Meta;

pub const OWL_PEDAL_HARDWARE: u8 = ffi::OWL_PEDAL_HARDWARE as u8;
pub const OWL_MODULAR_HARDWARE: u8 = ffi::OWL_MODULAR_HARDWARE as u8;
pub const OWL_RACK_HARDWARE: u8 = ffi::OWL_RACK_HARDWARE as u8;
pub const PRISM_HARDWARE: u8 = ffi::PRISM_HARDWARE as u8;
pub const PLAYER_HARDWARE: u8 = ffi::PLAYER_HARDWARE as u8;
pub const PROGRAM_VECTOR_CHECKSUM_V11: u8 = ffi::PROGRAM_VECTOR_CHECKSUM_V11 as u8;
pub const PROGRAM_VECTOR_CHECKSUM_V12: u8 = ffi::PROGRAM_VECTOR_CHECKSUM_V12 as u8;
pub const PROGRAM_VECTOR_CHECKSUM_V13: u8 = ffi::PROGRAM_VECTOR_CHECKSUM_V13 as u8;
pub const CHECKSUM_ERROR_STATUS: i8 = ffi::CHECKSUM_ERROR_STATUS as i8;
pub const OUT_OF_MEMORY_ERROR_STATUS: i8 = ffi::OUT_OF_MEMORY_ERROR_STATUS as i8;
pub const CONFIGURATION_ERROR_STATUS: i8 = ffi::CONFIGURATION_ERROR_STATUS as i8;
pub const AUDIO_FORMAT_24B16: u8 = ffi::AUDIO_FORMAT_24B16 as u8;
pub const AUDIO_FORMAT_24B32: u8 = ffi::AUDIO_FORMAT_24B32 as u8;
pub const AUDIO_FORMAT_FORMAT_MASK: u8 = ffi::AUDIO_FORMAT_FORMAT_MASK as u8;
pub const AUDIO_FORMAT_CHANNEL_MASK: u8 = ffi::AUDIO_FORMAT_CHANNEL_MASK as u8;

use alloc::ffi::CString;
use core::ptr::NonNull;
use core::{
    ffi::c_void,
    mem::MaybeUninit,
    slice,
    sync::atomic::{AtomicBool, Ordering},
};

// The Program Vector is how we communicate with the OS. It is initialised by the OS at runtime.
// It is designated to the special .pv section, and its address will be written to the program header block
// in the binary by the linker script
#[link_section = ".pv"]
#[used]
pub(crate) static mut PROGRAM_VECTOR: MaybeUninit<FfiProgramVector> = MaybeUninit::uninit();
static TAKEN: AtomicBool = AtomicBool::new(false);

unsafe impl Sync for FfiProgramVector {}

// Owned wrapper around the static ProgramVector instance
pub struct ProgramVector<'a> {
    pv: &'a mut FfiProgramVector,
}

impl ProgramVector<'static> {
    pub fn instance() -> Self {
        if TAKEN.swap(true, Ordering::Relaxed) {
            panic!("program vector already taken");
        }

        // Safety: Our atomic flag means a 2nd call to this function will error
        let pv = unsafe { PROGRAM_VECTOR.assume_init_mut() };
        let instance = Self { pv };

        // if the checksum is valid, then the vector was initislised
        if instance.pv.checksum < PROGRAM_VECTOR_CHECKSUM_V11 {
            panic!("program vector checksum error");
        }

        instance
    }

    pub fn split<'a, F: Sample<BaseType = i32>>(
        mut self,
    ) -> (AudioBuffers<'a, F>, Parameters<'a>, Midi, Meta<'a>) {
        let audio_settings = self.audio_settings();

        let _ = self.register_callback(SYSTEM_FUNCTION_MIDI, midi_callback as *mut _);
        let midi = Midi::new(self.get_midi_send_cb());

        Messages::init(&mut self.pv.message);

        let audio = AudioBuffers::new(
            &self.pv.audio_input,
            &self.pv.audio_output,
            audio_settings,
            self.pv.programReady,
        );

        self.pv.buttonChangedCallback = Some(button_changed_callback);

        let parameters = Parameters::new(
            unsafe { slice::from_raw_parts(self.pv.parameters, self.pv.parameters_size as usize) },
            &self.pv.buttons,
            self.pv.registerPatchParameter,
            self.pv.setPatchParameter,
            self.pv.setButton,
        );

        let meta = Meta::new(
            &self.pv.cycles_per_block,
            &mut self.pv.heap_bytes_used,
            &self.pv.checksum,
            &self.pv.hardware_version,
        );

        (audio, parameters, midi, meta)
    }
}

impl<'a> ProgramVector<'a> {
    pub fn audio_settings(&self) -> AudioSettings {
        let (format, channels) = AudioFormat::parse(self.pv.audio_format);
        AudioSettings {
            sample_rate: self.pv.audio_samplingrate as usize,
            blocksize: self.pv.audio_blocksize as usize,
            channels,
            format,
        }
    }

    pub fn memory_segments(&self) -> &[MemorySegment] {
        const MAX: usize = 5;

        if self.pv.checksum < PROGRAM_VECTOR_CHECKSUM_V13 {
            panic!("bad checksum");
        }

        let count = (0..MAX)
            .take_while(|i| {
                // Safety: heapLocations should be provided by the OS, we're checking for null pointers
                // and null values, that's probably the best we can do
                if let Some(segment) = unsafe { self.pv.heapLocations.add(*i).as_ref() } {
                    !segment.location.is_null()
                } else {
                    false
                }
            })
            .last()
            .unwrap_or_else(|| {
                panic!("pv.heapLocations.is_null");
            });

        // Safety: We've checked and the data at least seems to be valid. It is not expected to change
        // during the program's runtime, so effectively the lifetime is 'static
        unsafe { slice::from_raw_parts(self.pv.heapLocations, count + 1) }
    }

    // Register the patch by calling the provided function in the pv. It seems like the channel counts
    // are ignored presently, the number of channels set in pv.audio_format is defined by the hardware
    // The only thing it really does is display the patch name on devices with a screen
    pub fn register_patch(&mut self, name: &str, input_channels: u8, output_channels: u8) {
        if let Some(register_patch) = self.pv.registerPatch {
            // allocate a CString to ensure we get null termination
            let c_name = CString::new(name).expect("failed to create name string");
            // Safety: c_name does not need to exist after this function call, so it can safely be
            // dropped at the end of this scope
            unsafe { register_patch(c_name.as_ptr(), input_channels, output_channels) };
        }
    }

    pub fn register_draw_callback(
        &mut self,
        callback: fn(pixels: *mut u8, width: u16, height: u16),
    ) -> Result<(), &str> {
        self.register_callback(SYSTEM_FUNCTION_DRAW, callback as *mut _)
    }

    fn get_midi_send_cb(&mut self) -> Option<extern "C" fn(u8, u8, u8, u8)> {
        // # Safety
        // We receve a raw function pointer, and hope that it relates to a function
        // with the expected signature, but have no way to really verify this.
        unsafe { core::mem::transmute(self.request_callback(SYSTEM_FUNCTION_MIDI).ok()) }
    }

    fn register_callback(
        &mut self,
        code: &[u8; 4usize],
        callback: *mut c_void,
    ) -> Result<(), &str> {
        let service_call = self.pv.serviceCall.ok_or("service call not available")?;

        let mut args = [code.as_ptr() as *mut _, callback];

        let ret = unsafe {
            service_call(
                OWL_SERVICE_REGISTER_CALLBACK as i32,
                args.as_mut_ptr(),
                args.len() as i32,
            )
        };
        (ret == OWL_SERVICE_OK as i32)
            .then_some(())
            .ok_or("service call returned error")
    }

    fn request_callback(&mut self, code: &[u8; 4usize]) -> Result<NonNull<()>, &str> {
        let service_call = self.pv.serviceCall.ok_or("service call not available")?;

        let mut callback: *mut c_void = core::ptr::null_mut();
        let mut args = [
            code.as_ptr() as *mut _,
            // Pass a pointer to the callback pointer, allowing the OS to write to it
            &mut callback as *mut *mut c_void as *mut c_void,
        ];
        let ret = unsafe {
            service_call(
                OWL_SERVICE_REQUEST_CALLBACK as i32,
                args.as_mut_ptr(),
                args.len() as i32,
            )
        };

        if ret == OWL_SERVICE_OK as i32 {
            NonNull::new(callback as *mut ()).ok_or("bad callback")
        } else {
            Err("service call returned error")
        }
    }

    //TODO: return Result
    pub fn get_array<T>(&mut self, code: &[u8; 4usize]) -> Option<&[T]> {
        self.pv.serviceCall.and_then(|service_call| {
            let mut size: usize = 0;
            let mut ptr: *mut T = core::ptr::null_mut();
            let mut args = [
                code.as_ptr() as *mut _,
                &mut ptr as *mut *mut T as *mut _,
                &mut size as *mut usize as *mut _,
            ];

            let ret = unsafe {
                service_call(
                    OWL_SERVICE_GET_ARRAY as i32,
                    args.as_mut_ptr(),
                    args.len() as i32,
                )
            };

            (ret == OWL_SERVICE_OK as i32 && !ptr.is_null())
                .then(|| unsafe { slice::from_raw_parts(ptr as *const T, size) })
        })
    }
}
