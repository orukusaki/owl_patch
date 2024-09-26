extern crate alloc;

use core::slice;

use crate::{ffi::program_vector as ffi, volts_per_octave::VoltsPerOctave};

use ffi::ProgramVector as FfiProgramVector;

mod audio;
pub use audio::{AudioBuffers, AudioFormat, AudioSettings};

mod parameters;
pub use parameters::{Parameters, PatchButtonId, PatchParameterId};

mod messages;
use messages::Messages;
pub use messages::{debug_message, error};

mod midi;
pub use midi::Midi;

mod meta;
pub use meta::Meta;

mod service_call;
pub use service_call::DeviceParameters;
use service_call::{ServiceCall, SystemFunction};

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

// Owned wrapper around the static ProgramVector instance
pub struct ProgramVector {
    pub parameters: Parameters,
    pub meta: Meta,
    pub audio: AudioBuffers,
    pub service_call: ServiceCall,
    midi: Option<Midi>,
    volts_per_octave: Option<VoltsPerOctave>,
}

impl ProgramVector {
    /// # Safety
    /// patch_name must be a valid pointer
    pub unsafe fn new(
        pv: &'static mut FfiProgramVector,
        patch_name: *const core::ffi::c_char,
    ) -> Self {
        Messages::init(&mut pv.message, &mut pv.error, pv.programStatus);

        // if the checksum is valid, then the vector was initialised
        if pv.checksum < PROGRAM_VECTOR_CHECKSUM_V13 {
            panic!("Program Vector checksum error - is your firmware up to date?");
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

        // Register the patch by calling the provided function in the pv. It seems like the channel counts
        // are ignored presently, the number of channels set in pv.audio_format is defined by the hardware
        // The only thing it really does is display the patch name on devices with a screen
        if let Some(register_patch) = pv.registerPatch {
            unsafe { register_patch(patch_name, 2, 2) };
        }

        let (format, channels) = AudioFormat::parse(pv.audio_format);
        let audio_settings = AudioSettings {
            sample_rate: pv.audio_samplingrate as usize,
            blocksize: pv.audio_blocksize as usize,
            channels,
            format,
        };

        let parameters = Parameters::new(
            unsafe { slice::from_raw_parts(pv.parameters, pv.parameters_size as usize) },
            &pv.buttons,
            pv.registerPatchParameter,
            pv.setPatchParameter,
            pv.setButton,
            &mut pv.buttonChangedCallback,
        );

        let audio = AudioBuffers::new(
            &pv.audio_input,
            &pv.audio_output,
            audio_settings,
            pv.programReady,
        );

        Self {
            parameters,
            meta,
            audio,
            service_call: ServiceCall::new(pv.serviceCall, pv.hardware_version),
            midi: None,
            volts_per_octave: None,
        }
    }

    pub fn midi(&mut self) -> Midi {
        *self
            .midi
            .get_or_insert_with(|| Midi::init(&mut self.service_call))
    }

    pub fn volts_per_octave(&mut self) -> VoltsPerOctave {
        *self
            .volts_per_octave
            .get_or_insert_with(|| VoltsPerOctave::new(self.service_call.device_parameters()))
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

    pub fn heap_bytes_used() -> usize {
        ALLOCATOR.lock().get_counters().total_allocated_bytes as usize
    }
}

#[cfg(feature = "talc")]
pub use talc_heap::heap_bytes_used;
