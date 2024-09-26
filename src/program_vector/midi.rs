extern crate alloc;

use core::{cell::RefCell, option::Option, ptr::NonNull};

use alloc::boxed::Box;
use spin::Mutex;

use crate::midi_message::MidiMessage;

use super::{ServiceCall, SystemFunction};

#[derive(Clone, Copy)]
pub struct Midi {
    send_callback: Option<extern "C" fn(u8, u8, u8, u8)>,
}
impl Midi {
    pub fn init(service_call: &mut ServiceCall) -> Self {
        let _ = service_call
            .register_callback(SystemFunction::SystemFunctionMidi, midi_receive as *mut _);

        // # Safety
        // We receve a raw function pointer, and hope that it relates to a function
        // with the expected signature, but have no way to really verify this.
        let send_callback = unsafe {
            core::mem::transmute::<Option<NonNull<()>>, Option<extern "C" fn(u8, u8, u8, u8)>>(
                service_call
                    .request_callback(SystemFunction::SystemFunctionMidi)
                    .ok(),
            )
        };
        Self::new(send_callback)
    }

    pub fn new(send_callback: Option<extern "C" fn(u8, u8, u8, u8)>) -> Self {
        Self { send_callback }
    }

    pub fn on_receive(&self, callback: impl FnMut(MidiMessage) + Send + 'static) {
        RECEIVE_CALLBACK
            .lock()
            .borrow_mut()
            .replace(Box::new(callback));
    }

    pub fn send(&self, message: MidiMessage) {
        if let Some(f) = self.send_callback {
            let bytes = message.as_bytes();
            f(bytes[0], bytes[1], bytes[2], bytes[3])
        }
    }
}

#[allow(clippy::type_complexity)]
static RECEIVE_CALLBACK: Mutex<RefCell<Option<Box<dyn FnMut(MidiMessage) + Send>>>> =
    Mutex::new(RefCell::new(None));

pub extern "C" fn midi_receive(port: u8, status: u8, d1: u8, d2: u8) {
    let mut cb = RECEIVE_CALLBACK.lock().take();
    if let Some(ref mut callback) = cb {
        callback(MidiMessage::new(port, status, d1, d2));
    }
    RECEIVE_CALLBACK.lock().replace(cb);
}
