#![no_main]
#![no_std]
extern crate alloc;

use owl_patch::{
    heap::Heap,
    program_vector::{AudioFormat, AudioSettings, PatchButtonId, PatchParameterId, ProgramVector},
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
    let free_mem_start = HEAP.free_heap_size();

    let mut buffer: Buffer<f32, Channels> =
        Buffer::new(audio_settings.channels, audio_settings.blocksize);

    pv.register_patch("Parameter Test", 2, 2);

    // Split up the PV into separate resources - saves us from needing to hold multiple references to it.
    // pv is consumed here, so all setup stuff must be done first
    let (mut audio, parameters, _, mut meta) = pv.split();

    // Register an input param
    parameters.register(PatchParameterId::PARAMETER_A, "volume");

    // Postfixing the name with ">" designates the parameter as an output
    parameters.register(PatchParameterId::PARAMETER_F, "MyOutput>");

    // let params = params.clone();
    parameters.on_button_changed(move |bid: PatchButtonId, state: u16, _samples: u16| {
        if bid == PatchButtonId::BUTTON_1 {
            parameters.set_button(PatchButtonId::BUTTON_3, state > 0);
        }
    });

    // using the callback is not essential. If your timing requirements aren't exact, you can just query the button state instead:
    // let _button_state = parameters.get_button(PatchButtonId::BUTTON_2);

    meta.set_heap_bytes_used(free_mem_start - HEAP.free_heap_size());

    // Main audio loop
    audio.run(|input, mut output| {
        let volume = parameters.get(PatchParameterId::PARAMETER_A);
        parameters.set(PatchParameterId::PARAMETER_F, volume);

        buffer.convert_from(&input);

        for ch in buffer.channels_mut() {
            for sample in ch.iter_mut() {
                *sample *= volume
            }
        }

        buffer.convert_to(&mut output);
    });
}
