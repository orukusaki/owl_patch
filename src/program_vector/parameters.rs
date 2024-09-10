extern crate alloc;

use core::{ffi::c_char, slice};

use alloc::ffi::CString;

pub use crate::ffi::openware_midi_control::{PatchButtonId, PatchParameterId};

// Handles the Patch input and output parameters; knobs and buttons etc
pub struct Parameters<'a> {
    parameters: &'a *mut i16,
    size: usize,
    buttons: &'a u16,
    register_patch_parameter: Option<unsafe extern "C" fn(id: u8, name: *const c_char)>,
    set_patch_parameter: Option<unsafe extern "C" fn(id: u8, value: i16)>,
    set_button: Option<unsafe extern "C" fn(id: u8, state: u16, samples: u16)>,
    button_changed_callback:
        &'a mut Option<unsafe extern "C" fn(bid: u8, state: u16, samples: u16)>,
}

impl<'a> Parameters<'a> {
    pub fn new(
        parameters: &'a *mut i16,
        size: usize,
        buttons: &'a u16,
        register_patch_parameter: Option<unsafe extern "C" fn(id: u8, name: *const c_char)>,
        set_patch_parameter: Option<unsafe extern "C" fn(id: u8, value: i16)>,
        set_button: Option<unsafe extern "C" fn(id: u8, state: u16, samples: u16)>,
        button_changed_callback: &'a mut Option<
            unsafe extern "C" fn(bid: u8, state: u16, samples: u16),
        >,
    ) -> Self {
        Self {
            parameters,
            size,
            buttons,
            register_patch_parameter,
            set_patch_parameter,
            set_button,
            button_changed_callback,
        }
    }

    pub fn register(&mut self, pid: PatchParameterId, name: &str) {
        if let Some(register_patch_parameter) = self.register_patch_parameter {
            let c_name = CString::new(name).expect("failed to create paremeter name string");
            // Safety: c_name does not need to exist after this function call, so it can safely be
            // dropped at the end of this scope
            unsafe { register_patch_parameter(pid as u8, c_name.as_ptr()) }
        }
    }

    pub fn set(&mut self, pid: PatchParameterId, value: f32) {
        if let Some(set_patch_parameter) = self.set_patch_parameter {
            unsafe { set_patch_parameter(pid as u8, (value * 4096.0) as i16) }
        }
    }

    pub fn get(&mut self, pid: PatchParameterId) -> f32 {
        self.values()[pid as usize] as f32 / 4096.0
    }

    pub fn values(&self) -> &[i16] {
        unsafe { slice::from_raw_parts_mut(*self.parameters, self.size) }
    }

    pub fn set_button_changed_callback(
        &mut self,
        button_changed_callback: unsafe extern "C" fn(bid: u8, state: u16, samples: u16),
    ) {
        self.button_changed_callback
            .replace(button_changed_callback);
    }

    pub fn set_button(&mut self, bid: PatchButtonId, state: bool) {
        if let Some(set_button) = self.set_button {
            unsafe { set_button(bid as u8, if state { 0xfff } else { 0 }, 0) };
        }
    }

    pub fn get_button(&self, bid: PatchButtonId) -> bool {
        (*self.buttons) & (1 << bid as u8) != 0
    }
}
