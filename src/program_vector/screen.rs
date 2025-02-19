extern crate alloc;

use alloc::boxed::Box;
use core::option::Option;
use spin::Mutex;

use super::service_call::{ServiceCall, SystemFunction};
use crate::screen_buffer::MonoScreenBuffer;

type StaticCallBack = Mutex<Option<Box<dyn FnMut(&mut MonoScreenBuffer) + Send>>>;

static DRAW_CALLBACK: StaticCallBack = StaticCallBack::new(None);

pub extern "C" fn draw_callback(pixels: *mut u8, width: u16, height: u16) {
    if let Some(callback) = DRAW_CALLBACK.lock().as_mut() {
        let pixel_slice =
            unsafe { core::slice::from_raw_parts_mut(pixels, (width * height) as usize / 8) };
        let mut screen = MonoScreenBuffer::new(pixel_slice, width, height);
        callback(&mut screen);
    }
}

/// Display callback service
///
/// Use [ProgramVector::screen()] to obtain this service.
///
/// [ProgramVector::screen()]: crate::program_vector::ProgramVector::screen
pub struct Screen<'a> {
    service_call: &'a ServiceCall,
}

impl<'a> Screen<'a> {
    pub(crate) fn new(service_call: &'a ServiceCall) -> Self {
        Self { service_call }
    }
    /// Register a callback used to render each frame to the display
    pub fn on_draw(&self, callback: impl FnMut(&mut MonoScreenBuffer) + Send + 'static) {
        if self
            .service_call
            .register_callback(SystemFunction::SystemFunctionDraw, draw_callback as *mut _)
            .is_ok()
        {
            DRAW_CALLBACK.lock().replace(Box::new(callback));
        }
    }
}
