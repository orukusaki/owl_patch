use core::{
    cell::RefCell,
    ffi::{c_char, CStr},
};

use spin::Mutex;

pub struct Messages<'a> {
    message: &'a mut *mut c_char,
    buffer: [u8; 64],
}

unsafe impl<'a> Send for Messages<'a> {}

static INSTANCE: Mutex<RefCell<Option<Messages>>> = Mutex::new(RefCell::new(None));

impl Messages<'static> {
    pub fn init(message: &'static mut *mut c_char) {
        INSTANCE.lock().replace(Some(Self {
            message,
            buffer: [0; 64],
        }));
    }

    fn debug_message(&mut self, message: &str) {
        let len = message.len().min(self.buffer.len() - 1);
        self.buffer[..len].copy_from_slice(&message.as_bytes()[..len]);
        self.buffer[len] = 0;
        *self.message = CStr::from_bytes_until_nul(&self.buffer).unwrap().as_ptr() as *mut i8;
    }
}

pub fn debug_message(message: &str) {
    if let Some(messager) = INSTANCE.lock().get_mut() {
        messager.debug_message(message)
    }
}
