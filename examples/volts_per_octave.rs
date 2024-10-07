#![no_main]
#![no_std]
extern crate alloc;

use fundsp::shared::Shared;
use owl_patch::{
    midi_message::MidiMessage,
    program_vector::{
        heap_bytes_used, Midi, Parameters, PatchButtonId, PatchParameterId, ProgramVector,
    },
    sample_buffer::{Buffer, Channels, ConvertFrom, ConvertTo},
    volts_per_octave::VoltsPerOctave,
};

const VELOCITY_IN: PatchParameterId = PatchParameterId::PARAMETER_A;
const VELOCITY_OUT: PatchParameterId = PatchParameterId::PARAMETER_F;
const GATE_IN_A: PatchButtonId = PatchButtonId::BUTTON_1;
const GATE_IN_B: PatchButtonId = PatchButtonId::BUTTON_2;
const GATE_OUT: PatchButtonId = PatchButtonId::BUTTON_3;

#[no_mangle]
pub extern "C" fn main() -> ! {
    let mut pv = ProgramVector::take();
    let audio_settings = pv.audio.settings;
    let vpo = pv.volts_per_octave();
    let mut buffer: Buffer<f32, Channels, _> =
        Buffer::new(audio_settings.channels, audio_settings.blocksize);

    let parameters = pv.parameters;
    parameters.register(VELOCITY_IN, "Velocity");
    parameters.register(VELOCITY_OUT, "Velocity>");

    let in_level = Shared::new(0.0);
    let out_level = Shared::new(0.0);

    let midi = pv.midi();
    midi.on_receive(midi_callback(&out_level, parameters, vpo));
    parameters.on_button_changed(button_changed_callback(&in_level, midi, parameters, vpo));

    pv.meta.set_heap_bytes_used(heap_bytes_used());

    let mut right_level = 0.0;

    // Main audio loop
    pv.audio.run(|input, output| {
        buffer.convert_from(input);

        let mut left = buffer.left_mut().unwrap();
        in_level.set(left.iter().sum::<f32>() / audio_settings.blocksize as f32);
        left.fill(out_level.value());

        if let Some(mut right) = buffer.right_mut() {
            // Update the right side value whenever gate 2 is open
            if parameters.get_button(GATE_IN_B) {
                let raw_value = right.iter().sum::<f32>() / audio_settings.blocksize as f32;
                let note = vpo.sample_to_note(raw_value);
                right_level = vpo.note_to_sample(note);
            }

            right.fill(right_level);
        }

        buffer.convert_to(output);
    });
}

fn midi_callback(
    out_level: &Shared,
    parameters: Parameters,
    vpo: VoltsPerOctave,
) -> impl Fn(MidiMessage) {
    let out_level = out_level.clone();
    move |message: MidiMessage| {
        if message.is_note_on() {
            let note = message.note();

            out_level.set(vpo.note_to_sample(note));
            let velocity = message.velocity() as f32 / 127.0;

            parameters.set(VELOCITY_OUT, velocity);
            parameters.set_button(GATE_OUT, true);
        } else if message.is_note_off() {
            parameters.set_button(GATE_OUT, false);
        }
    }
}

fn button_changed_callback(
    in_level: &Shared,
    midi: Midi,
    parameters: Parameters,
    vpo: VoltsPerOctave,
) -> impl FnMut(PatchButtonId, u16, u16) {
    let in_level = in_level.clone();
    let mut previous_note = 0u8;

    move |bid: PatchButtonId, state: u16, _samples: u16| {
        if bid == GATE_IN_A {
            match state {
                0 => midi.send(MidiMessage::note_off(1, previous_note)),
                _ => {
                    let note = vpo.sample_to_note(in_level.value());
                    if note != previous_note {
                        midi.send(MidiMessage::note_off(1, previous_note));
                    }
                    let velocity = (parameters.get(VELOCITY_IN) * 127.0) as u8;
                    midi.send(MidiMessage::note_on(1, note, velocity));
                    previous_note = note;
                }
            }
        }
    }
}
