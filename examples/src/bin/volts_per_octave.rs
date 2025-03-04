//! Midi IO / Quantizer example using Volts Per Octave calculations
//! Left channel will send a midi note-on message when Gate 1 is activated.
//! The note value is detirmined by the voltage on the left input, velocity is Param A.
//!
//! When a Midi note is received, the Left output will be set to the voltage representing the note pitch, and GATE OUT will be activated.
//! Param F (VC Out 1) is the note velocity.
//!
//! The right channel is a simple quantizer. Whenever Gate 2 is activated, the Right input is read, quantized to the nearest note, and send to the right output.
#![no_main]
#![no_std]
extern crate alloc;

use fundsp::shared::Shared;
use owl_patch::{
    midi_message::MidiMessage,
    patch,
    program_vector::{heap_bytes_used, Midi, Parameters, ProgramVector},
    sample_buffer::{BufferByChannel, ConvertFrom, ConvertTo},
    volts_per_octave::{Note, Volts, VoltsPerSample},
    PatchButtonId, PatchParameterId,
};

const VELOCITY_IN: PatchParameterId = PatchParameterId::PARAMETER_A;
const VELOCITY_OUT: PatchParameterId = PatchParameterId::PARAMETER_F;
const GATE_IN_A: PatchButtonId = PatchButtonId::BUTTON_1;
const GATE_IN_B: PatchButtonId = PatchButtonId::BUTTON_2;
const GATE_OUT: PatchButtonId = PatchButtonId::BUTTON_3;

#[patch("Volts per octave")]
fn run(mut pv: ProgramVector) -> ! {
    let audio_settings = pv.audio().settings;
    let (vps_in, vps_out) = pv.volts_per_sample();
    let mut buffer = BufferByChannel::new(audio_settings.channels, audio_settings.blocksize);

    let parameters = pv.parameters();
    parameters.register(VELOCITY_IN, "Velocity");
    parameters.register(VELOCITY_OUT, "Velocity>");

    let in_level = Shared::new(0.0);
    let out_level = Shared::new(0.0);

    let midi = pv.midi();
    midi.on_receive(midi_callback(&out_level, parameters, vps_out));
    parameters.on_button_changed(button_changed_callback(&in_level, midi, parameters, vps_in));

    pv.meta().set_heap_bytes_used(heap_bytes_used());

    let mut right_level = 0.0;

    // Main audio loop
    pv.audio().run(|input, output| {
        buffer.convert_from(input);

        let left = buffer.left_mut().unwrap();
        in_level.set(left.samples().sum::<f32>() / audio_settings.blocksize as f32);

        left.fill(out_level.value());

        if let Some(right) = buffer.right_mut() {
            // Update the right side value whenever gate 2 is open
            if parameters.get_button(GATE_IN_B) {
                let raw_value = right.samples().sum::<f32>() / audio_settings.blocksize as f32;
                let note: Note = (vps_in * raw_value).into();
                let volts: Volts = note.into();
                right_level = volts / vps_out;
            }

            right.fill(right_level);
        }

        buffer.convert_to(output);
    });
}

fn midi_callback(
    out_level: &Shared,
    parameters: Parameters,
    vps: VoltsPerSample,
) -> impl Fn(MidiMessage) {
    let out_level = out_level.clone();
    move |message: MidiMessage| {
        if message.is_note_on() {
            let note: Note = message.note().into();
            let v: Volts = note.into();

            out_level.set(v / vps);
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
    vps: VoltsPerSample,
) -> impl FnMut(PatchButtonId, u16, u16) {
    let in_level = in_level.clone();
    let mut previous_note: Note = Default::default();

    move |bid: PatchButtonId, state: u16, _samples: u16| {
        if bid == GATE_IN_A {
            match state {
                0 => midi.send(MidiMessage::note_off(1, previous_note)),
                _ => {
                    let note = (in_level.value() * vps).into();
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
