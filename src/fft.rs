//! FFT instances using CMSIS via FFI
use cmsis_dsp_sys_pregenerated::{
    arm_cfft_f32, arm_cfft_instance_f32, arm_rfft_fast_f32, arm_rfft_fast_instance_f32,
};
use num::Complex;

/// FFT Size.
/// Avoid 128 as it seems to be broken in the current device firmware
#[derive(Clone, Copy)]
#[repr(usize)]
pub enum FftSize {
    /// FFT Size 32
    Size32 = 32,
    /// FFT Size 64
    Size64 = 64,
    /// FFT Size 28
    Size128 = 128,
    /// FFT Size 56
    Size256 = 256,
    /// FFT Size 12
    Size512 = 512,
    /// FFT Size 24
    Size1024 = 1024,
    /// FFT Size 48
    Size2048 = 2048,
    /// FFT Size 96
    Size4096 = 4096,
}

/// Real FFT Processor - a wrapper around arm_rfft_fast_instance_f32
pub struct RealFft {
    instance: arm_rfft_fast_instance_f32,
}

impl RealFft {
    pub(crate) fn new(instance: arm_rfft_fast_instance_f32) -> Self {
        Self { instance }
    }
    /// FFT Size in real samples
    pub fn real_size(&self) -> usize {
        self.instance.fftLenRFFT as usize
    }
    /// Complex size: real_size() / 2
    pub fn complex_size(&self) -> usize {
        (self.instance.fftLenRFFT / 2) as usize
    }
    /// Perform forward FFT transform
    pub fn fft(&self, src: &mut [f32], dest: &mut [Complex<f32>]) {
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
    /// Perform inverse FFT transform
    pub fn ifft(&self, src: &mut [Complex<f32>], dest: &mut [f32]) {
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

impl Clone for RealFft {
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

unsafe impl Send for RealFft {}
unsafe impl Sync for RealFft {}

/// Real Complex Processor - a wrapper around arm_cfft_instance_f32
pub struct ComplexFft {
    instance: arm_cfft_instance_f32,
}

impl ComplexFft {
    pub(crate) fn new(instance: arm_cfft_instance_f32) -> Self {
        Self { instance }
    }
    /// FFT Size
    pub fn size(&self) -> usize {
        self.instance.fftLen as usize
    }
    /// Perform forward FFT transform
    pub fn fft(&self, buff: &mut [Complex<f32>]) {
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
    /// Perform inverse FFT transform
    pub fn ifft(&self, buff: &mut [Complex<f32>]) {
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

impl Clone for ComplexFft {
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

unsafe impl Send for ComplexFft {}
unsafe impl Sync for ComplexFft {}
