use super::*;
use num::Complex;

#[derive(Clone)]
pub struct MicroFftRealFft {}

impl MicroFftRealFft {
    pub(crate) fn new(_size: FftSize) -> Self {
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

    fn fft(&self, _src: &mut [f32], _dest: &mut [Complex<f32>]) {
        unimplemented!();
    }

    fn ifft(&self, _src: &mut [Complex<f32>], _dest: &mut [f32]) {
        unimplemented!();
    }
}

unsafe impl Send for MicroFftRealFft {}
unsafe impl Sync for MicroFftRealFft {}

#[derive(Clone)]
pub struct MicroFftComplexFft {}

impl MicroFftComplexFft {
    pub(crate) fn new(_size: FftSize) -> Self {
        Self {}
    }
}
impl ComplexFft for MicroFftComplexFft {
    fn size(&self) -> usize {
        0
    }

    fn fft(&self, _buff: &mut [Complex<f32>]) {
        unimplemented!();
    }

    fn ifft(&self, _buff: &mut [Complex<f32>]) {
        unimplemented!();
    }
}

unsafe impl Send for MicroFftComplexFft {}
unsafe impl Sync for MicroFftComplexFft {}
