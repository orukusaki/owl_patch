//! FFT instances
use num::Complex;

#[cfg(target_arch = "arm")]
pub mod cmsis;

#[cfg(not(target_arch = "arm"))]
#[doc(hidden)]
pub mod microfft;

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

/// Real FFT trait
pub trait RealFft: Sync {
    /// FFT Size in real samples
    fn real_size(&self) -> usize;

    /// Complex size: real_size() / 2
    fn complex_size(&self) -> usize;

    /// Perform forward FFT transform
    fn fft(&self, src: &mut [f32], dest: &mut [Complex<f32>]);

    /// Perform inverse FFT transform
    fn ifft(&self, src: &mut [Complex<f32>], dest: &mut [f32]);
}

/// Complex FFT trait
pub trait ComplexFft: Sync {
    /// FFT Size
    fn size(&self) -> usize;

    /// Perform forward FFT transform
    fn fft(&self, buff: &mut [Complex<f32>]);

    /// Perform inverse FFT transform
    fn ifft(&self, buff: &mut [Complex<f32>]);
}
