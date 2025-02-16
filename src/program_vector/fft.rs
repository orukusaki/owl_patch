use super::*;
use crate::fft::{ComplexFft, FftSize, RealFft};
use cmsis_dsp_sys_pregenerated::{arm_cfft_instance_f32, arm_rfft_fast_instance_f32};
use core::mem::MaybeUninit;
impl ProgramVector {
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
    #[cfg(target_arch = "arm")]
    pub fn fft_complex(&self, size: FftSize) -> Result<crate::fft::ComplexFft, &str> {
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
