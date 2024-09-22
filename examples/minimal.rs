#![no_main]
#![no_std]
extern crate alloc;

use owl_patch::{
    program_vector::{heap_bytes_used, AudioFormat, AudioSettings, ProgramVector},
    sample_buffer::{Buffer, Channels, ConvertFrom, ConvertTo, Sample, Samplei32, Samplew16},
};

#[no_mangle]
pub extern "C" fn main() -> ! {
    // The ProgramVector lets us talk to the OS
    let pv = ProgramVector::instance();

    let audio_settings = pv.audio_settings();
    match audio_settings.format {
        AudioFormat::Format24B16 => run::<Samplew16>(pv, audio_settings),
        AudioFormat::Format24B32 => run::<Samplei32>(pv, audio_settings),
    }
}

fn run<F>(pv: ProgramVector<'static>, audio_settings: AudioSettings) -> !
where
    F: Sample<BaseType = i32> + From<f32>,
    f32: From<F>,
{
    // allocate a working buffer (uses vec intenally)
    let mut buffer: Buffer<f32, Channels> =
        Buffer::new(audio_settings.channels, audio_settings.blocksize);

    // Split up the PV into separate resources - saves us from needing to hold multiple references to it.
    // pv is consumed here, so all setup stuff must be done first
    let (mut audio, _, _, mut meta) = pv.split();

    // For correct reporting, this should be called after all heap allocations are done with.
    meta.set_heap_bytes_used(heap_bytes_used());

    // Main audio loop
    audio.run(|input, mut output| {
        buffer.convert_from(&input);
        buffer.convert_to(&mut output);
    });
}
