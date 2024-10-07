use ::core::option::Option;
use core::{
    cell::RefCell,
    ffi::c_char,
    sync::atomic::{compiler_fence, Ordering},
};

use spin::Mutex;

use crate::ffi::program_vector::ProgramVectorAudioStatus;

use super::CONFIGURATION_ERROR_STATUS;

pub struct Messages {
    message: &'static mut *mut c_char,
    error: &'static mut i8,
    program_status: Option<unsafe extern "C" fn(status: ProgramVectorAudioStatus)>,
    buffer: [u8; 64],
}

unsafe impl Send for Messages {}

static INSTANCE: Mutex<RefCell<Option<Messages>>> = Mutex::new(RefCell::new(None));

impl Messages {
    pub fn init(
        message: &'static mut *mut c_char,
        error: &'static mut i8,
        program_status: Option<unsafe extern "C" fn(status: ProgramVectorAudioStatus)>,
    ) {
        INSTANCE
            .lock()
            .replace(Some(Self::new(message, error, program_status)));
    }

    pub fn new(
        message: &'static mut *mut c_char,
        error: &'static mut i8,
        program_status: Option<unsafe extern "C" fn(status: ProgramVectorAudioStatus)>,
    ) -> Self {
        Self {
            message,
            error,
            program_status,
            buffer: [0u8; 64],
        }
    }

    fn debug_message(&mut self, message: &str) {
        let len = message.len().min(self.buffer.len() - 1);
        self.buffer[..len].copy_from_slice(&message.as_bytes()[..len]);
        self.buffer[len] = 0;
        *self.message = self.buffer.as_mut_ptr() as *mut c_char
    }

    fn error(&mut self, message: &str) {
        self.debug_message(message);
        *self.error = CONFIGURATION_ERROR_STATUS;

        if let Some(program_status) = self.program_status {
            // This function never returns
            unsafe {
                program_status(ProgramVectorAudioStatus::AUDIO_ERROR_STATUS);
            }
        }
    }
}

pub fn debug_message(message: &str) {
    if let Some(instance) = INSTANCE.lock().get_mut() {
        instance.debug_message(message)
    }
}

pub fn error(message: &str) -> ! {
    if let Some(instance) = INSTANCE.lock().get_mut() {
        instance.error(message);
    } // else { ¯\(ツ)/¯ }

    loop {
        compiler_fence(Ordering::SeqCst);
    }
}
