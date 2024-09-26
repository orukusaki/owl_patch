#![no_main]
#![no_std]
extern crate alloc;

use alloc::sync::Arc;
use core::sync::atomic::{AtomicU32, Ordering};
use num_traits::Float;
use owl_patch::{
    midi_message::MidiMessage,
    program_vector::{heap_bytes_used, ProgramVector},
    sample_buffer::{Buffer, ConvertTo, Interleaved},
};

#[no_mangle]
pub extern "C" fn main() -> ! {
    // The ProgramVector lets us talk to the OS
    let mut pv = ProgramVector::take();

    let audio_settings = pv.audio.settings;

    let vpo = pv.volts_per_octave();

    // allocate a working buffer (uses vec intenally)
    let mut buffer: Buffer<f32, Interleaved> =
        Buffer::new(audio_settings.channels, audio_settings.blocksize);

    let mul = 2.0 / audio_settings.sample_rate as f32;

    // Set up our midi handler - it sets the oscillator frequency for any note-on messages, plus echos
    // all messages back to the sender
    let midi = pv.midi();
    midi.on_receive(move |message: MidiMessage| {
        if message.is_note_on() {
            let note = message.note();
            let hz = 440.0 * 2.0f32.powf((note as f32 - 69.0) / 12.0);
            inc.store((mul * hz).to_bits(), Ordering::Relaxed);
        }
        midi.send(message);
    });

    // For correct reporting, this should be called after all heap allocations are done with.
    pv.meta.set_heap_bytes_used(heap_bytes_used());

    // Main audio loop
    pv.audio.run(|input, output| {
        buffer.convert_from(input);
        buffer.convert_to(output);
    });
}
