#![no_main]
#![no_std]
extern crate alloc;

use owl_patch::{
    program_vector::{heap_bytes_used, ProgramVector},
    sample_buffer::{Buffer, Channels, ConvertFrom, ConvertTo},
};

#[no_mangle]
pub extern "C" fn main() -> ! {
    // The ProgramVector lets us talk to the OS
    let mut pv = ProgramVector::take();

    let audio_settings = pv.audio.settings;
    // allocate a working buffer (uses vec intenally)
    let mut buffer: Buffer<f32, Channels> =
        Buffer::new(audio_settings.channels, audio_settings.blocksize);

    // For correct reporting, this should be called after all heap allocations are done with.
    pv.meta.set_heap_bytes_used(heap_bytes_used());

    // Main audio loop
    pv.audio.run(|input, output| {
        buffer.convert_from(input);
        buffer.convert_to(output);
    });
}
