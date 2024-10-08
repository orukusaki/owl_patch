use crate::program_vector::DeviceParameters;
use num_traits::Float;

#[derive(Clone, Copy)]
pub struct VoltsPerOctave {
    parameters: DeviceParameters,
}

impl VoltsPerOctave {
    pub fn new(parameters: DeviceParameters) -> Self {
        Self { parameters }
    }

    pub fn sample_to_freq(&self, sample: f32) -> f32 {
        Self::volts_to_freq(self.sample_to_volts(sample))
    }

    pub fn freq_to_sample(&self, freq: f32) -> f32 {
        self.volts_to_sample(Self::freq_to_volts(freq))
    }

    pub fn sample_to_note(&self, sample: f32) -> u8 {
        Self::volts_to_note(self.sample_to_volts(sample))
    }

    pub fn note_to_sample(&self, note: u8) -> f32 {
        self.volts_to_sample(Self::note_to_volts(note))
    }

    pub fn sample_to_volts(&self, sample: f32) -> f32 {
        (sample - self.parameters.input_offset) * self.parameters.input_scalar
    }

    pub fn volts_to_sample(&self, volts: f32) -> f32 {
        (volts / self.parameters.output_scalar) + self.parameters.output_offset
    }

    pub fn volts_to_freq(volts: f32) -> f32 {
        440.0 * volts.exp2()
    }

    pub fn volts_to_note(volts: f32) -> u8 {
        (12.0 * volts + 69.0) as u8
    }

    pub fn note_to_volts(note: u8) -> f32 {
        (note as f32 - 69.0) / 12.0
    }

    pub fn freq_to_note(freq: f32) -> u8 {
        Self::volts_to_note(Self::freq_to_volts(freq))
    }

    pub fn note_to_freq(note: u8) -> f32 {
        Self::volts_to_freq(Self::note_to_volts(note))
    }

    pub fn freq_to_volts(freq: f32) -> f32 {
        (freq / 440.0).log2()
    }
}
