//! FFT instances using CMSIS via FFI

use super::*;
use cmsis_dsp_sys_pregenerated::{
    arm_cfft_f32, arm_cfft_instance_f32, arm_rfft_fast_f32, arm_rfft_fast_instance_f32,
};
use num::Complex;

/// Real FFT Processor - a wrapper around arm_rfft_fast_instance_f32
pub struct CmsisRealFft {
    instance: arm_rfft_fast_instance_f32,
}

impl CmsisRealFft {
    pub(crate) fn new(instance: arm_rfft_fast_instance_f32) -> Self {
        Self { instance }
    }
}
impl RealFft for CmsisRealFft {
    fn real_size(&self) -> usize {
        self.instance.fftLenRFFT as usize
    }

    fn complex_size(&self) -> usize {
        (self.instance.fftLenRFFT / 2) as usize
    }

    fn fft(&self, src: &mut [f32], dest: &mut [Complex<f32>]) {
        assert!(src.len() >= self.real_size(), "Input slice too small");
        assert!(dest.len() >= self.complex_size(), "Output slice too small");

        unsafe {
            arm_rfft_fast_f32(
                &self.instance as *const arm_rfft_fast_instance_f32,
                src.as_mut_ptr(),
                dest.as_mut_ptr() as *mut f32,
                0,
            );
        }
    }

    fn ifft(&self, src: &mut [Complex<f32>], dest: &mut [f32]) {
        assert!(src.len() >= self.complex_size(), "Input slice too small");
        assert!(dest.len() >= self.real_size(), "Output slice too small");

        unsafe {
            arm_rfft_fast_f32(
                &self.instance as *const arm_rfft_fast_instance_f32,
                src.as_mut_ptr() as *mut f32,
                dest.as_mut_ptr(),
                1,
            );
        }
    }
}

impl Clone for CmsisRealFft {
    fn clone(&self) -> Self {
        Self {
            instance: arm_rfft_fast_instance_f32 {
                Sint: arm_cfft_instance_f32 {
                    fftLen: self.instance.Sint.fftLen,
                    pTwiddle: self.instance.Sint.pTwiddle,
                    pBitRevTable: self.instance.Sint.pBitRevTable,
                    bitRevLength: self.instance.Sint.bitRevLength,
                },

                fftLenRFFT: self.instance.fftLenRFFT,
                pTwiddleRFFT: self.instance.pTwiddleRFFT,
            },
        }
    }
}

unsafe impl Send for CmsisRealFft {}
unsafe impl Sync for CmsisRealFft {}

/// Real Complex Processor - a wrapper around arm_cfft_instance_f32
pub struct CmsisComplexFft {
    instance: arm_cfft_instance_f32,
}

impl CmsisComplexFft {
    pub(crate) fn new(instance: arm_cfft_instance_f32) -> Self {
        Self { instance }
    }
}
impl ComplexFft for CmsisComplexFft {
    fn size(&self) -> usize {
        self.instance.fftLen as usize
    }

    fn fft(&self, buff: &mut [Complex<f32>]) {
        assert!(buff.len() >= self.size(), "Input slice too small");

        unsafe {
            arm_cfft_f32(
                &self.instance as *const arm_cfft_instance_f32,
                buff.as_mut_ptr() as *mut f32,
                0,
                0,
            );
        }
    }

    fn ifft(&self, buff: &mut [Complex<f32>]) {
        assert!(buff.len() >= self.size(), "Input slice too small");

        unsafe {
            arm_cfft_f32(
                &self.instance as *const arm_cfft_instance_f32,
                buff.as_mut_ptr() as *mut f32,
                1,
                0,
            );
        }
    }
}

impl Clone for CmsisComplexFft {
    fn clone(&self) -> Self {
        Self {
            instance: arm_cfft_instance_f32 {
                fftLen: self.instance.fftLen,
                pTwiddle: self.instance.pTwiddle,
                pBitRevTable: self.instance.pBitRevTable,
                bitRevLength: self.instance.bitRevLength,
            },
        }
    }
}

unsafe impl Send for CmsisComplexFft {}
unsafe impl Sync for CmsisComplexFft {}
