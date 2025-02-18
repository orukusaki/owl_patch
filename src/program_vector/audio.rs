use core::slice;

use crate::sample_buffer::{Buffer, Interleaved};

use super::{
    AUDIO_FORMAT_24B16, AUDIO_FORMAT_24B32, AUDIO_FORMAT_CHANNEL_MASK, AUDIO_FORMAT_FORMAT_MASK,
};

/// Current audio settings (set by the os / device)
#[derive(Clone, Copy)]
pub struct AudioSettings {
    /// sample rate in Hz
    pub sample_rate: usize,
    /// block size (per channel)
    pub blocksize: usize,
    /// channel count (in == out)
    pub channels: usize,
    /// Sample format
    pub format: AudioFormat,
}

#[derive(Clone, Copy)]
pub enum AudioFormat {
    Format24B16,
    Format24B32,
}

impl AudioFormat {
    pub fn parse(value: u8) -> (Self, usize) {
        let mut channels = value & AUDIO_FORMAT_CHANNEL_MASK;
        if channels == 0 {
            channels = 2;
        }

        let format = match value & AUDIO_FORMAT_FORMAT_MASK {
            AUDIO_FORMAT_24B16 => Self::Format24B16,
            AUDIO_FORMAT_24B32 => Self::Format24B32,
            _ => panic!("bad audio format"),
        };

        (format, channels as usize)
    }
}

/// Container for the input and output audio buffers
///
/// Use [ProgramVector::audio()] to access the audio buffers
///
/// [ProgramVector::audio()]: crate::program_vector::ProgramVector::audio
pub struct AudioBuffers {
    input: &'static *mut i32,
    output: &'static *mut i32,
    /// Current audio settings (set by the os / device)
    pub settings: AudioSettings,
    program_ready: Option<unsafe extern "C" fn()>,
}

impl AudioBuffers {
    pub(crate) fn new(
        input: &'static *mut i32,
        output: &'static *mut i32,
        settings: AudioSettings,
        program_ready: Option<unsafe extern "C" fn()>,
    ) -> Self {
        Self {
            input,
            output,
            settings,
            program_ready,
        }
    }

    /// Start processing audio samples
    ///
    /// Supply a closure which will be run for each audio block as it is received.  The closure will have access to
    /// an input and output buffer.  The number of channels depends on [self.settings.channels].  The buffers are invalidated after
    /// each block, so must not escape the closure.
    ///
    /// This function never terminates.
    ///
    /// [self.settings.channels]: AudioSettings
    pub fn run(
        &mut self,
        mut f: impl FnMut(&Buffer<Interleaved, &mut [i32]>, &mut Buffer<Interleaved, &mut [i32]>),
    ) -> ! {
        match self.settings.format {
            AudioFormat::Format24B16 => loop {
                self.process_shifted::<16>(&mut f);
            },
            AudioFormat::Format24B32 => loop {
                self.process_shifted::<8>(&mut f);
            },
        }
    }

    /// Process the next audio buffer
    pub fn process(
        &mut self,
        f: impl FnMut(&Buffer<Interleaved, &mut [i32]>, &mut Buffer<Interleaved, &mut [i32]>),
    ) {
        match self.settings.format {
            AudioFormat::Format24B16 => self.process_shifted::<16>(f),
            AudioFormat::Format24B32 => self.process_shifted::<8>(f),
        }
    }

    fn process_shifted<const SHIFT: i32>(
        &mut self,
        mut f: impl FnMut(&Buffer<Interleaved, &mut [i32]>, &mut Buffer<Interleaved, &mut [i32]>),
    ) {
        let Some(program_ready) = self.program_ready else {
            panic!("no audio available")
        };

        // Safety: Trusting the OS that the provided function is safe to call
        // Note: any callbacks are invoked during this call
        unsafe { program_ready() };

        // Safety: The OS provides a valid buffer of the appropriate length.
        // The buffers remain valid until the next call to program_ready()
        let input = unsafe {
            slice::from_raw_parts_mut(
                *self.input,
                self.settings.blocksize * self.settings.channels,
            )
        };

        // Safety: The OS provides a valid buffer of the appropriate length
        let output = unsafe {
            slice::from_raw_parts_mut(
                *self.output,
                self.settings.blocksize * self.settings.channels,
            )
        };

        let mut input_buffer: Buffer<Interleaved, &mut [i32]> =
            Buffer::new_mut(self.settings.channels, self.settings.blocksize, input);
        input_buffer <<= SHIFT;

        let mut output_buffer: Buffer<Interleaved, &mut [i32]> =
            Buffer::new_mut(self.settings.channels, self.settings.blocksize, output);

        f(&input_buffer, &mut output_buffer);

        output_buffer >>= SHIFT;
    }
}
