//! Vocoder example patch. Input 0 is the carrier, Input 1 is the modulator.
//! Output 0 is the vocoder output.
//! Param A: How many bands the vocoder has, max 128.
//! Param B: Formant shift, leave at 50% for no shift.
//! Param C/D: Attack / Release for each band.
#![no_main]
#![no_std]
extern crate alloc;

use alloc::boxed::Box;
use owl_patch::{
    fastmaths::FastFloat,
    fft::{FftSize, RealFft},
    patch,
    program_vector::{heap_bytes_used, ProgramVector},
    sample_buffer::{Buffer, ConvertFrom, ConvertTo},
    PatchParameterId,
};

use fundsp::hacker32::*;
use owl_patch_examples::resynth::Resynth;

// 256 seems to work well on Owl3, Owl2 needs a lower value.
// The low blocksize (32) is the killer here, it doesn't leave enough time to do a larger FFT transform
// With the blocksize set to 256, Owl3 can run happily with a 4096 FFT size
const FFT_WIDTH: FftSize = FftSize::Size256;
const BINS: usize = (FFT_WIDTH as usize >> 1) + 1;
const MAX_BANDS_POWER: f32 = ((FFT_WIDTH as usize >> 1) - 1).count_ones() as f32;

#[patch("Vocoder")]
fn run(mut pv: ProgramVector) -> ! {
    let audio_settings = pv.audio().settings;

    let mut buffer = Buffer::new(audio_settings.channels, audio_settings.blocksize);

    let parameters = pv.parameters();
    parameters.register(PatchParameterId::PARAMETER_A, "Bands");
    parameters.register(PatchParameterId::PARAMETER_B, "Formant Shift");
    parameters.register(PatchParameterId::PARAMETER_C, "Attack");
    parameters.register(PatchParameterId::PARAMETER_D, "Release");

    let bands = Shared::new(0.0);
    let formant_shift = Shared::new(0.0);
    let attack = Shared::new(0.0);
    let release = Shared::new(0.0);

    let fft = Box::new(pv.fft_real(FFT_WIDTH).unwrap());

    let mut unit = build_network(
        bands.clone(),
        formant_shift.clone(),
        attack.clone(),
        release.clone(),
        fft.as_ref(),
    );
    unit.allocate();
    unit.set_sample_rate(audio_settings.sample_rate as f64);
    pv.meta().set_heap_bytes_used(heap_bytes_used());
    pv.audio().run(|input, output| {
        let bands_power = ((parameters.get(PatchParameterId::PARAMETER_A) + 0.1) * MAX_BANDS_POWER)
            .clamp(0.0, MAX_BANDS_POWER);

        bands.set(bands_power.fast_exp2());
        formant_shift.set(2.0 - parameters.get(PatchParameterId::PARAMETER_B) * 2.0);

        let sr = audio_settings.sample_rate as f32;
        let attack_time = parameters.get(PatchParameterId::PARAMETER_C) * 0.001;
        attack.set(FastFloat::fast_exp(-1.0 / (sr * attack_time)));

        let release_time = parameters.get(PatchParameterId::PARAMETER_D) * 0.01;
        release.set(FastFloat::fast_exp(-1.0 / (sr * release_time)));

        buffer.convert_from(input);

        for samples in buffer.frames_mut() {
            let slice = &mut samples[..2];
            let frame = Frame::from_slice(slice);
            samples[0] = unit.tick(frame)[0];
        }

        buffer.convert_to(output);
    });
}

#[inline(never)]
fn build_network<'a>(
    bands: Shared,
    formant_shift: Shared,
    attack: Shared,
    release: Shared,
    fft: &'a dyn RealFft,
) -> Box<An<impl AudioNode + use<'a>>> {
    Box::new({
        let mut envelopes = EnvelopeBank::<BINS>::new(0.0, 0.0);
        let mut amplitudes = [0.0; BINS];

        An(Resynth::<U2, U1, _>::new(fft, move |fft| {
            let n_bands = bands.value() as usize;
            let squish_factor = BINS / n_bands;
            let formant_shift_val = formant_shift.value();
            let attack_val = attack.value();
            let release_val = release.value();

            envelopes.set_attack(attack_val);
            envelopes.set_release(release_val);

            // Get aplitudes for all frequency bands using formant_shift to scale the index, lerping the result
            amplitudes
                .iter_mut()
                .enumerate()
                .for_each(|(i, amplitude)| {
                    let fractional_index =
                        (i as f32 * formant_shift_val).clamp(0.0, (fft.bins() - 1) as f32);
                    let index_f = fractional_index.floor();
                    let index_c = fractional_index.ceil();
                    let alpha = fractional_index - index_f;

                    let c0 = fft.at(1, index_f as usize);
                    let c1 = fft.at(1, index_c as usize);
                    *amplitude = (c0 + (c1 - c0) * alpha).norm();
                });

            // noise gate
            amplitudes
                .iter_mut()
                .for_each(|a| *a = (*a * 1.01 - 0.01).clamp(0.0, 1.0));

            // condense the amplitudes into the number of bands desired
            for i in 0..n_bands {
                let a = amplitudes[i * squish_factor..(i + 1) * squish_factor]
                    .iter()
                    .sum::<f32>()
                    / squish_factor as f32;
                amplitudes[i] = a;
            }

            // Apply the amplitudes to the carrier signal
            for i in 0..fft.bins() {
                let carrier = fft.at(0, i);
                let out = carrier.scale(envelopes.process(i, amplitudes[i / squish_factor]));

                fft.set(0, i, out);
            }
        }))
    })
}

#[derive(Clone, Copy, Default)]
struct AREnv {
    yn1: f32,
}

impl AREnv {
    pub fn process(&mut self, x: f32, attack: f32, release: f32) -> f32 {
        if x > self.yn1 {
            self.yn1 = x - attack * (x - self.yn1);
        } else {
            self.yn1 = x - release * (x - self.yn1);
        }
        self.yn1
    }
}

#[derive(Clone, Copy)]
struct EnvelopeBank<const N: usize> {
    slots: [AREnv; N],
    attack: f32,
    release: f32,
}

impl<const N: usize> EnvelopeBank<N> {
    pub fn new(attack: f32, release: f32) -> Self {
        Self {
            attack,
            release,
            slots: [AREnv::default(); N],
        }
    }

    pub fn set_attack(&mut self, attack: f32) {
        self.attack = attack;
    }

    pub fn set_release(&mut self, release: f32) {
        self.release = release;
    }

    pub fn process(&mut self, n: usize, x: f32) -> f32 {
        self.slots[n].process(x, self.attack, self.release)
    }
}
