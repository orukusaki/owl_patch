#![no_main]
#![no_std]
extern crate alloc;

use core::{cell::RefCell, ops::DerefMut};
use cortex_m as _;
use critical_section::Mutex;
use heapless::Deque;
use num::FromPrimitive;
use owl_patch::{
    heap::Heap,
    program_vector::{AudioFormat, AudioSettings, PatchButtonId, PatchParameterId, ProgramVector},
    sample_buffer::{Buffer, Channels, ConvertFrom, ConvertTo, Sample, Samplei32, Samplew16},
};

#[global_allocator]
pub static HEAP: Heap = Heap::new();

struct ButtonEvent {
    bid: PatchButtonId,
    state: bool,
}

static BUTTON_EVENTS: Mutex<RefCell<Deque<ButtonEvent, 10>>> =
    Mutex::new(RefCell::new(Deque::new()));

unsafe extern "C" fn button_changed_callback(bid: u8, state: u16, _samples: u16) {
    critical_section::with(|cs| {
        let _ = BUTTON_EVENTS
            .borrow(cs)
            .borrow_mut()
            .push_back(ButtonEvent {
                bid: PatchButtonId::from_u8(bid).unwrap(),
                state: state != 0,
            });
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
    pv.register_patch("Parameter Test", 2, 2);
    pv.set_heap_bytes_used(before - HEAP.free_heap_size());

    // Split up the PV into separate resources - saves us from needing to hold multiple references to it.
    // pv is consumed here, so all setup stuff must be done first
    let (mut audio, mut parameters, _midi_send) = pv.split();

    // Register an input param, and define a local variable to hold its value
    let mut volume = 0.0;
    parameters.register(PatchParameterId::PARAMETER_A, "volume");

    // Postfixing the name with ">" designates the parameter as an output
    parameters.register(PatchParameterId::PARAMETER_F, "MyOutput>");

    parameters.set_button_changed_callback(button_changed_callback);

    let mut events = Deque::new();

    // Main audio loop
    audio.run(|input, mut output| {
        volume = parameters.get(PatchParameterId::PARAMETER_A);
        parameters.set(PatchParameterId::PARAMETER_F, volume);

        buffer.convert_from(&input);

        for ch in buffer.channels_mut() {
            for sample in ch.iter_mut() {
                *sample *= volume
            }
        }

        buffer.convert_to(&mut output);

        critical_section::with(|cs| {
            let mut e = BUTTON_EVENTS.borrow(cs).borrow_mut();
            core::mem::swap(e.deref_mut(), &mut events);
        });

        while let Some(event) = events.pop_front() {
            if event.bid == PatchButtonId::BUTTON_1 {
                // On Lich, BUTTON_3 is the gate output
                parameters.set_button(PatchButtonId::BUTTON_3, event.state);
            }
        }

        // using the callback is not essential, you can just query the button state instead:
        let _button_state = parameters.get_button(PatchButtonId::BUTTON_2);
    });
}
