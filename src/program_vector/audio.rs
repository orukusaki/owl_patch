use core::slice;

use crate::sample_buffer::{BufferMut, BufferRef, Interleaved, Sample};

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

pub struct AudioBuffers<'a> {
    input: &'a *mut i32,
    output: &'a *mut i32,
    settings: AudioSettings,
    program_ready: Option<unsafe extern "C" fn()>,
}

impl<'a> AudioBuffers<'a> {
    pub fn new(
        input: &'a *mut i32,
        output: &'a *mut i32,
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

    pub fn run<F: Sample<BaseType = i32>>(
        &mut self,
        mut f: impl FnMut(BufferRef<F, Interleaved>, BufferMut<F, Interleaved>),
    ) -> ! {
        assert!(core::mem::size_of::<F>() == core::mem::size_of::<i32>());
        let Some(program_ready) = self.program_ready else {
            panic!("no audio available")
        };
        loop {
            // Safety: Trusting the OS that the provided function is safe to call
            // Note: any callbacks are invoked during this call
            unsafe { program_ready() };

            let input = BufferRef::new(
                // Safety: The OS provides a valid buffer of the appropriate length.
                // The type F is the same size as i32, as asserted above
                unsafe {
                    slice::from_raw_parts(
                        (*self.input) as *const F,
                        self.settings.blocksize * self.settings.channels,
                    )
                },
                self.settings.channels,
                self.settings.blocksize,
            );
            let output = BufferMut::new(
                // Safety: The OS provides a valid buffer of the appropriate length
                // The type F is the same size as i32, as asserted above
                unsafe {
                    slice::from_raw_parts_mut(
                        (*self.output) as *mut F,
                        self.settings.blocksize * self.settings.channels,
                    )
                },
                self.settings.channels,
                self.settings.blocksize,
            );
            f(input, output)
        }
    }
}
