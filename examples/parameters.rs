#![no_main]
#![no_std]
extern crate alloc;

use alloc::sync::Arc;
use core::cell::RefCell;
use cortex_m as _;
use critical_section::Mutex;
use owl_patch::{
    heap::Heap,
    program_vector::{
        AudioFormat, AudioSettings, Parameters, PatchButtonId, PatchParameterId, ProgramVector,
    },
    sample_buffer::{Buffer, Channels, ConvertFrom, ConvertTo, Sample, Samplei32, Samplew16},
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
    F: Sample<BaseType = i32> + From<f32>,
    f32: From<F>,
{
    let before = HEAP.free_heap_size();

    let mut buffer: Buffer<f32, Channels> =
        Buffer::new(audio_settings.channels, audio_settings.blocksize);

    pv.register_patch("Parameter Test", 2, 2);
    pv.set_heap_bytes_used(before - HEAP.free_heap_size());

    // Split up the PV into separate resources - saves us from needing to hold multiple references to it.
    // pv is consumed here, so all setup stuff must be done first
    let (mut audio, mut parameters, _) = pv.split();

    // Register an input param, and define a local variable to hold its value
    let mut volume = 0.0;
    parameters.register(PatchParameterId::PARAMETER_A, "volume");

    // Postfixing the name with ">" designates the parameter as an output
    parameters.register(PatchParameterId::PARAMETER_F, "MyOutput>");

    // we'll want to access parameters from two different "threads", so lets put it in a Mutex
    let params: Arc<Mutex<RefCell<Parameters>>> = Arc::new(Mutex::new(RefCell::new(parameters)));

    {
        let params = params.clone();
        Parameters::on_button_changed(move |bid: PatchButtonId, state: u16, _samples: u16| {
            if bid == PatchButtonId::BUTTON_1 {
                // On Lich, BUTTON_3 is the gate output
                critical_section::with(|cs| {
                    params
                        .borrow_ref_mut(cs)
                        .set_button(PatchButtonId::BUTTON_3, state > 0)
                });
            }
        });
    }
    // using the callback is not essential. If your timing requirements aren't exact, you can just query the button state instead:
    // let _button_state = parameters.get_button(PatchButtonId::BUTTON_2);

    //TODO: This closure will be heap allocated, and the Arc<etc<Parameters>> is too, so we should be reporting the memory usage _after_ they have been set up,
    // But pv is gone. I think we need another object in the split
    // pv.set_heap_bytes_used(before - HEAP.free_heap_size());

    // Main audio loop
    audio.run(|input, mut output| {
        volume = critical_section::with(|cs| {
            let mut parameters = params.borrow_ref_mut(cs);
            let volume = parameters.get(PatchParameterId::PARAMETER_A);
            parameters.set(PatchParameterId::PARAMETER_F, volume);
            volume
        });

        buffer.convert_from(&input);

        for ch in buffer.channels_mut() {
            for sample in ch.iter_mut() {
                *sample *= volume
            }
        }

        buffer.convert_to(&mut output);
    });
}
