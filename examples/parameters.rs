#![no_main]
#![no_std]
extern crate alloc;

use owl_patch::{
    program_vector::{
        heap_bytes_used, AudioFormat, AudioSettings, PatchButtonId, PatchParameterId, ProgramVector,
    },
    sample_buffer::{Buffer, Channels, ConvertFrom, ConvertTo, Sample, Samplei32, Samplew16},
};

#[no_mangle]
pub extern "C" fn main() -> ! {
    // The ProgramVector lets us talk to the OS
    let pv = ProgramVector::instance();

    let audio_settings = pv.audio_settings();
    match audio_settings.format {
        AudioFormat::Format24B16 => run::<Samplew16>(pv, audio_settings),
        AudioFormat::Format24B32 => run::<Samplei32>(pv, audio_settings),
    }
}

fn run<F>(pv: ProgramVector<'static>, audio_settings: AudioSettings) -> !
where
    F: Sample<BaseType = i32> + From<f32>,
    f32: From<F>,
{
    let mut buffer: Buffer<f32, Channels> =
        Buffer::new(audio_settings.channels, audio_settings.blocksize);

    // Split up the PV into separate resources - saves us from needing to hold multiple references to it.
    // pv is consumed here, so all setup stuff must be done first
    let (mut audio, parameters, _, mut meta) = pv.split();

    // Register an input param
    parameters.register(PatchParameterId::PARAMETER_A, "volume");

    // Postfixing the name with ">" designates the parameter as an output
    parameters.register(PatchParameterId::PARAMETER_F, "MyOutput>");

    parameters.on_button_changed(move |bid: PatchButtonId, state: u16, _samples: u16| {
        if bid == PatchButtonId::BUTTON_1 {
            parameters.set_button(PatchButtonId::BUTTON_3, state > 0);
        }
    });

    // using the callback is not essential. If your timing requirements aren't exact, you can just query the button state instead:
    // let _button_state = parameters.get_button(PatchButtonId::BUTTON_2);

    // For correct reporting, this should be called after all heap allocations are done with.
    meta.set_heap_bytes_used(heap_bytes_used());

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
