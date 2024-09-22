extern crate alloc;

use crate::ffi::program_vector as ffi;
use crate::ffi::service_call::SYSTEM_FUNCTION_MIDI;
use crate::sample_buffer::Sample;

use alloc::ffi::CString;
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

pub mod service_call;
pub use service_call::ServiceCall;

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

use core::{
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
    pub parameters: Parameters<'a>,
    pub midi: Midi,
    pub meta: Meta<'a>,
    audio_settings: AudioSettings,
    audio_input: &'a *mut i32,
    audio_output: &'a *mut i32,
    program_ready: Option<unsafe extern "C" fn()>,
}

impl ProgramVector<'static> {
    pub fn instance() -> Self {
        if TAKEN.swap(true, Ordering::Relaxed) {
            panic!("program vector already taken");
        }

        // Safety: Our atomic flag means a 2nd call to this function will error
        let pv = unsafe { PROGRAM_VECTOR.assume_init_mut() };
        // let mut instance = Self { pv };

        // if the checksum is valid, then the vector was initislised
        if pv.checksum < PROGRAM_VECTOR_CHECKSUM_V11 {
            panic!("program vector checksum error");
        }

        let meta = Meta::new(
            &pv.cycles_per_block,
            &mut pv.heap_bytes_used,
            &pv.checksum,
            &pv.hardware_version,
            &pv.heapLocations,
        );

        #[cfg(feature = "talc")]
        {
            let mut talc = talc_heap::ALLOCATOR.lock();
            meta.memory_segments().iter().for_each(|seg| unsafe {
                let _ = talc.claim(seg.into());
            });
        }

        let (format, channels) = AudioFormat::parse(pv.audio_format);
        let audio_settings = AudioSettings {
            sample_rate: pv.audio_samplingrate as usize,
            blocksize: pv.audio_blocksize as usize,
            channels,
            format,
        };

        let mut service_call = ServiceCall::new(pv.serviceCall);

        let _ = service_call.register_callback(SYSTEM_FUNCTION_MIDI, midi_callback as *mut _);
        let midi = Midi::new(&mut service_call);

        Messages::init(&mut pv.message);

        pv.buttonChangedCallback = Some(button_changed_callback);
        let parameters = Parameters::new(
            unsafe { slice::from_raw_parts(pv.parameters, pv.parameters_size as usize) },
            &pv.buttons,
            pv.registerPatchParameter,
            pv.setPatchParameter,
            pv.setButton,
        );

        // Register the patch by calling the provided function in the pv. It seems like the channel counts
        // are ignored presently, the number of channels set in pv.audio_format is defined by the hardware
        // The only thing it really does is display the patch name on devices with a screen
        if let Some(register_patch) = pv.registerPatch {
            // allocate a CString to ensure we get null termination
            let c_name = CString::new(env!("PATCHNAME")).expect("failed to create name string");
            // Safety: c_name does not need to exist after this function call, so it can safely be
            // dropped at the end of this scope
            unsafe { register_patch(c_name.as_ptr(), 2, 2) };
        }

        Self {
            parameters,
            midi,
            meta,
            audio_settings,
            audio_input: &pv.audio_input,
            audio_output: &pv.audio_output,
            program_ready: pv.programReady,
        }
    }

    pub fn audio_settings(&self) -> AudioSettings {
        self.audio_settings
    }
}

impl<'a> ProgramVector<'a> {
    pub fn audio<F>(&self) -> AudioBuffers<'a, F>
    where
        F: Sample<BaseType = i32> + From<f32>,
        f32: From<F>,
    {
        AudioBuffers::new(
            &self.audio_input,
            &self.audio_output,
            self.audio_settings,
            self.program_ready,
        )
    }
}

#[cfg(feature = "talc")]
mod talc_heap {
    use talc::*;

    use crate::ffi::program_vector::MemorySegment;

    impl From<&MemorySegment> for talc::Span {
        fn from(segment: &MemorySegment) -> talc::Span {
            talc::Span::from_base_size(segment.location, segment.size as usize)
        }
    }

    #[global_allocator]
    pub static ALLOCATOR: Talck<spin::Mutex<()>, ErrOnOom> = Talc::new(ErrOnOom).lock();
}

#[cfg(feature = "talc")]
pub fn heap_bytes_used() -> usize {
    talc_heap::ALLOCATOR
        .lock()
        .get_counters()
        .total_allocated_bytes as usize
}
