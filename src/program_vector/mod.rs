//! Communication with the Host OS
extern crate alloc;

use crate::fft::{ComplexFft, FftSize, RealFft};
use cmsis_dsp_sys_pregenerated::{arm_cfft_instance_f32, arm_rfft_fast_instance_f32};
use core::mem::MaybeUninit;
use core::slice;
use num::FromPrimitive;

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

mod screen;
pub use screen::Screen;

mod meta;
pub use meta::*;

mod resources;
pub use resources::Resources;

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
    /// Metadata
    pub meta: Meta,
    /// Audio buffers
    pub audio: AudioBuffers,
    /// Patch parameter controller
    pub parameters: Parameters,
    service_call: ServiceCall,
}

#[doc(hidden)]
#[cfg_attr(target_arch = "arm", link_section = ".pv")]
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
            pv.registerPatch,
        );

        #[cfg(all(feature = "talc", target_arch = "arm"))]
        {
            let mut talc = talc_heap::ALLOCATOR.lock();
            meta.memory_segments().iter().for_each(|seg| unsafe {
                let _ = talc.claim(seg.into());
            });
        }

        meta.register_patch(patch_name);

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

        let service_call = ServiceCall::new(pv.serviceCall, pv.hardware_version);

        #[cfg(feature = "fastmaths")]
        {
            use service_call::SystemTable;

            if let Ok(table) = service_call.get_array(SystemTable::SystemTablePow) {
                crate::fastmaths::set_pow_table(table);
            }

            if let Ok(table) = service_call.get_array(SystemTable::SystemTableLog) {
                crate::fastmaths::set_log_table(table);
            }
        }

        Self {
            parameters,
            meta,
            audio,
            service_call,
        }
    }

    /// Get midi send/receive interface
    pub fn midi(&mut self) -> Midi {
        Midi::init(&mut self.service_call)
    }

    /// Get screen
    pub fn screen(&mut self) -> Screen {
        Screen::new(&self.service_call)
    }

    /// Get calibrated volts per sample convertors as a pair (input, output)
    ///
    /// ```
    /// # let mut pv = unsafe { owl_patch::test_harness::program_vector() };
    /// let (vps_in, vps_out) = pv.volts_per_sample();
    /// ```
    pub fn volts_per_sample(&mut self) -> (VoltsPerSample, VoltsPerSample) {
        let parameters = self.service_call.device_parameters();
        (
            VoltsPerSample::new(parameters.input_scalar, parameters.input_offset),
            VoltsPerSample::new(parameters.output_scalar, parameters.output_offset),
        )
    }

    /// Get resources service
    pub fn resources(&self) -> Resources {
        Resources::new(&self.service_call)
    }

    /// Create a new Real FFT processor instance
    pub fn fft_real(&self, size: FftSize) -> Result<RealFft, &str> {
        let mut instance = MaybeUninit::<arm_rfft_fast_instance_f32>::zeroed();

        self.service_call
            .init_rfft(instance.as_mut_ptr(), size as usize)?;

        // Check it really got initialised.  We created it zeroed, so if something went wrong it would still be zeroed now
        if unsafe { instance.assume_init_ref().fftLenRFFT } as usize != size as usize {
            Err("rfft instance was not initialised")
        } else {
            Ok(unsafe { RealFft::new(instance.assume_init()) })
        }
    }

    /// Create a new Complex FFT processor instance
    pub fn fft_complex(&self, size: FftSize) -> Result<ComplexFft, &str> {
        let mut instance = MaybeUninit::<arm_cfft_instance_f32>::zeroed();

        self.service_call
            .init_cfft(instance.as_mut_ptr(), size as usize)?;

        // Check it really got initialised.  We created it zeroed, so if something went wrong it would still be zeroed now
        if unsafe { instance.assume_init_ref().fftLen } as usize != size as usize {
            Err("rfft instance was not initialised")
        } else {
            Ok(unsafe { ComplexFft::new(instance.assume_init()) })
        }
    }
}

#[cfg(all(feature = "talc", target_arch = "arm"))]
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

#[cfg(all(feature = "talc", target_arch = "arm"))]
pub use talc_heap::heap_bytes_used;

#[cfg(all(feature = "talc", not(target_arch = "arm")))]
#[doc(hidden)]
pub fn heap_bytes_used() -> usize {
    0
}
