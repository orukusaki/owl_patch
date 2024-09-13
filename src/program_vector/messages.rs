use crate::ffi::program_vector::ProgramVectorAudioStatus;
use core::{
    cell::RefCell,
    ffi::{c_char, CStr},
    sync::atomic::{compiler_fence, Ordering},
};

use cortex_m as _;
use critical_section::Mutex;

pub struct Messages {
    error: &'static mut i8,
    message: &'static mut *mut c_char,
    status: Option<unsafe extern "C" fn(ProgramVectorAudioStatus)>,
    buffer: [u8; 64],
}

unsafe impl Send for Messages {}

static MESSAGES: Mutex<RefCell<Option<Messages>>> = Mutex::new(RefCell::new(None));

impl Messages {
    pub fn init(
        error: &'static mut i8,
        message: &'static mut *mut c_char,
        status: Option<unsafe extern "C" fn(ProgramVectorAudioStatus)>,
    ) {
        critical_section::with(|cs| {
            MESSAGES.replace(
                cs,
                Some(Self {
                    error,
                    message,
                    status,
                    buffer: [0; 64],
                }),
            )
        });
    }

    fn error(&mut self, code: i8, message: &CStr) -> ! {
        *self.error = code;
        *self.message = message.as_ptr() as *mut i8;
        if let Some(program_status) = self.status {
            // This function never returns
            unsafe {
                program_status(ProgramVectorAudioStatus::AUDIO_ERROR_STATUS);
            }
            unreachable!();
        }
        loop {
            compiler_fence(Ordering::SeqCst);
        }
    }

    fn debug_message(&mut self, message: &str) {
        let len = message.len().min(self.buffer.len() - 1);
        self.buffer[..len].copy_from_slice(&message.as_bytes()[..len]);
        self.buffer[len] = 0;
        *self.message = self.buffer.as_mut_ptr() as *mut c_char;
    }
}

pub fn error(code: i8, message: &CStr) -> ! {
    critical_section::with(|cs| {
        if let Some(messager) = MESSAGES.borrow_ref_mut(cs).as_mut() {
            messager.error(code, message)
        }
    });

    loop {
        compiler_fence(Ordering::SeqCst);
    }
}

pub fn debug_message(message: &str) {
    critical_section::with(|cs| {
        if let Some(messager) = MESSAGES.borrow_ref_mut(cs).as_mut() {
            messager.debug_message(message)
        }
    });
}
