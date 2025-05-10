#![no_main]
#![no_std]
extern crate alloc;

use core::{
    ffi::CStr,
    sync::atomic::{AtomicUsize, Ordering},
};

use alloc::{boxed::Box, sync::Arc};

use mi_plaits_dsp::voice::{Modulations, Patch, Voice};
use owl_patch::{
    patch,
    program_vector::{heap_bytes_used, AudioSettings, Meta, Parameters, ProgramVector},
    sample_buffer::{BufferByChannel, ConvertFrom, ConvertTo, MonoBuffer},
    PatchButtonId, PatchParameterId,
};

struct EngineInfo {
    pub name: &'static CStr,
    pub harmonics: &'static str,
    pub timbre: &'static str,
    pub morph: &'static str,
}

static ENGINES: [EngineInfo; 24] = [
    EngineInfo {
        name: c"v/a vcf",
        harmonics: "resonance",
        timbre: "cutoff",
        morph: "waveform",
    },
    EngineInfo {
        name: c"phase dist",
        harmonics: "frequency",
        timbre: "amount",
        morph: "asymmetry",
    },
    EngineInfo {
        name: c"6op bank0",
        harmonics: "preset",
        timbre: "mod level",
        morph: "stretch",
    },
    EngineInfo {
        name: c"6op bank1",
        harmonics: "preset",
        timbre: "mod level",
        morph: "stretch",
    },
    EngineInfo {
        name: c"6op bank2",
        harmonics: "preset",
        timbre: "mod level",
        morph: "stretch",
    },
    EngineInfo {
        name: c"waveterrain",
        harmonics: "terrain",
        timbre: "radius",
        morph: "offset",
    },
    EngineInfo {
        name: c"string machine",
        harmonics: "material",
        timbre: "brightness",
        morph: "decay",
    },
    EngineInfo {
        name: c"chiptune",
        harmonics: "chord",
        timbre: "arpeggio",
        morph: "sync",
    },
    EngineInfo {
        name: c"v/a",
        harmonics: "detuning",
        timbre: "sq shape",
        morph: "saw shape",
    },
    EngineInfo {
        name: c"waveshaping",
        harmonics: "waveform",
        timbre: "fold",
        morph: "asymmetry",
    },
    EngineInfo {
        name: c"fm",
        harmonics: "ratio",
        timbre: "index",
        morph: "feedback",
    },
    EngineInfo {
        name: c"grain",
        harmonics: "ratio",
        timbre: "frequency",
        morph: "width",
    },
    EngineInfo {
        name: c"additive",
        harmonics: "bumps",
        timbre: "index",
        morph: "shape",
    },
    EngineInfo {
        name: c"wavetable",
        harmonics: "bank",
        timbre: "row",
        morph: "column",
    },
    EngineInfo {
        name: c"chord",
        harmonics: "type",
        timbre: "inversion",
        morph: "waveform",
    },
    EngineInfo {
        name: c"speech",
        harmonics: "vowel",
        timbre: "species",
        morph: "phoneme",
    },
    EngineInfo {
        name: c"swarm",
        harmonics: "random",
        timbre: "density",
        morph: "duration",
    },
    EngineInfo {
        name: c"noise",
        harmonics: "filter",
        timbre: "lock",
        morph: "resonance",
    },
    EngineInfo {
        name: c"particle",
        harmonics: "random",
        timbre: "density",
        morph: "filter",
    },
    EngineInfo {
        name: c"string",
        harmonics: "material",
        timbre: "brightness",
        morph: "decay",
    },
    EngineInfo {
        name: c"modal",
        harmonics: "material",
        timbre: "brightness",
        morph: "decay",
    },
    EngineInfo {
        name: c"bass drum",
        harmonics: "attack",
        timbre: "rightness",
        morph: "decay",
    },
    EngineInfo {
        name: c"snare",
        harmonics: "balance",
        timbre: "mode",
        morph: "decay",
    },
    EngineInfo {
        name: c"hihat",
        harmonics: "balance",
        timbre: "fillter",
        morph: "decay",
    },
];

const GAIN: f32 = 0.8;

#[patch("Plaits")]
fn run(mut pv: ProgramVector) -> ! {
    let audio_settings = pv.audio.settings;
    let (vps_in, _vps_out) = pv.volts_per_sample();

    let mut buffer = BufferByChannel::<f32>::new(audio_settings.channels, audio_settings.blocksize);

    let mut buff_out = MonoBuffer::<f32>::new(audio_settings.blocksize);
    let mut buff_aux = MonoBuffer::<f32>::new(audio_settings.blocksize);

    let parameters = pv.parameters;
    parameters.register(PatchParameterId::PARAMETER_D, "accent");

    let patch_id = Arc::new(AtomicUsize::new(0));
    let mut meta = pv.meta;

    register_params(&parameters, &mut meta, 0);

    {
        let patch_id = patch_id.clone();
        parameters.on_button_changed(move |bid: PatchButtonId, state: u16, _samples: u16| {
            if bid == PatchButtonId::BUTTON_2 && state > 0 {
                let mut id = patch_id.load(Ordering::Relaxed);
                id += 1;
                id %= 23;

                patch_id.store(id, Ordering::Relaxed);

                register_params(&parameters, &mut meta, id);
            }
        });
    }

    let mut voice = create_voice(&audio_settings);

    let mut patch = Patch::default();
    let mut modulations = Modulations::default();

    pv.audio.run(move |input, output| {
        buffer.convert_from(input);

        patch.engine = patch_id.load(Ordering::Relaxed);

        let input_0_level = buffer[0].samples().sum::<f32>() / audio_settings.blocksize as f32;
        let volts = vps_in * input_0_level;
        let note: f32 = 12.0 * volts.0 + 24.0; // Gets us to roughly equal to the frequency knob being tdc

        modulations.trigger_patched = true;
        modulations.trigger = if parameters.get_button(PatchButtonId::BUTTON_1) {
            1.0
        } else {
            0.0
        };

        modulations.level_patched = true;
        modulations.level = parameters.get(PatchParameterId::PARAMETER_D);

        patch.note = note;
        patch.timbre = parameters.get(PatchParameterId::PARAMETER_A);
        patch.morph = parameters.get(PatchParameterId::PARAMETER_B);
        patch.harmonics = parameters.get(PatchParameterId::PARAMETER_C);

        voice.render(
            &patch,
            &modulations,
            buff_out.as_slice_mut(),
            buff_aux.as_slice_mut(),
        );

        buffer[0].convert_from(&buff_out);
        buffer[1].convert_from(&buff_aux);

        // The output is a bit high, scale it down
        buffer *= GAIN;

        buffer.convert_to(output);
    })
}

fn register_params(parameters: &Parameters, meta: &mut Meta, engine_id: usize) {
    let patch_info = &ENGINES[engine_id];
    parameters.register(PatchParameterId::PARAMETER_A, patch_info.timbre);
    parameters.register(PatchParameterId::PARAMETER_B, patch_info.morph);
    parameters.register(PatchParameterId::PARAMETER_C, patch_info.harmonics);

    meta.register_patch(patch_info.name);
    meta.set_heap_bytes_used(heap_bytes_used());
}

fn create_voice(audio_settings: &AudioSettings) -> Box<Voice> {
    let mut engine = unsafe {
        let mut uninit = Box::<Voice>::new_uninit();
        uninit.write(Voice::new(audio_settings.blocksize));
        uninit.assume_init()
    };

    engine.init();
    engine
}
