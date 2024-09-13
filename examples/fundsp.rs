#![no_main]
#![no_std]
extern crate alloc;

use alloc::boxed::Box;
use owl_patch::{
    heap::Heap,
    program_vector::{AudioFormat, AudioSettings, PatchParameterId, ProgramVector},
    sample_buffer::{Buffer, ConvertFrom, ConvertTo, Interleaved, Sample, Samplei32, Samplew16},
};

use fundsp::hacker32::*;

#[global_allocator]
pub static HEAP: Heap = Heap::new();

#[no_mangle]
pub extern "C" fn main() -> ! {
    // The ProgramVector lets us talk to the OS
    let pv = ProgramVector::instance();
    // Heap must be initialised before any heap allocations are attempted
    HEAP.init(pv.memory_segments());

    let audio_settings = pv.audio_settings();
    match audio_settings.format {
        AudioFormat::Format24B16 => run::<Samplew16>(pv, audio_settings),
        AudioFormat::Format24B32 => run::<Samplei32>(pv, audio_settings),
    }
}

fn run<F>(mut pv: ProgramVector<'static>, audio_settings: AudioSettings) -> !
where
    F: Sample<BaseType = i32> + From<f32>,
    f32: From<F>,
{
    let free_mem_start = HEAP.free_heap_size();

    // allocate a working buffer. Interleaved allows us to efficiently process data in frames
    let mut buffer: Buffer<f32, Interleaved> =
        Buffer::new(audio_settings.channels, audio_settings.blocksize);

    pv.register_patch("FunDsp Example", 2, 2);
    let (mut audio, parameters, _, mut meta) = pv.split();

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
    parameters.register(PatchParameterId::PARAMETER_A, "Center");
    parameters.register(PatchParameterId::PARAMETER_B, "Res");
    parameters.register(PatchParameterId::PARAMETER_C, "Split");

    meta.set_heap_bytes_used(free_mem_start - HEAP.free_heap_size());
    audio.run(|input, mut output| {
        let param_a = parameters.get(PatchParameterId::PARAMETER_A);
        let centre = param_a * param_a * 20000.0;
        let res = 0.3 + (parameters.get(PatchParameterId::PARAMETER_B) * 30.0);
        let split = parameters.get(PatchParameterId::PARAMETER_C) * 10000.0;

        lp_centre.set((centre + split).clamp(20.0, 22000.0));
        hp_centre.set((centre - split).clamp(20.0, 22000.0));
        q.set(res);

        buffer.convert_from(&input);

        for samples in buffer.frames_mut() {
            samples.copy_from_slice(unit.tick(Frame::from_slice(samples)).as_slice());
        }

        buffer.convert_to(&mut output);
    });
}
