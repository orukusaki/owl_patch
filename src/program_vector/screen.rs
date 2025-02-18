extern crate alloc;

use core::{marker::PhantomData, option::Option};

use alloc::boxed::Box;
use embedded_graphics_core::{
    pixelcolor::{Gray8, Rgb565},
    prelude::{DrawTarget, PixelColor},
};
use embedded_graphics_framebuf::{backends::FrameBufferBackend, FrameBuf};
use spin::{Mutex, MutexGuard};

use super::service_call::{ServiceCall, SystemFunction};

// tood: some generic way to abstract over screen type - maybe using <impl Into<Grey8>>
// but maybe that should be optional? If a patch wants to provide a different mono/colour
// callback, then shouldn't we let them?
// on_draw_colour, on_draw_mono, on_draw etc?
// The actual callback needs to respect the device type - to avoid memory problems from the different buffer sizes
// So maybe in the generic case we need one or two converting buffers, that convert on set/get

// static DRAW_CALLBACK_MONO: Mutex<
//     Option<Box<dyn FnMut(&mut FrameBuf<Gray8, ScreenBuffer<Gray8>>) + Send>>,
// > = Mutex::new(None);

// static DRAW_CALLBACK_COLOR: Mutex<
//     Option<Box<dyn FnMut(&mut FrameBuf<Rgb565, ScreenBuffer<Rgb565>>) + Send>>,
// > = Mutex::new(None);

pub extern "C" fn draw_callback_mono(pixels: *mut u8, width: u16, height: u16) {
    if let Some(callback) = Screen::<Gray8>::callback().as_mut() {
        let screen = ScreenBuffer::<Gray8>::new(pixels, width, height);
        let mut buff = FrameBuf::new(screen, width as usize, height as usize);
        callback(&mut buff);
    }
}

pub extern "C" fn draw_callback_color(pixels: *mut u8, width: u16, height: u16) {
    if let Some(callback) = Screen::<Rgb565>::callback().as_mut() {
        let screen = ScreenBuffer::<Rgb565>::new(pixels, width, height);
        let mut buff = FrameBuf::new(screen, width as usize, height as usize);
        callback(&mut buff);
    }
}

pub struct Screen<C: PixelColor> {
    _phantom: PhantomData<C>,
}

impl Screen<Gray8> {
    pub(crate) fn init(service_call: &mut ServiceCall) -> Self {
        let _ = service_call.register_callback(
            SystemFunction::SystemFunctionDraw,
            draw_callback_mono as *mut _,
        );

        Self {
            _phantom: PhantomData,
        }
    }
    pub fn on_draw(
        &self,
        callback: impl FnMut(&mut FrameBuf<Gray8, ScreenBuffer<Gray8>>) + Send + 'static,
    ) {
        Self::callback().replace(Box::new(callback));
    }

    fn callback<'a>(
    ) -> MutexGuard<'a, Option<Box<dyn FnMut(&mut FrameBuf<Gray8, ScreenBuffer<Gray8>>) + Send>>>
    {
        static DRAW_CALLBACK: Mutex<
            Option<Box<dyn FnMut(&mut FrameBuf<Gray8, ScreenBuffer<Gray8>>) + Send>>,
        > = Mutex::new(None);

        DRAW_CALLBACK.lock()
    }
}

impl Screen<Rgb565> {
    pub(crate) fn init(service_call: &mut ServiceCall) -> Self {
        let _ = service_call.register_callback(
            SystemFunction::SystemFunctionDraw,
            draw_callback_color as *mut _,
        );

        Self {
            _phantom: PhantomData,
        }
    }

    pub fn on_draw(
        &self,
        callback: impl FnMut(&mut FrameBuf<Rgb565, ScreenBuffer<Rgb565>>) + Send + 'static,
    ) {
        Self::callback().replace(Box::new(callback));
    }

    fn callback<'a>(
    ) -> MutexGuard<'a, Option<Box<dyn FnMut(&mut FrameBuf<Rgb565, ScreenBuffer<Rgb565>>) + Send>>>
    {
        static DRAW_CALLBACK: Mutex<
            Option<Box<dyn FnMut(&mut FrameBuf<Rgb565, ScreenBuffer<Rgb565>>) + Send>>,
        > = Mutex::new(None);

        DRAW_CALLBACK.lock()
    }
}

pub struct ScreenBuffer<'a, C: PixelColor>(&'a mut [C]);

impl<'a, C: PixelColor> ScreenBuffer<'a, C> {
    pub fn new(pixels: *mut u8, width: u16, height: u16) -> Self {
        Self(unsafe {
            core::slice::from_raw_parts_mut(pixels as *mut C, (width * height) as usize)
        })
    }
}

impl<'a, C: PixelColor> FrameBufferBackend for ScreenBuffer<'a, C> {
    type Color = C;

    fn set(&mut self, index: usize, color: Self::Color) {
        self.0[index] = color;
    }

    fn get(&self, index: usize) -> Self::Color {
        self.0[index]
    }

    fn nr_elements(&self) -> usize {
        self.0.len()
    }
}
