//! FFT instances using CMSIS via FFI

use super::*;
use num::Complex;

/// Real FFT Processor - a wrapper around arm_rfft_fast_instance_f32
#[derive(Clone)]
pub struct CmsisRealFft {
    instance: cmsis_dsp_sys::arm_rfft_fast_instance_f32,
}

impl CmsisRealFft {
    pub(crate) fn new(instance: cmsis_dsp_sys::arm_rfft_fast_instance_f32) -> Self {
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
            cmsis_dsp_sys::arm_rfft_fast_f32(
                &self.instance as *const cmsis_dsp_sys::arm_rfft_fast_instance_f32,
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
            cmsis_dsp_sys::arm_rfft_fast_f32(
                &self.instance as *const cmsis_dsp_sys::arm_rfft_fast_instance_f32,
                src.as_mut_ptr() as *mut f32,
                dest.as_mut_ptr(),
                1,
            );
        }
    }
}

unsafe impl Send for CmsisRealFft {}
unsafe impl Sync for CmsisRealFft {}

/// Real Complex Processor - a wrapper around arm_cfft_instance_f32
#[derive(Clone)]
pub struct CmsisComplexFft {
    instance: cmsis_dsp_sys::arm_cfft_instance_f32,
}

impl CmsisComplexFft {
    pub(crate) fn new(instance: cmsis_dsp_sys::arm_cfft_instance_f32) -> Self {
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
            cmsis_dsp_sys::arm_cfft_f32(
                &self.instance as *const cmsis_dsp_sys::arm_cfft_instance_f32,
                buff.as_mut_ptr() as *mut f32,
                0,
                0,
            );
        }
    }

    fn ifft(&self, buff: &mut [Complex<f32>]) {
        assert!(buff.len() >= self.size(), "Input slice too small");

        unsafe {
            cmsis_dsp_sys::arm_cfft_f32(
                &self.instance as *const cmsis_dsp_sys::arm_cfft_instance_f32,
                buff.as_mut_ptr() as *mut f32,
                1,
                0,
            );
        }
    }
}

unsafe impl Send for CmsisComplexFft {}
unsafe impl Sync for CmsisComplexFft {}
