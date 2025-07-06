//! Frequency domain resynthesis.

// Shamelessly yoinked from FunDsp, modified to use the CMSIS fft transform
extern crate alloc;

use alloc::vec::Vec;
use fundsp::audionode::*;
use fundsp::math::*;
use fundsp::signal::*;
use fundsp::*;
use num_complex::Complex32;
use owl_patch::fft::RealFft;
use owl_patch::sample_buffer::BufferByChannel;

/// Number of overlapping FFT windows.
const WINDOWS: usize = 4;

/// A single FFT window. Contains input and output
/// values in the frequency domain.
#[derive(Clone)]
pub struct FftWindow {
    /// Window length. Must be a power of two and at least four.
    /// Equals the length of each input and output channel vector.
    length: usize,
    /// Input samples for each input channel.
    input: BufferByChannel<f32>,
    /// Input samples for each input channel in frequency domain.
    input_fft: BufferByChannel<Complex32>,
    /// Output samples for each output channel in frequency domain.
    output_fft: BufferByChannel<Complex32>,
    /// Output samples for each output channel.
    output: BufferByChannel<f32>,
    /// Sample rate for convenience.
    sample_rate: f32,
    /// Current index into input and output vectors.
    index: usize,
    /// Total number of processed samples.
    samples: u32,
}

impl FftWindow {
    /// FFT window length. This is a power of two and at least four.
    #[inline]
    fn length(&self) -> usize {
        self.length
    }

    /// Number of FFT bins.
    /// Equals the length of each frequency domain vector.
    /// The lowest bin is zero and the highest bin (corresponding to the Nyquist frequency) is `bins() - 1`.
    #[inline]
    pub fn bins(&self) -> usize {
        (self.length() >> 1) + 1
    }

    /// Return frequency (in Hz) associated with bin `i`.
    #[inline]
    pub fn frequency(&self, i: usize) -> f32 {
        self.sample_rate / self.length() as f32 * i as f32
    }

    /// Get input value at bin `i` of `channel`.
    #[inline]
    pub fn at(&self, channel: usize, i: usize) -> Complex32 {
        self.input_fft[channel][i]
    }

    /// Set output value for bin `i` of `channel`.
    #[inline]
    pub fn set(&mut self, channel: usize, i: usize, value: Complex32) {
        self.output_fft[channel][i] = value;
    }

    /// Create new window.
    fn new(length: usize, index: usize, inputs: usize, outputs: usize) -> Self {
        let complex_len = (length >> 1) + 1;
        Self {
            length,
            input: BufferByChannel::new(inputs, length),
            input_fft: BufferByChannel::new(inputs, complex_len),
            output_fft: BufferByChannel::new(outputs, complex_len),
            output: BufferByChannel::new(outputs, length),
            sample_rate: DEFAULT_SR as f32,
            index,
            samples: 0,
        }
    }

    /// Set the sample rate.
    fn set_sample_rate(&mut self, sample_rate: f32) {
        self.sample_rate = sample_rate;
    }

    /// Write input for current index.
    #[inline]
    fn write<N: Size<f32>>(&mut self, input: &Frame<f32, N>, window_value: f32) {
        for (item, channel) in input.iter().zip(self.input.channels_mut()) {
            channel[self.index] = item * window_value;
        }
    }

    /// Read output for current index.
    #[inline]
    fn read<N: Size<f32>>(&self, window_value: f32) -> Frame<f32, N> {
        Frame::generate(|channel| self.output[channel][self.index] * window_value)
    }

    /// Set FFT outputs to all zeros.
    fn clear_output(&mut self) {
        for channel in self.output_fft.channels_mut() {
            channel.fill(Complex32::default());
        }
    }

    /// Current read and write index.
    #[inline]
    fn index(&self) -> usize {
        self.index
    }

    /// Reset the window to an empty state.
    fn reset(&mut self, start_index: usize) {
        self.samples = 0;
        self.index = start_index;

        for channel in self.input.channels_mut() {
            channel.fill(0.0);
        }

        for channel in self.output.channels_mut() {
            channel.fill(0.0);
        }
    }

    /// Advance index to the next sample.
    #[inline]
    fn advance(&mut self) {
        self.samples = self.samples.wrapping_add(1);
        self.index = (self.index + 1) & (self.length - 1);
    }

    /// Return whether we should do FFT processing right now.
    #[inline]
    fn is_fft_time(&self) -> bool {
        self.index == 0 && self.samples >= self.length as u32
    }

    fn forward_transform(&mut self, fft: &RealFft) {
        let last = self.bins() - 1;
        for (input, input_fft) in self.input.channels_mut().zip(self.input_fft.channels_mut()) {
            fft.fft(input.as_slice_mut(), input_fft.as_slice_mut());
            // unpack
            input_fft[last] = Complex32::new(input_fft[0].im, 0.0);
            input_fft[0].im = 0.0;
        }
    }

    fn inverse_transform(&mut self, fft: &RealFft) {
        let last = self.bins() - 1;
        for (output_fft, output_scalar) in self
            .output_fft
            .channels_mut()
            .zip(self.output.channels_mut())
        {
            // repack
            output_fft[0].im = output_fft[last].re;

            fft.ifft(output_fft.as_slice_mut(), output_scalar.as_slice_mut());
        }
    }
}

#[derive(Clone)]
pub struct Resynth<I, O, F>
where
    I: Size<f32>,
    O: Size<f32>,
    F: FnMut(&mut FftWindow) + Clone + Send + Sync,
{
    fft: RealFft,

    _marker: core::marker::PhantomData<(I, O)>,
    /// FFT windows.
    window: [FftWindow; WINDOWS],
    /// Window length.
    window_length: usize,
    /// Hann window function.
    window_function: Vec<f32>,
    /// Processing function.
    processing: F,
    /// Sample rate.
    sample_rate: f64,
    /// Number of processed samples.
    samples: u32,
}

impl<I, O, F> Resynth<I, O, F>
where
    I: Size<f32>,
    O: Size<f32>,
    F: FnMut(&mut FftWindow) + Clone + Send + Sync,
{
    const Z: f32 = 2.0 / 3.0;

    /// Number of FFT bins. Equals the length of each frequency domain vector in FFT windows.
    #[inline]
    pub fn bins(&self) -> usize {
        (self.window_length >> 1) + 1
    }

    /// Window length in samples.
    #[inline]
    pub fn window_length(&self) -> usize {
        self.window_length
    }

    pub fn new(fft: RealFft, processing: F) -> Self {
        let window_length = fft.real_size();

        let mut window_function = Vec::with_capacity(window_length);

        for i in 0..window_length {
            let hann = 0.5
                + 0.5
                    * cos((i as i32 - (window_length >> 1) as i32) as f32 * f32::TAU
                        / window_length as f32);
            window_function.push(hann);
        }

        let window = [
            FftWindow::new(window_length, 0, I::USIZE, O::USIZE),
            FftWindow::new(window_length, window_length >> 2, I::USIZE, O::USIZE),
            FftWindow::new(window_length, window_length >> 1, I::USIZE, O::USIZE),
            FftWindow::new(
                window_length,
                (window_length >> 1) + (window_length >> 2),
                I::USIZE,
                O::USIZE,
            ),
        ];

        Self {
            fft,
            _marker: core::marker::PhantomData,
            window,
            window_length,
            window_function,
            processing,
            sample_rate: DEFAULT_SR,
            samples: 0,
        }
    }
}

impl<I, O, F> AudioNode for Resynth<I, O, F>
where
    I: Size<f32>,
    O: Size<f32>,
    F: FnMut(&mut FftWindow) + Clone + Send + Sync,
{
    const ID: u64 = 80;
    type Inputs = I;
    type Outputs = O;

    fn set_sample_rate(&mut self, sample_rate: f64) {
        self.sample_rate = sample_rate;
        for window in self.window.iter_mut() {
            window.set_sample_rate(sample_rate as f32);
        }
    }

    fn reset(&mut self) {
        self.samples = 0;
        for (i, window) in self.window.iter_mut().enumerate() {
            window.reset(i * (self.window_length >> 2));
        }
    }

    fn tick(&mut self, input: &Frame<f32, Self::Inputs>) -> Frame<f32, Self::Outputs> {
        let mut output = Frame::default();

        for window in self.window.iter_mut() {
            let window_value = self.window_function[window.index()];
            window.write(input, window_value);
            output += window.read(window_value * Self::Z);
            window.advance();
        }

        self.samples = self.samples.wrapping_add(1);

        if self.samples & ((self.window_length as u32 >> 2) - 1) == 0 {
            for window in self.window.iter_mut().filter(|window| window.is_fft_time()) {
                window.forward_transform(&self.fft);
                window.clear_output();

                (self.processing)(window);

                window.inverse_transform(&self.fft);
            }
        }
        output
    }

    fn route(&mut self, input: &SignalFrame, _frequency: f64) -> SignalFrame {
        Routing::Arbitrary(self.window_length as f64).route(input, self.outputs())
    }
}
