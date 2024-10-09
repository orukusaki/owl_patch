#![no_main]
#![no_std]

use owl_patch::{
    patch,
    program_vector::{heap_bytes_used, ProgramVector},
    sample_buffer::{Buffer, Channels, ConvertFrom, ConvertTo},
};

#[patch("Minimal")]
fn run(mut pv: ProgramVector) -> ! {
    let audio_settings = pv.audio.settings;
    // allocate a working buffer (uses vec intenally)
    let mut buffer: Buffer<f32, Channels, _> =
        Buffer::new(audio_settings.channels, audio_settings.blocksize);

    // For correct reporting, this should be called after all heap allocations are done with.
    pv.meta.set_heap_bytes_used(heap_bytes_used());

    // Main audio loop
    pv.audio.run(|input, output| {
        buffer.convert_from(input);
        buffer.convert_to(output);
    });
}