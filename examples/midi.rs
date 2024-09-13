#![no_main]
#![no_std]
extern crate alloc;

use alloc::sync::Arc;
use core::sync::atomic::{AtomicU32, Ordering};
use num_traits::Float;
use owl_patch::{
    heap::Heap,
    midi_message::MidiMessage,
    program_vector::{midi::Midi, AudioFormat, AudioSettings, ProgramVector},
    sample_buffer::{Buffer, ConvertTo, Interleaved, Sample, Samplei32, Samplew16},
};

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
    F: Sample<BaseType = i32> + From<f32> + 'static,
    f32: From<F>,
{
    let before = HEAP.free_heap_size();

    // allocate a working buffer (uses vec intenally)
    let mut buffer: Buffer<f32, Interleaved> =
        Buffer::new(audio_settings.channels, audio_settings.blocksize);
    pv.register_patch("Midi Test", 2, 2);
    pv.set_heap_bytes_used(before - HEAP.free_heap_size());

    let (mut audio, _, midi) = pv.split::<F>();

    let (mut osc, inc) = Sawtooth::new();

    // Set up our midi handler - it sets the oscillator frequency for any note-on messages, plus echos
    // all messages back to the sender
    let mul = 2.0 / audio_settings.sample_rate as f32;
    Midi::on_receive(move |message: MidiMessage| {
        if message.is_note_on() {
            let note = message.note();
            let hz = 440.0 * 2.0f32.powf((note as f32 - 69.0) / 12.0);
            inc.store((mul * hz).to_bits(), Ordering::Relaxed);
        }
        midi.send(message);
    });

    // Main audio loop
    audio.run(|_input, mut output| {
        for frame in buffer.frames_mut() {
            let sample = osc.next();

            for s in frame.iter_mut() {
                *s = sample;
            }
        }

        buffer.convert_to(&mut output);
    });
}

#[derive(Default)]
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
