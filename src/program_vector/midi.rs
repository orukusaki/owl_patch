extern crate alloc;

use core::cell::RefCell;

use alloc::boxed::Box;
use critical_section::Mutex;

use crate::midi_message::MidiMessage;

pub struct Midi {
    send_callback: Option<extern "C" fn(u8, u8, u8, u8)>,
}
impl Midi {
    pub(crate) fn new(send_callback: Option<extern "C" fn(u8, u8, u8, u8)>) -> Self {
        Self { send_callback }
    }

    pub fn on_receive(callback: impl FnMut(MidiMessage) + Send + 'static) {
        critical_section::with(|cs| MIDI_CALLBACK.replace(cs, Some(Box::new(callback))));
    }

    pub fn send(&self, message: MidiMessage) {
        if let Some(f) = self.send_callback {
            f(message.port, message.d0, message.d1, message.d2)
        }
    }
}

static MIDI_CALLBACK: Mutex<RefCell<Option<Box<dyn FnMut(MidiMessage) + Send>>>> =
    Mutex::new(RefCell::new(None));

pub unsafe extern "C" fn midi_callback(port: u8, status: u8, d1: u8, d2: u8) {
    let mut cb = critical_section::with(|cs| MIDI_CALLBACK.take(cs));
    if let Some(ref mut callback) = cb {
        callback(MidiMessage::new(port, status, d1, d2));
    }
    critical_section::with(|cs| MIDI_CALLBACK.replace(cs, cb));
}