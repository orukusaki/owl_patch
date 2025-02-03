extern crate alloc;

use core::option::Option;

use alloc::boxed::Box;
use spin::Mutex;

static DRAW_CALLBACK: Mutex<Option<Box<dyn FnMut(&mut Screen) + Send>>> = Mutex::new(None);

pub extern "C" fn draw_callback(pixels: *mut u8, width: u16, height: u16) {
    if let Some(callback) = DRAW_CALLBACK.lock().as_mut() {
        callback(&mut Screen::new(pixels, width, height));
    }
}

pub struct Screen<'a> {
    pixels: &'a mut [u8],
    width: usize,
    height: usize,
}

impl<'a> Screen<'a> {
    pub fn new(pixels: *mut u8, width: u16, height: u16) -> Self {
        // TODO: How can we possibly know whether it's a monocrome or colour screen?
        // It'd be nice to know = the slice would be double sized on a colour screen (RGB565)
        // Does it need to be generic? Seems like the patch would have to know - at least in the C API a patch is going to be either
        // a MonochromeScreenPatch or ColourScreenPatch.
        // Maybe we can go one better and provide a generic API - but that will probably involve compromises.
        // It'd be nice to actually know...
        let pixels = unsafe { core::slice::from_raw_parts_mut(pixels, (width * height) as usize) };

        Self {
            pixels,
            width: width as usize,
            height: height as usize,
        }
    }

    pub fn pixels(&mut self) -> &mut [u8] {
        self.pixels
    }

    pub fn get_pixel(&self, x: usize, y: usize) -> u8 {
        let index = x.min(self.width) * y.min(self.height);
        self.pixels[index]
    }

    pub fn set_pixel(&mut self, x: usize, y: usize, value: u8) {
        let index = x.min(self.width) * y.min(self.height);
        self.pixels[index] = value;
    }
}
