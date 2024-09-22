extern crate alloc;

use core::cell::RefCell;

use alloc::boxed::Box;
use spin::Mutex;

use crate::midi_message::MidiMessage;

#[derive(Clone, Copy)]
pub struct Midi {
    send_callback: Option<extern "C" fn(u8, u8, u8, u8)>,
}
impl Midi {
    pub(crate) fn new(send_callback: Option<extern "C" fn(u8, u8, u8, u8)>) -> Self {
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
