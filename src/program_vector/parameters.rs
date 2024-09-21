extern crate alloc;

use core::{cell::RefCell, ffi::c_char};

use alloc::{boxed::Box, ffi::CString};
use num::FromPrimitive;
use spin::Mutex;

pub use crate::ffi::openware_midi_control::{PatchButtonId, PatchParameterId};

/// Handles the Patch input and output parameters; knobs and buttons etc
#[derive(Clone, Copy)]
pub struct Parameters<'a> {
    parameters: &'a [i16],
    buttons: &'a u16,
    register_patch_parameter: Option<unsafe extern "C" fn(id: u8, name: *const c_char)>,
    set_patch_parameter: Option<unsafe extern "C" fn(id: u8, value: i16)>,
    set_button: Option<unsafe extern "C" fn(id: u8, state: u16, samples: u16)>,
}

impl<'a> Parameters<'a> {
    pub fn new(
        parameters: &'a [i16],
        buttons: &'a u16,
        register_patch_parameter: Option<unsafe extern "C" fn(id: u8, name: *const c_char)>,
        set_patch_parameter: Option<unsafe extern "C" fn(id: u8, value: i16)>,
        set_button: Option<unsafe extern "C" fn(id: u8, state: u16, samples: u16)>,
    ) -> Self {
        Self {
            parameters,
            buttons,
            register_patch_parameter,
            set_patch_parameter,
            set_button,
        }
    }

    pub fn register(&self, pid: PatchParameterId, name: &str) {
        if let Some(register_patch_parameter) = self.register_patch_parameter {
            let c_name = CString::new(name).expect("failed to create paremeter name string");
            // Safety: c_name does not need to exist after this function call, so it can safely be
            // dropped at the end of this scope
            unsafe { register_patch_parameter(pid as u8, c_name.as_ptr()) }
        }
    }

    pub fn set(&self, pid: PatchParameterId, value: f32) {
        if let Some(set_patch_parameter) = self.set_patch_parameter {
            unsafe { set_patch_parameter(pid as u8, (value * 4096.0) as i16) }
        }
    }

    pub fn get(&self, pid: PatchParameterId) -> f32 {
        self.parameters[pid as usize] as f32 / 4096.0
    }

    pub fn on_button_changed(
        &self,
        callback: impl FnMut(PatchButtonId, u16, u16) + Send + 'static,
    ) {
        BUTTON_CALLBACK.lock().replace(Some(Box::new(callback)));
    }

    pub fn set_button(&self, bid: PatchButtonId, state: bool) {
        if let Some(set_button) = self.set_button {
            unsafe { set_button(bid as u8, if state { 0xfff } else { 0 }, 0) };
        }
    }

    pub fn get_button(&self, bid: PatchButtonId) -> bool {
        (*self.buttons) & (1 << bid as u8) != 0
    }
}

#[allow(clippy::type_complexity)]
static BUTTON_CALLBACK: Mutex<RefCell<Option<Box<dyn FnMut(PatchButtonId, u16, u16) + Send>>>> =
    Mutex::new(RefCell::new(None));

pub extern "C" fn button_changed_callback(bid: u8, state: u16, samples: u16) {
    let mut cb = BUTTON_CALLBACK.lock().take();
    if let Some(ref mut callback) = cb {
        callback(PatchButtonId::from_u8(bid).unwrap(), state, samples);
    }
    BUTTON_CALLBACK.lock().replace(cb);
}
