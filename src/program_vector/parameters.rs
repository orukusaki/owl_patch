extern crate alloc;

use core::ffi::c_char;

use alloc::{boxed::Box, ffi::CString};
use num::FromPrimitive;
use spin::Mutex;

pub use crate::ffi::openware_midi_control::{PatchButtonId, PatchParameterId};

/// Handles the Patch input and output parameters; knobs and buttons etc
#[derive(Clone, Copy)]
pub struct Parameters {
    parameters: &'static [i16],
    buttons: &'static u16,
    register_patch_parameter: Option<unsafe extern "C" fn(id: u8, name: *const c_char)>,
    set_patch_parameter: Option<unsafe extern "C" fn(id: u8, value: i16)>,
    set_button: Option<unsafe extern "C" fn(id: u8, state: u16, samples: u16)>,
}

impl Parameters {
    pub(crate) fn new(
        parameters: &'static [i16],
        buttons: &'static u16,
        register_patch_parameter: Option<unsafe extern "C" fn(id: u8, name: *const c_char)>,
        set_patch_parameter: Option<unsafe extern "C" fn(id: u8, value: i16)>,
        set_button: Option<unsafe extern "C" fn(id: u8, state: u16, samples: u16)>,
        button_changed_callback: &mut Option<
            unsafe extern "C" fn(bid: u8, state: u16, samples: u16),
        >,
    ) -> Self {
        *button_changed_callback = Some(button_changed);
        Self {
            parameters,
            buttons,
            register_patch_parameter,
            set_patch_parameter,
            set_button,
        }
    }

    /// Register an input or output parameter
    ///
    /// ```
    /// # use owl_patch::{program_vector::Parameters, PatchParameterId};
    /// # let mut pv = unsafe { owl_patch::test_harness::program_vector() };
    /// # let parameters = pv.parameters();
    /// // Register an input param
    /// parameters.register(PatchParameterId::PARAMETER_A, "volume");
    /// // Postfixing the name with ">" designates the parameter as an output
    /// parameters.register(PatchParameterId::PARAMETER_F, "MyOutput>");
    /// ```
    pub fn register(&self, pid: PatchParameterId, name: &str) {
        if let Some(register_patch_parameter) = self.register_patch_parameter {
            let c_name = CString::new(name).expect("failed to create paremeter name string");
            // Safety: c_name does not need to exist after this function call, so it can safely be
            // dropped at the end of this scope
            unsafe { register_patch_parameter(pid as u8, c_name.as_ptr()) }
        }
    }

    /// Get the value of an input parameter
    ///
    /// return value will be in the range (-1.0..1.0)
    ///
    /// ```
    /// # use owl_patch::{program_vector::Parameters, PatchParameterId};
    /// # let mut pv = unsafe { owl_patch::test_harness::program_vector() };
    /// # let parameters = pv.parameters();
    /// parameters.register(PatchParameterId::PARAMETER_A, "volume");
    /// let value = parameters.get(PatchParameterId::PARAMETER_A);
    /// ```
    pub fn get(&self, pid: PatchParameterId) -> f32 {
        self.parameters[pid as usize] as f32 / 4096.0
    }

    /// Set the value of an output parameter
    ///
    /// value should be in the range (-1.0..1.0)
    ///
    /// ```
    /// # use owl_patch::{program_vector::Parameters, PatchParameterId};
    /// # let mut pv = unsafe { owl_patch::test_harness::program_vector() };
    /// # let parameters = pv.parameters();
    /// parameters.register(PatchParameterId::PARAMETER_F, "MyOutput>");
    /// parameters.set(PatchParameterId::PARAMETER_F, 0.5);
    /// ```
    pub fn set(&self, pid: PatchParameterId, value: f32) {
        if let Some(set_patch_parameter) = self.set_patch_parameter {
            unsafe { set_patch_parameter(pid as u8, (value * 4096.0) as i16) }
        }
    }

    /// Set a callback for button changed events
    ///
    /// The 'value' parameter will generally be either 0 or 0xfff, 'samples' is the number
    /// of samples through the previous audio buffer playback that the change occurred.
    ///
    /// ```
    /// # use owl_patch::{program_vector::Parameters, PatchButtonId};
    /// # let mut pv = unsafe { owl_patch::test_harness::program_vector() };
    /// # let parameters = pv.parameters();
    /// parameters.on_button_changed(|bid, value, samples| {
    ///     // Do something
    /// });
    /// ```
    pub fn on_button_changed(
        &self,
        callback: impl FnMut(PatchButtonId, u16, u16) + Send + 'static,
    ) {
        BUTTON_CALLBACK.lock().replace(Box::new(callback));
    }

    /// Get an input button value
    /// ```
    /// # use owl_patch::{program_vector::Parameters, PatchButtonId};
    /// # let mut pv = unsafe { owl_patch::test_harness::program_vector() };
    /// # let parameters = pv.parameters();
    /// if parameters.get_button(PatchButtonId::BUTTON_1) {
    /// //.. do something
    /// }
    /// ```
    pub fn get_button(&self, bid: PatchButtonId) -> bool {
        (*self.buttons) & (1 << bid as u8) != 0
    }

    /// Set an output button value
    /// ```
    /// # use owl_patch::{program_vector::Parameters, PatchButtonId};
    /// # let mut pv = unsafe { owl_patch::test_harness::program_vector() };
    /// # let parameters = pv.parameters();
    /// parameters.set_button(PatchButtonId::BUTTON_3, true);
    /// ```
    pub fn set_button(&self, bid: PatchButtonId, state: bool) {
        if let Some(set_button) = self.set_button {
            unsafe { set_button(bid as u8, if state { 0xfff } else { 0 }, 0) };
        }
    }
}

#[allow(clippy::type_complexity)]
static BUTTON_CALLBACK: Mutex<Option<Box<dyn FnMut(PatchButtonId, u16, u16) + Send>>> =
    Mutex::new(None);

pub extern "C" fn button_changed(bid: u8, state: u16, samples: u16) {
    if let Some(callback) = BUTTON_CALLBACK.lock().as_mut() {
        callback(
            PatchButtonId::from_u8(bid).unwrap_or(PatchButtonId::BUTTON_1),
            state,
            samples,
        );
    }
}
