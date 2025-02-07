use super::*;
use num::Complex;

#[derive(Clone)]
pub struct MicroFftRealFft {}

impl MicroFftRealFft {
    pub(crate) fn new(size: FftSize) -> Self {
        Self {}
    }
}
impl RealFft for MicroFftRealFft {
    fn real_size(&self) -> usize {
        0
    }

    fn complex_size(&self) -> usize {
        0
    }

    fn fft(&self, src: &mut [f32], dest: &mut [Complex<f32>]) {
        unimplemented!();
    }

    fn ifft(&self, src: &mut [Complex<f32>], dest: &mut [f32]) {
        unimplemented!();
    }
}

unsafe impl Send for MicroFftRealFft {}
unsafe impl Sync for MicroFftRealFft {}

#[derive(Clone)]
pub struct MicroFftComplexFft {}

impl MicroFftComplexFft {
    pub(crate) fn new(size: FftSize) -> Self {
        Self {}
    }
}
impl ComplexFft for MicroFftComplexFft {
    fn size(&self) -> usize {
        0
    }

    fn fft(&self, buff: &mut [Complex<f32>]) {
        unimplemented!();
    }

    fn ifft(&self, buff: &mut [Complex<f32>]) {
        unimplemented!();
    }
}

unsafe impl Send for MicroFftComplexFft {}
unsafe impl Sync for MicroFftComplexFft {}
