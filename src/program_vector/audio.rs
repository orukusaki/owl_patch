use core::{marker::PhantomData, slice};

use crate::sample_buffer::{BufferMut, BufferRef, Interleaved, Sample};

use super::{
    error, AUDIO_FORMAT_24B16, AUDIO_FORMAT_24B32, AUDIO_FORMAT_CHANNEL_MASK,
    AUDIO_FORMAT_FORMAT_MASK, CONFIGURATION_ERROR_STATUS,
};

pub struct AudioSettings {
    pub sample_rate: usize,
    pub blocksize: usize,
    pub channels: usize,
    pub format: AudioFormat,
}

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
            _ => error(CONFIGURATION_ERROR_STATUS, c"bad audio format"),
        };

        (format, channels as usize)
    }
}

pub struct AudioBuffers<'a, F: Sample<BaseType = i32>> {
    input: &'a *mut i32,
    output: &'a *mut i32,
    settings: AudioSettings,
    _format: PhantomData<F>,
    program_ready: Option<unsafe extern "C" fn()>,
}

impl<'a, F: Sample<BaseType = i32>> AudioBuffers<'a, F> {
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
            _format: PhantomData,
            program_ready,
        }
    }

    pub fn run(
        &mut self,
        mut f: impl FnMut(BufferRef<F, Interleaved>, BufferMut<F, Interleaved>),
    ) -> ! {
        assert!(core::mem::size_of::<F>() == core::mem::size_of::<i32>());
        let Some(program_ready) = self.program_ready else {
            error(CONFIGURATION_ERROR_STATUS, c"no audio available")
        };
        loop {
            // Safety: Trusting the OS that the provided function is safe to call
            unsafe { program_ready() };

            let input = BufferRef::new(
                // Safety: The OS provides a valid buffer of the appropriate length.
                // The type F is the same size as i32, as asserted above
                unsafe {
                    slice::from_raw_parts(
                        core::mem::transmute::<*mut i32, *const F>(*self.input),
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
                        core::mem::transmute::<*mut i32, *mut F>(*self.output),
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