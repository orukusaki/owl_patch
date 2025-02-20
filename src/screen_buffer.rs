//! Screen Buffers for devices with displays
//!
//! See the [screen-test] example for usage
//!
//! [screen-test]: https://github.com/orukusaki/owl_patch/blob/main/examples/src/bin/screen-test.rs
use core::convert::Infallible;

use embedded_graphics_core::{
    pixelcolor::BinaryColor,
    prelude::{Dimensions, DrawTarget, OriginDimensions, Point, Size},
    Pixel,
};

/// Monochrome Screen Buffer
pub struct MonoScreenBuffer<'a> {
    pixels: &'a mut [u8],
    width: u16,
    height: u16,
}

impl<'a> MonoScreenBuffer<'a> {
    /// Constructor
    pub fn new(pixels: &'a mut [u8], width: u16, height: u16) -> Self {
        Self {
            pixels,
            width,
            height,
        }
    }

    /// Get pixel colour by coodinate (from top left)
    pub fn get(&self, x: u16, y: u16) -> BinaryColor {
        let (byte_index, offset) = self.index_offset(x, y);

        (((self.pixels[byte_index] >> offset) & 1) == 1).into()
    }

    /// Set pixel colour by coodinate (from top left)
    pub fn set(&mut self, x: u16, y: u16, colour: BinaryColor) {
        let (byte_index, offset) = self.index_offset(x, y);

        match colour {
            BinaryColor::Off => self.pixels[byte_index] &= !(1 << offset),
            BinaryColor::On => self.pixels[byte_index] |= 1 << offset,
        }
    }

    /// Set pixel colour by coodinate (from top left)
    pub fn get_pixel(&mut self, x: u16, y: u16) -> Pixel<BinaryColor> {
        Pixel(Point::new(x as i32, y as i32), self.get(x, y))
    }

    /// Set pixel colour by coodinate (from top left)
    pub fn set_pixel(&mut self, pixel: Pixel<BinaryColor>) {
        self.set(pixel.0.x as u16, pixel.0.y as u16, pixel.1);
    }

    fn index_offset(&self, x: u16, y: u16) -> (usize, u8) {
        // Pixels are arranged top->bottom, then left->right
        let bit_index = x * self.height + y;
        let byte_index = (bit_index / 8) as usize;
        let offset = (bit_index % 8) as u8;
        (byte_index, offset)
    }

    /// Screen height
    pub fn height(&self) -> u16 {
        self.height
    }

    /// Screen width
    pub fn width(&self) -> u16 {
        self.width
    }
}

impl DrawTarget for MonoScreenBuffer<'_> {
    type Color = BinaryColor;

    type Error = Infallible;

    fn draw_iter<I>(&mut self, pixels: I) -> Result<(), Self::Error>
    where
        I: IntoIterator<Item = Pixel<Self::Color>>,
    {
        let bounding_box = self.bounding_box();

        for p in pixels {
            if bounding_box.contains(p.0) {
                self.set_pixel(p);
            }
        }

        Ok(())
    }
}

impl OriginDimensions for MonoScreenBuffer<'_> {
    fn size(&self) -> Size {
        Size::new(self.width as u32, self.height as u32)
    }
}
