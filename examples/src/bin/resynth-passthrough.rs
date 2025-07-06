//! Resynth test patch. Input 0 is Transformed using FFT into the frequency
//! domain and back again.
//! Output 0: resynthesized audio
//! Output 1: unprocessed passthrough
//!
//! The output on both channels should be identical, proving that
//! nothing is lost in the transforms

#![no_main]
#![no_std]
extern crate alloc;

use alloc::boxed::Box;
use owl_patch::{
    fft::{FftSize, RealFft},
    patch,
    program_vector::{heap_bytes_used, ProgramVector},
    sample_buffer::{ConvertFrom, ConvertTo, InterleavedBuffer},
};

use fundsp::hacker32::*;
use owl_patch_examples::resynth::Resynth;

const FFT_WIDTH: FftSize = FftSize::Size256;

#[patch("Passthrough test")]
fn run(mut pv: ProgramVector) -> ! {
    let audio_settings = pv.audio.settings;

    let mut buffer =
        InterleavedBuffer::<f32>::new(audio_settings.channels, audio_settings.blocksize);

    let fft = pv.fft_real(FFT_WIDTH).unwrap();

    let mut unit = build_network(fft, audio_settings.sample_rate as f32);
    unit.allocate();
    unit.set_sample_rate(audio_settings.sample_rate as f64);
    pv.meta.set_heap_bytes_used(heap_bytes_used());
    pv.audio.run(|input, output| {
        buffer.convert_from(input);

        for mut frame in buffer.frames_mut() {
            let fundsp_frame = Frame::from_slice(&frame.as_slice()[..1]);
            let output = unit.tick(fundsp_frame);
            frame.as_slice_mut().copy_from_slice(output.as_slice());
        }
        buffer.convert_to(output);
    });
}

#[inline(never)]
fn build_network(
    fft: RealFft,
    sample_rate: f32,
) -> Box<An<impl AudioNode<Inputs = U1, Outputs = U2>>> {
    let fft_size = fft.real_size();
    let resynth = |fft| {
        An(Resynth::<U1, U1, _>::new(fft, move |fft| {
            for i in 0..fft.bins() {
                fft.set(0, i, fft.at(0, i));
            }
        }))
    };

    Box::new((resynth(fft)) ^ delay((fft_size as f32) / sample_rate))
}
