//! Random beat slicer example patch
//! To use this patch, you first need to create a new resource by uploading resources/AmenBreak.raw
//! There are two ways to do this:
//! 1. Use the patch library: https://www.rebeltech.org/patch-library/device
//! 2. Use FirmwareSender
//!
//! Param A: Number of Slices
//! Param B: Playback pitch (set to middle for 100%)
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

#[patch("Beat Slicer")]
fn run(mut pv: ProgramVector) -> ! {
    let audio_settings = pv.audio().settings;
    let mut buffer: Buffer<Interleaved, Box<[f32]>> =
        Buffer::new(audio_settings.channels, audio_settings.blocksize);

    let resources = pv.resources();

    let Ok(resource) = resources.get(c"AmenBreak.raw") else {
        error("failed to load resource");
    };

    // Get the resource data - if it's memory mapped we can use the slice directly,
    // otherwise we can load the data into a Box and continue from there.
    let boxed_data: Box<[u8]>;
    let data = if resource.is_memory_mapped() {
        resource.data().unwrap()
    } else {
        let d = resources
            .load_all(&resource)
            .expect("failed to load resource data");
        boxed_data = d;
        boxed_data.as_ref()
    };

    // Allocate an f32 sample buffer, and convert the samples from the resource file.
    // Using something like byte_slice_cast would be nice here, but there's no way to ensure the resource bytes are correctly aligned.
    let mut sample_buffer = Buffer::new_mono(resource.size() / 2);

    for (insamp, buffsamp) in data
        .into_iter()
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
            frame.fill(sample_buffer.index_cubic_smooth(index));

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
