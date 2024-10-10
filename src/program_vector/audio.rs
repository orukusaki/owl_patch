use core::slice;

use alloc::boxed::Box;

use crate::sample_buffer::{Buffer, ConvertFrom, Interleaved};

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

#[derive(Clone, Copy, Default)]
#[repr(transparent)]
struct Samplew16(i32);

// The C code for 24B16 reads two 16 bit words and swaps them over to create a 32 bit value. I *think* that the codec is
// actually operating in 16 bit mode though, so here we're just doing a 16 bit shift instead.
// The C code for 24B32 does an 8 bit shift, I'm fairly certain it is actually 24 bit.

impl ConvertFrom<i32> for Samplew16 {
    fn convert_from(&mut self, value: i32) {
        self.0 = value >> 16
    }
}

impl ConvertFrom<Samplew16> for i32 {
    fn convert_from(&mut self, value: Samplew16) {
        *self = value.0 << 16;
    }
}

#[derive(Clone, Copy, Default)]
#[repr(transparent)]
struct Samplei32(i32);

impl ConvertFrom<i32> for Samplei32 {
    fn convert_from(&mut self, value: i32) {
        self.0 = value >> 8;
    }
}

impl ConvertFrom<Samplei32> for i32 {
    fn convert_from(&mut self, value: Samplei32) {
        *self = value.0 << 8;
    }
}

/// Container for the input and output audio buffers
pub struct AudioBuffers {
    input: &'static *mut i32,
    output: &'static *mut i32,
    /// Current audio settings (set by the os / device)
    pub settings: AudioSettings,
    program_ready: Option<unsafe extern "C" fn()>,
    input_buffer: Buffer<Interleaved, Box<[i32]>>,
    output_buffer: Buffer<Interleaved, Box<[i32]>>,
}

impl AudioBuffers {
    pub(crate) fn new(
        input: &'static *mut i32,
        output: &'static *mut i32,

        settings: AudioSettings,
        program_ready: Option<unsafe extern "C" fn()>,
    ) -> Self {
        let input_buffer = Buffer::<Interleaved, _>::new(settings.channels, settings.blocksize);
        let output_buffer = Buffer::<Interleaved, _>::new(settings.channels, settings.blocksize);

        Self {
            input,
            output,
            settings,
            program_ready,
            input_buffer,
            output_buffer,
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
        f: impl FnMut(&Buffer<Interleaved, Box<[i32]>>, &mut Buffer<Interleaved, Box<[i32]>>),
    ) -> ! {
        match self.settings.format {
            AudioFormat::Format24B16 => self.run_with_format::<Samplew16>(f),
            AudioFormat::Format24B32 => self.run_with_format::<Samplei32>(f),
        }
    }

    fn run_with_format<F>(
        &mut self,
        mut f: impl FnMut(&Buffer<Interleaved, Box<[i32]>>, &mut Buffer<Interleaved, Box<[i32]>>),
    ) -> !
    where
        i32: ConvertFrom<F>,
        F: ConvertFrom<i32> + Copy,
    {
        let Some(program_ready) = self.program_ready else {
            panic!("no audio available")
        };

        loop {
            // Safety: Trusting the OS that the provided function is safe to call
            // Note: any callbacks are invoked during this call
            unsafe { program_ready() };

            // Safety: The OS provides a valid buffer of the appropriate length.
            // The buffers remain valid until the next call to program_ready()
            let input = unsafe {
                slice::from_raw_parts(
                    (*self.input) as *const F,
                    self.settings.blocksize * self.settings.channels,
                )
            };

            self.input_buffer.convert_from(input);

            f(&self.input_buffer, &mut self.output_buffer);

            // Safety: The OS provides a valid buffer of the appropriate length
            let mut output = unsafe {
                slice::from_raw_parts_mut(
                    (*self.output) as *mut F,
                    self.settings.blocksize * self.settings.channels,
                )
            };

            output.convert_from(&self.output_buffer);
        }
    }
}
