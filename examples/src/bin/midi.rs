#![no_main]
#![no_std]
extern crate alloc;

use alloc::sync::Arc;
use core::sync::atomic::{AtomicU32, Ordering};
use num_traits::Float;
use owl_patch::{
    midi_message::MidiMessage,
    patch,
    program_vector::{heap_bytes_used, ProgramVector},
    sample_buffer::{Buffer, ConvertTo},
};

#[patch("Midi Example")]
fn run(mut pv: ProgramVector) -> ! {
    let audio_settings = pv.audio().settings;

    // allocate a working buffer (uses vec intenally)
    let mut buffer = Buffer::new(audio_settings.channels, audio_settings.blocksize);

    let (mut osc, inc) = Sawtooth::new();
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
    pv.meta().set_heap_bytes_used(heap_bytes_used());

    // Main audio loop
    pv.audio().run(|_input, output| {
        for frame in buffer.frames_mut() {
            let sample = osc.next();

            for s in frame.iter_mut() {
                *s = sample;
            }
        }

        buffer.convert_to(output);
    });
}

struct Sawtooth {
    increment: Arc<AtomicU32>,
    phase: f32,
}

impl Sawtooth {
    fn next(&mut self) -> f32 {
        self.phase += f32::from_bits(self.increment.load(Ordering::Relaxed));

        if self.phase >= 1.0 {
            self.phase -= 2.0;
        }

        self.phase
    }

    fn new() -> (Self, Arc<AtomicU32>) {
        let inc = Arc::new(AtomicU32::new(0));
        (
            Self {
                increment: inc.clone(),
                phase: 0.0,
            },
            inc,
        )
    }
}