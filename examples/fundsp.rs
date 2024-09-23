#![no_main]
#![no_std]
extern crate alloc;

use alloc::boxed::Box;
use owl_patch::{
    program_vector::{heap_bytes_used, PatchParameterId, ProgramVector},
    sample_buffer::{Buffer, ConvertFrom, ConvertTo, Interleaved},
};

use fundsp::hacker32::*;

#[no_mangle]
pub extern "C" fn main() -> ! {
    // The ProgramVector lets us talk to the OS
    let mut pv = ProgramVector::take();

    let audio_settings = pv.audio.settings;

    // allocate a working buffer. Interleaved allows us to efficiently process data in frames
    let mut buffer: Buffer<f32, Interleaved> =
        Buffer::new(audio_settings.channels, audio_settings.blocksize);

    // Set up FunDsp objects
    let lp_centre = shared(10000.0);
    let hp_centre = shared(10000.0);
    let q = shared(0.7);

    let lp = || (pass() | var(&lp_centre) | var(&q)) >> lowpass();
    let hp = || (pass() | var(&hp_centre) | var(&q)) >> highpass();

    let mut unit = Box::new((lp() | lp()) >> (hp() | hp()) >> limiter_stereo(0.00, 0.1));

    unit.allocate();
    unit.set_sample_rate(audio_settings.sample_rate as f64);

    // Set up input parameters
    let parameters = pv.parameters;
    parameters.register(PatchParameterId::PARAMETER_A, "Center");
    parameters.register(PatchParameterId::PARAMETER_B, "Res");
    parameters.register(PatchParameterId::PARAMETER_C, "Split");

    // For correct reporting, this should be called after all heap allocations are done with.
    pv.meta.set_heap_bytes_used(heap_bytes_used());

    pv.audio.run(|input, output| {
        let param_a = parameters.get(PatchParameterId::PARAMETER_A);
        let centre = param_a * param_a * 20000.0;
        let res = 0.3 + (parameters.get(PatchParameterId::PARAMETER_B) * 30.0);
        let split = parameters.get(PatchParameterId::PARAMETER_C) * 10000.0;

        lp_centre.set((centre + split).clamp(20.0, 22000.0));
        hp_centre.set((centre - split).clamp(20.0, 22000.0));
        q.set(res);

        buffer.convert_from(input);

        for samples in buffer.frames_mut() {
            let slice = &mut samples[0..2];
            let frame = Frame::from_slice(slice);
            slice.copy_from_slice(unit.tick(frame).as_slice());
        }

        buffer.convert_to(output);
    });
}
