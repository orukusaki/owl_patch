//! Sample / Volts / Frequency / Note conversions using calibrated device data
use core::ops::{Div, Mul};

#[cfg(target_os = "none")]
use num_traits::Float;

/// Sample / Volts / Frequency / Note conversions using calibrated device data
///
/// # example
/// ```
/// # use owl_patch::volts_per_octave::*;
/// # let mut pv = unsafe { owl_patch::test_harness::program_vector() };
/// let (vps_in, vps_out) = pv.volts_per_sample();
/// assert_eq!(vps_in.sample_to_volts(1.0), Volts(2.0)); // actual results will depend on device data
/// ```
///
/// Samples can be converted to/from volts, frequencies and midi notes using either methods or operators/conversions
/// ```
/// # use owl_patch::volts_per_octave::*;
/// # let mut pv = unsafe { owl_patch::test_harness::program_vector() };
/// # let (vps_in, vps_out) = pv.volts_per_sample();
/// let in_sample = 0.5f32;
/// let volts = in_sample * vps_in;
/// assert_eq!(vps_in.sample_to_volts(in_sample), volts);
/// let freq: Frequency = volts.into();
/// assert_eq!(vps_in.sample_to_freq(in_sample), freq);
/// let note: Note = volts.into();
/// assert_eq!(vps_in.sample_to_note(in_sample), note);
///
/// let out_sample = volts / vps_out;
/// assert_eq!(vps_out.volts_to_sample(volts), out_sample);
/// assert_eq!(vps_out.note_to_sample(note), out_sample);
/// assert_eq!(vps_out.freq_to_sample(freq), out_sample);
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
    pub fn note_to_sample(self, note: impl Into<Note>) -> f32 {
        let volts: Volts = note.into().into();
        volts / self
    }

    /// Convert a sample value to a voltage (using calibration data)
    pub fn sample_to_volts(self, sample: f32) -> Volts {
        self * sample
    }

    /// Convert a voltage to a sample value (using calibration data)
    pub fn volts_to_sample(self, volts: impl Into<Volts>) -> f32 {
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
/// ```
/// # use owl_patch::volts_per_octave::*;
/// let volts = Volts(1.0);
/// assert_eq!(Frequency::from(volts), Frequency(880.0));
/// assert_eq!(Note::from(volts), Note(81));
/// ```
#[derive(Clone, Copy, Debug, PartialEq, Default, PartialOrd)]
pub struct Volts(pub f32);

impl From<f32> for Volts {
    fn from(value: f32) -> Self {
        Volts(value)
    }
}

impl From<Volts> for f32 {
    fn from(volts: Volts) -> Self {
        volts.0
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
/// ```
/// # use owl_patch::volts_per_octave::*;
/// let note = Note(69);
/// assert_eq!(Volts::from(note), Volts(0.0));
/// assert_eq!(Frequency::from(note), Frequency(440.0));
/// ```
#[derive(Clone, Copy, Debug, PartialEq, Eq, Default, PartialOrd, Ord)]
pub struct Note(pub u8);

impl From<u8> for Note {
    fn from(value: u8) -> Self {
        Note(value)
    }
}

impl From<Note> for u8 {
    fn from(val: Note) -> Self {
        val.0
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
/// ```
/// # use owl_patch::volts_per_octave::*;
/// let freq = Frequency(440.0);
/// assert_eq!(Volts::from(freq), Volts(0.0));
/// assert_eq!(Note::from(freq), Note(69));
/// ```
#[derive(Clone, Copy, Debug, PartialEq, Default, PartialOrd)]
pub struct Frequency(pub f32);

impl From<f32> for Frequency {
    fn from(value: f32) -> Self {
        Frequency(value)
    }
}

impl From<Frequency> for f32 {
    fn from(freq: Frequency) -> Self {
        freq.0
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
