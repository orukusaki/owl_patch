extern crate alloc;

use crate::ffi::program_vector::{self as ffi, ProgramVectorAudioStatus};
use crate::ffi::service_call::{
    OWL_SERVICE_GET_ARRAY, OWL_SERVICE_OK, OWL_SERVICE_REGISTER_CALLBACK,
    OWL_SERVICE_REQUEST_CALLBACK, SYSTEM_FUNCTION_DRAW, SYSTEM_FUNCTION_MIDI,
};
use crate::midi_message::MidiMessage;
use crate::sample_buffer::Sample;
use alloc::boxed::Box;
use ffi::MemorySegment;

pub use ffi::ProgramVector as FfiProgramVector;

mod audio;
pub use audio::{AudioBuffers, AudioFormat, AudioSettings};

mod parameters;
pub use parameters::{Parameters, PatchButtonId, PatchParameterId};

mod messages;
use messages::Messages;
pub use messages::{debug_message, error};

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
use core::ffi::CStr;
use core::ptr::NonNull;
use core::{
    ffi::c_void,
    mem::MaybeUninit,
    slice,
    sync::atomic::{compiler_fence, AtomicBool, Ordering},
};

// The Program Vector is how we communicate with the OS. It is initialised by the OS at runtime.
// It is designated to the special .pv section, and its address will be written to the program header block
// in the binary by the linker script
#[link_section = ".pv"]
#[used]
static mut PROGRAM_VECTOR: MaybeUninit<FfiProgramVector> = MaybeUninit::uninit();
static TAKEN: AtomicBool = AtomicBool::new(false);

unsafe impl Sync for FfiProgramVector {}

// Owned wrapper around the static ProgramVector instance
pub struct ProgramVector<'a> {
    pv: &'a mut FfiProgramVector,
}

impl ProgramVector<'static> {
    pub fn instance() -> Self {
        let taken = TAKEN.swap(true, Ordering::Relaxed);
        // Safety: Our atomic flag means a 2nd call to this function will error
        let pv = unsafe { PROGRAM_VECTOR.assume_init_mut() };

        let mut instance = Self { pv };

        if taken {
            // TODO: hold on, is this ok? In this situation there _are_ two mutable references to PROGRAM_VECTOR
            // So although we're chosing to crash here, isn't this still UB?
            instance.error(CONFIGURATION_ERROR_STATUS, c"program vector already taken");
        }

        // if the checksum is valid, then the vector was initislised
        if instance.pv.checksum < PROGRAM_VECTOR_CHECKSUM_V11 {
            instance.error(CONFIGURATION_ERROR_STATUS, c"program vector checksum error");
        }

        instance
    }

    pub fn split<'a, F: Sample<BaseType = i32>>(
        mut self,
    ) -> (
        AudioBuffers<'a, F>,
        Parameters<'a>,
        Box<impl Fn(MidiMessage)>,
    ) {
        let audio_settings = self.audio_settings();

        let midi_send = self.get_midi_send_cb();
        Messages::init(
            &mut self.pv.error,
            &mut self.pv.message,
            self.pv.programStatus,
        );

        let audio = AudioBuffers::new(
            &self.pv.audio_input,
            &self.pv.audio_output,
            audio_settings,
            self.pv.programReady,
        );

        let parameters = Parameters::new(
            &self.pv.parameters,
            self.pv.parameters_size as usize,
            &self.pv.buttons,
            self.pv.registerPatchParameter,
            self.pv.setPatchParameter,
            self.pv.setButton,
            &mut self.pv.buttonChangedCallback,
        );

        (audio, parameters, midi_send)
    }

    pub fn set_heap_bytes_used(&mut self, heap_bytes_used: usize) {
        self.pv.heap_bytes_used = heap_bytes_used as u32
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

    fn get_midi_send_cb(&mut self) -> Box<impl Fn(MidiMessage)> {
        // # Safety
        // We receve a raw function pointer, and hope that it relates to a function
        // with the expected signature, but have no way to really verify this.
        let midi_send_callback: Option<extern "C" fn(u8, u8, u8, u8)> =
            unsafe { core::mem::transmute(self.request_callback(SYSTEM_FUNCTION_MIDI)) };

        Box::new(move |message: MidiMessage| {
            if let Some(f) = midi_send_callback {
                f(message.port, message.d0, message.d1, message.d2)
            }
        })
    }

    pub fn memory_segments(&self) -> &[MemorySegment] {
        const MAX: usize = 4;

        if self.pv.checksum < PROGRAM_VECTOR_CHECKSUM_V13 {
            error(CHECKSUM_ERROR_STATUS, c"bad checksum");
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
                error(CHECKSUM_ERROR_STATUS, c"pv.heapLocations.is_null");
            });

        // Safety: We've checked and the data at least seems to be valid. It is not expected to change
        // during the program's runtime, so effectively the lifetime is 'static
        unsafe { slice::from_raw_parts(self.pv.heapLocations, count) }
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

    // TODO: change signature to accept correct fn type
    pub fn register_midi_callback(&mut self, callback: *mut c_void) {
        self.register_callback(SYSTEM_FUNCTION_MIDI, callback)
    }

    // TODO: change signature to accept correct fn type
    pub fn register_draw_callback(&mut self, callback: *mut c_void) {
        self.register_callback(SYSTEM_FUNCTION_DRAW, callback)
    }

    //TODO: return Result
    fn register_callback(&mut self, code: &[u8; 4usize], callback: *mut c_void) {
        let mut args = [code.as_ptr() as *mut _, callback];
        if let Some(service_call) = self.pv.serviceCall {
            unsafe {
                service_call(
                    OWL_SERVICE_REGISTER_CALLBACK as i32,
                    args.as_mut_ptr(),
                    args.len() as i32,
                )
            };
        }
    }

    //TODO: return Result
    pub fn request_callback(&mut self, code: &[u8; 4usize]) -> Option<NonNull<()>> {
        self.pv.serviceCall.and_then(|service_call| {
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
                NonNull::new(callback as *mut ())
            } else {
                None
            }
        })
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

    // Only for use during startup, after splitting, the static functions in messages are used
    fn error(&mut self, code: i8, message: &CStr) -> ! {
        self.pv.error = code;
        self.pv.message = message.as_ptr() as *mut i8;
        if let Some(program_status) = self.pv.programStatus {
            // This function never returns
            unsafe {
                program_status(ProgramVectorAudioStatus::AUDIO_ERROR_STATUS);
            }
            unreachable!();
        }
        loop {
            compiler_fence(Ordering::SeqCst);
        }
    }
}