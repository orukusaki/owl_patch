extern crate alloc;

use core::cell::RefCell;

use alloc::boxed::Box;
use spin::Mutex;

use crate::{ffi::service_call::SYSTEM_FUNCTION_MIDI, midi_message::MidiMessage};

use super::ServiceCall;

#[derive(Clone, Copy)]
pub struct Midi {
    send_callback: Option<extern "C" fn(u8, u8, u8, u8)>,
}
impl Midi {
    pub(crate) fn new(service_call: &mut ServiceCall) -> Self {
        // # Safety
        // We receve a raw function pointer, and hope that it relates to a function
        // with the expected signature, but have no way to really verify this.
        let send_callback = unsafe {
            core::mem::transmute(service_call.request_callback(SYSTEM_FUNCTION_MIDI).ok())
        };
        Self { send_callback }
    }

    pub fn on_receive(&self, callback: impl FnMut(MidiMessage) + Send + 'static) {
        MIDI_CALLBACK
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
static MIDI_CALLBACK: Mutex<RefCell<Option<Box<dyn FnMut(MidiMessage) + Send>>>> =
    Mutex::new(RefCell::new(None));

pub extern "C" fn midi_callback(port: u8, status: u8, d1: u8, d2: u8) {
    let mut cb = MIDI_CALLBACK.lock().take();
    if let Some(ref mut callback) = cb {
        callback(MidiMessage::new(port, status, d1, d2));
    }
    MIDI_CALLBACK.lock().replace(cb);
}
