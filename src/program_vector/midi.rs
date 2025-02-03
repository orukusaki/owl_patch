extern crate alloc;

use core::{option::Option, ptr::NonNull};

use alloc::boxed::Box;
use spin::Mutex;

use crate::midi_message::MidiMessage;

use super::{ServiceCall, SystemFunction};

pub trait Callback: FnMut(MidiMessage) + Send {}

/// Send & receive midi messages
///
/// Use [ProgramVector::midi()] to obtain the interface. It can then be copied to any parts of your patch that need it.
///
/// [ProgramVector::midi()]: crate::program_vector::ProgramVector::midi
#[derive(Clone, Copy)]
pub struct Midi {
    send_callback: Option<extern "C" fn(u8, u8, u8, u8)>,
}
impl Midi {
    pub(crate) fn init(service_call: &mut ServiceCall) -> Self {
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

    pub(crate) fn new(send_callback: Option<extern "C" fn(u8, u8, u8, u8)>) -> Self {
        Self { send_callback }
    }

    /// Register a callback which is fired whenever a midi message is received
    pub fn on_receive(&self, callback: impl Callback + 'static) {
        RECEIVE_CALLBACK.lock().replace(Box::new(callback));
    }

    /// Send a midi message
    pub fn send(&self, message: MidiMessage) {
        if let Some(f) = self.send_callback {
            let bytes = message.as_bytes();
            f(bytes[0], bytes[1], bytes[2], bytes[3])
        }
    }
}

static RECEIVE_CALLBACK: Mutex<Option<Box<dyn Callback>>> = Mutex::new(None);

pub extern "C" fn midi_receive(port: u8, status: u8, d1: u8, d2: u8) {
    if let Some(callback) = RECEIVE_CALLBACK.lock().as_mut() {
        callback(MidiMessage::new(port, status, d1, d2));
    }
}
