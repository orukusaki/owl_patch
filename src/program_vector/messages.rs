use core::{
    cell::RefCell,
    ffi::{c_char, CStr},
};

use cortex_m as _;
use critical_section::Mutex;

pub struct Messages {
    message: &'static mut *mut c_char,
    buffer: [u8; 64],
}

unsafe impl Send for Messages {}

static INSTANCE: Mutex<RefCell<Option<Messages>>> = Mutex::new(RefCell::new(None));

impl Messages {
    pub fn init(message: &'static mut *mut c_char) {
        critical_section::with(|cs| {
            INSTANCE.replace(
                cs,
                Some(Self {
                    message,
                    buffer: [0; 64],
                }),
            )
        });
    }

    fn debug_message(&mut self, message: &str) {
        let len = message.len().min(self.buffer.len() - 1);
        self.buffer[..len].copy_from_slice(&message.as_bytes()[..len]);
        self.buffer[len] = 0;
        *self.message = CStr::from_bytes_until_nul(&self.buffer).unwrap().as_ptr() as *mut i8;
    }
}

pub fn debug_message(message: &str) {
    critical_section::with(|cs| {
        if let Some(messager) = INSTANCE.borrow_ref_mut(cs).as_mut() {
            messager.debug_message(message)
        }
    });
}
