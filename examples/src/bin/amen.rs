#![no_main]
#![no_std]
#![feature(iter_array_chunks)]
extern crate alloc;

use alloc::boxed::Box;
use fundsp::math::rnd1;
use num_traits::Float;
use owl_patch::sample_buffer::Interleaved;
use owl_patch::PatchParameterId;
use owl_patch::{
    fastmaths::FastFloat,
    patch,
    program_vector::{error, heap_bytes_used, ProgramVector},
    sample_buffer::{Buffer, ConvertTo},
};

#[patch("Amen Chop")]
fn run(mut pv: ProgramVector) -> ! {
    let audio_settings = pv.audio().settings;
    let mut buffer: Buffer<Interleaved, Box<[f32]>> =
        Buffer::new(audio_settings.channels, audio_settings.blocksize);

    let Ok(resource) = pv.get_resource(c"AmenBreak.raw") else {
        error("failed to load resource");
    };

    let mut sample_buffer = Buffer::new_mono(resource.len() / 2);
    for (insamp, buffsamp) in resource
        .as_ref()
        .iter()
        .array_chunks::<2>()
        .map(|bytes| i16::from_le_bytes(bytes.map(|b| *b)))
        .zip(sample_buffer.samples_mut())
    {
        *buffsamp = insamp as f32 * (1.0 / i16::MAX as f32);
    }

    let mut index = 0.0;
    let mut slice_start = 0.0;

    let parameters = pv.parameters();
    parameters.register(PatchParameterId::PARAMETER_A, "Divisions");
    parameters.register(PatchParameterId::PARAMETER_B, "Pitch");

    pv.meta().set_heap_bytes_used(heap_bytes_used());

    let mut rnd_seed = (parameters.get(PatchParameterId::PARAMETER_A) * 32768.0) as u64;

    // Main audio loop
    pv.audio().run(|_input, output| {
        let divisions = (parameters.get(PatchParameterId::PARAMETER_A) * 6.0)
            .round()
            .fast_exp2();

        let slice_size = sample_buffer.len() as f32 / divisions;
        let slice_end = (slice_start + slice_size).min(sample_buffer.len() as f32);
        let inc = parameters.get(PatchParameterId::PARAMETER_B) * 2.0;

        for frame in buffer.frames_mut() {
            frame.fill(sample_buffer.index_lerp(index));

            index += inc;

            if index >= slice_end {
                let slice_num = (rnd1(rnd_seed) as f32 * (divisions - 1.0)).round();
                slice_start = slice_num * slice_size;
                index = slice_start;
            }
            rnd_seed = rnd_seed.wrapping_add(1);
        }

        buffer.convert_to(output);
    });
}
