#![no_main]
#![no_std]
extern crate alloc;

use core::{cell::RefCell, ops::DerefMut};
use cortex_m as _;
use critical_section::Mutex;
use heapless::Deque;
use owl_patch::{
    heap::Heap,
    midi_message::MidiMessage,
    program_vector::{AudioFormat, AudioSettings, ProgramVector},
    sample_buffer::{Buffer, Channels, ConvertFrom, ConvertTo, Sample, Samplei32, Samplew16},
};

#[global_allocator]
pub static HEAP: Heap = Heap::new();

static MIDI_BUFFER: Mutex<RefCell<Deque<MidiMessage, 10>>> = Mutex::new(RefCell::new(Deque::new()));

unsafe extern "C" fn midi_callback(port: u8, status: u8, d1: u8, d2: u8) {
    critical_section::with(|cs| {
        let _ = MIDI_BUFFER
            .borrow(cs)
            .borrow_mut()
            .push_back(MidiMessage::new(port, status, d1, d2));
    });
}

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
    let before = HEAP.free_heap_size();

    // allocate a working buffer (uses vec intenally)
    let mut buffer: Buffer<f32, Channels> =
        Buffer::new(audio_settings.channels, audio_settings.blocksize);
    // Let the OS know we're ready to start processing audio - the channel count is ignored
    pv.register_patch("Midi Test", 2, 2);
    pv.register_midi_callback(midi_callback as *mut _);
    pv.set_heap_bytes_used(before - HEAP.free_heap_size());

    // Split up the PV into separate resources - saves us from needing to hold multiple references to it.
    // pv is consumed here, so all setup stuff must be done first
    let (mut audio, _, midi_send) = pv.split();

    let mut messages = Deque::new();

    // Main audio loop
    audio.run(|input, mut output| {
        // Process any captured midi events
        critical_section::with(|cs| {
            let mut m = MIDI_BUFFER.borrow(cs).borrow_mut();
            core::mem::swap(m.deref_mut(), &mut messages);
        });

        while let Some(message) = messages.pop_front() {
            // echo the message right back
            midi_send(message);
        }

        buffer.convert_from(&input);
        buffer.convert_to(&mut output);
    });
}
