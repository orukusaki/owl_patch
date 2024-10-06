use core::slice;

use alloc::boxed::Box;

use crate::sample_buffer::{Buffer, ConvertFrom, Interleaved, Samplei32, Samplew16};

use super::{
    AUDIO_FORMAT_24B16, AUDIO_FORMAT_24B32, AUDIO_FORMAT_CHANNEL_MASK, AUDIO_FORMAT_FORMAT_MASK,
};

#[derive(Clone, Copy)]
pub struct AudioSettings {
    pub sample_rate: usize,
    pub blocksize: usize,
    pub channels: usize,
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

pub struct AudioBuffers {
    input: &'static *mut i32,
    output: &'static *mut i32,
    pub settings: AudioSettings,
    program_ready: Option<unsafe extern "C" fn()>,
}

impl AudioBuffers {
    pub fn new(
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

    pub fn run(
        &mut self,
        f: impl FnMut(&Buffer<i32, Interleaved, Box<[i32]>>, &mut Buffer<i32, Interleaved, Box<[i32]>>),
    ) -> ! {
        match self.settings.format {
            AudioFormat::Format24B16 => self.run_with_format::<Samplew16>(f),
            AudioFormat::Format24B32 => self.run_with_format::<Samplei32>(f),
        }
    }

    fn run_with_format<F>(
        &mut self,
        mut f: impl FnMut(
            &Buffer<i32, Interleaved, Box<[i32]>>,
            &mut Buffer<i32, Interleaved, Box<[i32]>>,
        ),
    ) -> !
    where
        i32: ConvertFrom<F>,
        F: ConvertFrom<i32> + Copy,
    {
        let Some(program_ready) = self.program_ready else {
            panic!("no audio available")
        };
        //TODO: allocate upfront for memory reporting
        let mut input_buffer =
            Buffer::<i32, Interleaved, _>::new(self.settings.channels, self.settings.blocksize);

        let mut output_buffer =
            Buffer::<i32, Interleaved, _>::new(self.settings.channels, self.settings.blocksize);
        loop {
            // Safety: Trusting the OS that the provided function is safe to call
            // Note: any callbacks are invoked during this call
            unsafe { program_ready() };

            // Safety: The OS provides a valid buffer of the appropriate length
            let input = unsafe {
                slice::from_raw_parts(
                    (*self.input) as *const F,
                    self.settings.blocksize * self.settings.channels,
                )
            };

            input_buffer.convert_from(input);

            f(&input_buffer, &mut output_buffer);

            // Safety: The OS provides a valid buffer of the appropriate length
            let mut output = unsafe {
                slice::from_raw_parts_mut(
                    (*self.output) as *mut F,
                    self.settings.blocksize * self.settings.channels,
                )
            };

            output.convert_from(&output_buffer);
        }
    }
}
