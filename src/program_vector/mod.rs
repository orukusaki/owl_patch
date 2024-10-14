//! Communication with the Host OS
extern crate alloc;
use num::FromPrimitive;

use core::slice;

use crate::{ffi::program_vector as ffi, volts_per_octave::VoltsPerSample};

use ffi::ProgramVector as FfiProgramVector;

mod audio;
use audio::AudioFormat;
pub use audio::{AudioBuffers, AudioSettings};

mod parameters;
pub use parameters::Parameters;

mod messages;
use messages::Messages;
pub use messages::{debug_message, error};

mod midi;
pub use midi::Midi;

mod meta;
pub use meta::*;

mod service_call;
use service_call::{ServiceCall, SystemFunction};

const CONFIGURATION_ERROR_STATUS: i8 = ffi::CONFIGURATION_ERROR_STATUS as i8;
const AUDIO_FORMAT_24B16: u8 = ffi::AUDIO_FORMAT_24B16 as u8;
const AUDIO_FORMAT_24B32: u8 = ffi::AUDIO_FORMAT_24B32 as u8;
const AUDIO_FORMAT_FORMAT_MASK: u8 = ffi::AUDIO_FORMAT_FORMAT_MASK as u8;
const AUDIO_FORMAT_CHANNEL_MASK: u8 = ffi::AUDIO_FORMAT_CHANNEL_MASK as u8;

/// Shared object used to communicate with the host OS
///
/// You should not try to create it directly, use the [#\[patch\]] attribute macro instead.
///
/// [#\[patch\]]: crate::patch
pub struct ProgramVector {
    meta: Meta,
    audio: AudioBuffers,
    parameters: Parameters,
    service_call: ServiceCall,
    midi: Option<Midi>,
    volts_per_octave: Option<(VoltsPerSample, VoltsPerSample)>,
}

#[doc(hidden)]
#[cfg_attr(target_os = "none", link_section = ".pv")]
pub static mut PROGRAM_VECTOR: core::mem::MaybeUninit<FfiProgramVector> =
    core::mem::MaybeUninit::uninit();

impl ProgramVector {
    /// Create a new ProgramVector instance
    ///
    /// You should not call this directly, use the `#[patch]` attribute macro instead
    /// # Safety
    /// patch_name must be a valid pointer
    #[doc(hidden)]
    pub unsafe fn new(
        pv: &'static mut FfiProgramVector,
        patch_name: *const core::ffi::c_char,
    ) -> Self {
        Messages::init(&mut pv.message, &mut pv.error, pv.programStatus);

        let checksum = ProgramVectorChecksum::from_u8(pv.checksum)
            .expect("Program Vector checksum error - is your firmware up to date?");

        let meta = Meta::new(
            &pv.cycles_per_block,
            &mut pv.heap_bytes_used,
            checksum,
            pv.hardware_version,
            pv.heapLocations,
        );

        #[cfg(all(feature = "talc", target_os = "none"))]
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

    /// Get midi send/receive interface
    pub fn midi(&mut self) -> Midi {
        *self
            .midi
            .get_or_insert_with(|| Midi::init(&mut self.service_call))
    }

    /// Get patch parameter controller
    pub fn parameters(&mut self) -> Parameters {
        self.parameters
    }

    /// Get patch metadata
    pub fn meta(&mut self) -> &mut Meta {
        &mut self.meta
    }

    /// Get audio buffers
    pub fn audio(&mut self) -> &mut AudioBuffers {
        &mut self.audio
    }

    /// Get calibrated volts per sample convertors as a pair (input, output)
    ///
    /// ```
    /// let (vps_in, vps_out) = pv.volts_per_sample();
    /// ```
    pub fn volts_per_sample(&mut self) -> (VoltsPerSample, VoltsPerSample) {
        *self.volts_per_octave.get_or_insert_with(|| {
            let parameters = self.service_call.device_parameters();
            (
                VoltsPerSample::new(parameters.input_scalar, parameters.input_offset),
                VoltsPerSample::new(parameters.output_scalar, parameters.output_offset),
            )
        })
    }
}

#[cfg(all(feature = "talc", target_os = "none"))]
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

    /// get total bytes allocated at present
    pub fn heap_bytes_used() -> usize {
        ALLOCATOR.lock().get_counters().total_allocated_bytes as usize
    }
}

#[cfg(all(feature = "talc", target_os = "none"))]
pub use talc_heap::heap_bytes_used;
