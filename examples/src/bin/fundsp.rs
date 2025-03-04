#![no_main]
#![no_std]
extern crate alloc;

use alloc::boxed::Box;
use owl_patch::{
    patch,
    program_vector::{heap_bytes_used, ProgramVector},
    sample_buffer::{ConvertFrom, ConvertTo, InterleavedBuffer},
    PatchParameterId,
};

use fundsp::hacker32::*;

#[patch("FunDsp Example")]
fn run(mut pv: ProgramVector) -> ! {
    let audio_settings = pv.audio().settings;

    // allocate a working buffer. Interleaved allows us to efficiently process data in frames
    let mut buffer =
        InterleavedBuffer::<f32>::new(audio_settings.channels, audio_settings.blocksize);

    // Set up FunDsp objects
    let lp_centre = shared(10000.0);
    let hp_centre = shared(10000.0);
    let q = shared(0.7);

    let mut network = build_network(lp_centre.clone(), hp_centre.clone(), q.clone());

    network.allocate();
    network.set_sample_rate(audio_settings.sample_rate as f64);

    // Set up input parameters
    let parameters = pv.parameters();
    parameters.register(PatchParameterId::PARAMETER_A, "Center");
    parameters.register(PatchParameterId::PARAMETER_B, "Res");
    parameters.register(PatchParameterId::PARAMETER_C, "Split");

    // For correct reporting, this should be called after all heap allocations are done with.
    pv.meta().set_heap_bytes_used(heap_bytes_used());

    pv.audio().run(|input, output| {
        let param_a = parameters.get(PatchParameterId::PARAMETER_A);
        let centre = param_a * param_a * 20000.0;
        let res = 0.3 + (parameters.get(PatchParameterId::PARAMETER_B) * 30.0);
        let split = parameters.get(PatchParameterId::PARAMETER_C) * 10000.0;

        lp_centre.set((centre + split).clamp(20.0, 22000.0));
        hp_centre.set((centre - split).clamp(20.0, 22000.0));
        q.set(res);

        buffer.convert_from(input);

        for frame in buffer.frames_mut() {
            let fundsp_frame = Frame::from_slice(&frame.as_slice()[..2]);
            let output = network.tick(fundsp_frame);
            frame.as_slice_mut()[..2].copy_from_slice(output.as_slice());
        }

        buffer.convert_to(output);
    });
}

// Rust likes to optimize Heap allocation into Stack allocation.  We have very limited stack memory available,
// moving the network creation into a separate factory function prevents this optimization.
#[inline(never)]
fn build_network(
    lp_centre: Shared,
    hp_centre: Shared,
    q: Shared,
) -> Box<An<impl AudioNode<Inputs = U2, Outputs = U2>>> {
    // Set up FunDsp objects

    let lp = || (pass() | var(&lp_centre) | var(&q)) >> lowpass();
    let hp = || (pass() | var(&hp_centre) | var(&q)) >> highpass();

    Box::new((lp() | lp()) >> (hp() | hp()) >> limiter_stereo(0.00, 0.1))
}
