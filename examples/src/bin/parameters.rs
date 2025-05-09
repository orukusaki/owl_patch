//! Simple parameter example
//! Parameter A controls the volume of audio passed through from the input to the output.
//! CV Out 1 mirrors Parameter A
//! Gate Out mirrors Gate In 1
#![no_main]
#![no_std]

use owl_patch::{
    patch,
    program_vector::{heap_bytes_used, ProgramVector},
    sample_buffer::{BufferByChannel, ConvertFrom, ConvertTo},
    PatchButtonId, PatchParameterId,
};

#[patch("Parameters Example")]
fn run(mut pv: ProgramVector) -> ! {
    let audio_settings = pv.audio.settings;
    let mut buffer = BufferByChannel::<f32>::new(audio_settings.channels, audio_settings.blocksize);

    let parameters = pv.parameters;

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
    pv.meta.set_heap_bytes_used(heap_bytes_used());

    loop {
        let volume = parameters.get(PatchParameterId::PARAMETER_A);
        parameters.set(PatchParameterId::PARAMETER_F, volume);

        pv.audio.process(|input, output| {
            buffer.convert_from(input);

            for mut channel in buffer.channels_mut() {
                channel *= volume;
            }

            buffer.convert_to(output);
        })
    }
}
