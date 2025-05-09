//! Screen test patch.  Displays a square in the centre of the screen, which grows/shrinks with
//! the volume of audio on input 0
#![no_main]
#![no_std]
extern crate alloc;

use core::{
    ops::Div,
    sync::atomic::{AtomicI32, Ordering},
};

use alloc::sync::Arc;
use embedded_graphics::{
    mono_font::{ascii::FONT_6X10, MonoTextStyle},
    pixelcolor::BinaryColor,
    prelude::*,
    primitives::{PrimitiveStyleBuilder, Rectangle},
    text::{Alignment, Text, TextStyleBuilder},
};
use owl_patch::{
    patch,
    program_vector::{heap_bytes_used, ProgramVector},
    sample_buffer::{BufferByChannel, ConvertFrom, ConvertTo},
};

use num_traits::Float;

#[patch("Screen test")]
fn run(mut pv: ProgramVector) -> ! {
    let audio_settings = pv.audio().settings;
    let mut buffer = BufferByChannel::<f32>::new(audio_settings.channels, audio_settings.blocksize);

    pv.meta().set_heap_bytes_used(heap_bytes_used());

    let volume = Arc::new(AtomicI32::new(0));

    {
        let style = PrimitiveStyleBuilder::new()
            .stroke_color(BinaryColor::On)
            .stroke_width(3)
            .fill_color(BinaryColor::Off)
            .build();
        let character_style = MonoTextStyle::new(&FONT_6X10, BinaryColor::On);
        let text_style = TextStyleBuilder::new().alignment(Alignment::Center).build();

        let volume = volume.clone();
        pv.screen().on_draw(move |screen| {
            let vol = volume.load(Ordering::Relaxed);

            let screen_centre = Point::new(0, 0) + (screen.size() / 2);
            let top_corner = screen_centre - Point::new(vol, vol);
            let size = Size::new(vol as u32 * 2, vol as u32 * 2);

            let _ = screen.clear(BinaryColor::Off);

            let _ = Text::with_text_style(
                "Top",
                screen_centre + Point::new(0, -20),
                character_style,
                text_style,
            )
            .draw(screen);
            let _ = Text::with_text_style(
                "Bottom",
                screen_centre + Point::new(0, 20),
                character_style,
                text_style,
            )
            .draw(screen);
            let _ = Text::with_text_style(
                "Left",
                screen_centre + Point::new(-50, 0),
                character_style,
                text_style,
            )
            .draw(screen);
            let _ = Text::with_text_style(
                "Right",
                screen_centre + Point::new(50, 0),
                character_style,
                text_style,
            )
            .draw(screen);

            let _ = Rectangle::new(top_corner, size)
                .into_styled(style)
                .draw(screen);
        });
    }

    let mut env = AREnv::default();

    // Main audio loop
    pv.audio().run(|input, output| {
        buffer.convert_from(input);

        let rms = buffer
            .left()
            .unwrap()
            .samples()
            .map(|s| s * s)
            .sum::<f32>()
            .div(audio_settings.blocksize as f32)
            .sqrt();

        let filtered = env.process(rms, 0.1, 0.95);

        volume.store((filtered * 32.0) as i32, Ordering::Relaxed);

        buffer.convert_to(output);
    });
}

#[derive(Clone, Copy, Default)]
struct AREnv {
    yn1: f32,
}

impl AREnv {
    pub fn process(&mut self, x: f32, attack: f32, release: f32) -> f32 {
        if x > self.yn1 {
            self.yn1 = x - attack * (x - self.yn1);
        } else {
            self.yn1 = x - release * (x - self.yn1);
        }
        self.yn1
    }
}
