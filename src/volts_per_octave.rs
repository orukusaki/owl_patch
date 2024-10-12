//! Sample / Volts / Frequency / Note conversions using calibrated device data
use core::ops::{Deref, DerefMut, Div, Mul};

use num_traits::Float;

/// Sample / Volts / Frequency / Note conversions using calibrated device data
///
/// # example
/// ```
/// #![no_main]
/// #![no_std]
///
/// use owl_patch::patch;
/// use owl_patch::program_vector::ProgramVector;
/// use owl_patch::volts_per_octave::Note;
///
/// #[patch("My Patch Name")]
/// fn run(mut pv: ProgramVector) -> ! {
///     let (vps_in, vps_out) = pv.volts_per_sample();
///
///     assert_eq!(vps_in.volts_to_note(1.0), Note(81));
/// }
/// ```
#[derive(Clone, Copy, Debug, PartialEq, Default)]
pub struct VoltsPerSample {
    scalar: f32,
    offset: f32,
}

impl VoltsPerSample {
    /// Constructor
    pub fn new(scalar: f32, offset: f32) -> Self {
        Self { scalar, offset }
    }

    /// Convert a sample value to a frequency
    pub fn sample_to_freq(self, sample: f32) -> Frequency {
        (self * sample).into()
    }

    /// Convert a frequency to a sample value
    pub fn freq_to_sample(self, freq: impl Into<Frequency>) -> f32 {
        let volts: Volts = freq.into().into();
        volts / self
    }

    /// Convert a sample value to a midi note number, rounding down
    pub fn sample_to_note(self, sample: f32) -> Note {
        (self * sample).into()
    }

    /// Convert a midi note number to a sample value
    pub fn note_to_sample<T>(self, note: impl Into<Note>) -> f32 {
        let volts: Volts = note.into().into();
        volts / self
    }

    /// Convert a sample value to a voltage (using calibration data)
    pub fn sample_to_volts(self, sample: f32) -> Volts {
        self * sample
    }

    /// Convert a voltage to a sample value (using calibration data)
    pub fn volts_to_sample<T>(self, volts: impl Into<Volts>) -> f32 {
        volts.into() / self
    }
}

/// V/S * S => V
impl Mul<f32> for VoltsPerSample {
    type Output = Volts;

    fn mul(self, sample: f32) -> Self::Output {
        Volts((sample - self.offset) * self.scalar)
    }
}

/// S * V/S => V
impl Mul<VoltsPerSample> for f32 {
    type Output = Volts;

    fn mul(self, vps: VoltsPerSample) -> Self::Output {
        vps.mul(self)
    }
}

/// V / (V/S) => V * (S/V) => S
impl Div<VoltsPerSample> for Volts {
    type Output = f32;

    fn div(self, vps: VoltsPerSample) -> Self::Output {
        (self.0 / vps.scalar) + vps.offset
    }
}

/// Amount of Volts. Can be directly converted to/from Frequency and Note
#[derive(Clone, Copy, Debug, PartialEq, Default, PartialOrd)]
pub struct Volts(pub f32);

impl From<f32> for Volts {
    fn from(value: f32) -> Self {
        Volts(value)
    }
}

impl From<Frequency> for Volts {
    fn from(freq: Frequency) -> Self {
        (freq.0 / 440.0).log2().into()
    }
}

impl From<Note> for Volts {
    fn from(note: Note) -> Self {
        ((note.0 as f32 - 69.0) / 12.0).into()
    }
}

/// Midi Note Number. Can be directly converted to/from Frequency and Volts
#[derive(Clone, Copy, Debug, PartialEq, Eq, Default, PartialOrd, Ord)]
pub struct Note(pub u8);

impl Deref for Note {
    type Target = u8;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

impl DerefMut for Note {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.0
    }
}

impl From<u8> for Note {
    fn from(value: u8) -> Self {
        Note(value)
    }
}

impl Into<u8> for Note {
    fn into(self) -> u8 {
        self.0
    }
}

impl From<Volts> for Note {
    fn from(volts: Volts) -> Self {
        ((12.0 * volts.0 + 69.0) as u8).into()
    }
}

impl From<Frequency> for Note {
    fn from(freq: Frequency) -> Self {
        let volts: Volts = freq.into();
        volts.into()
    }
}

/// Frequency. Can be directly converted to/from Note and Volts
#[derive(Clone, Copy, Debug, PartialEq, Default, PartialOrd)]
pub struct Frequency(pub f32);

impl From<f32> for Frequency {
    fn from(value: f32) -> Self {
        Frequency(value)
    }
}

impl From<Volts> for Frequency {
    fn from(volts: Volts) -> Self {
        (440.0 * volts.0.exp2()).into()
    }
}

impl From<Note> for Frequency {
    fn from(note: Note) -> Self {
        let volts: Volts = note.into();
        volts.into()
    }
}
