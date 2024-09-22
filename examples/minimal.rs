#![no_main]
#![no_std]
extern crate alloc;

use owl_patch::{
    program_vector::{AudioFormat, AudioSettings, ProgramVector},
    sample_buffer::{Buffer, Channels, ConvertFrom, ConvertTo, Sample, Samplei32, Samplew16},
};
use talc::*;

#[global_allocator]
static ALLOCATOR: Talck<spin::Mutex<()>, ErrOnOom> = Talc::new(ErrOnOom).lock();

#[no_mangle]
pub extern "C" fn main() -> ! {
    // The ProgramVector lets us talk to the OS
    let pv = ProgramVector::instance();
    // Heap must be initialised before any heap allocations are attempted
    {
        let mut talc = ALLOCATOR.lock();
        pv.memory_segments().iter().for_each(|seg| unsafe {
            let _ = talc.claim(seg.into());
        });
    }

    let audio_settings = pv.audio_settings();
    match audio_settings.format {
        AudioFormat::Format24B16 => run::<Samplew16>(pv, audio_settings),
        AudioFormat::Format24B32 => run::<Samplei32>(pv, audio_settings),
    }
}

fn run<F>(mut pv: ProgramVector<'static>, audio_settings: AudioSettings) -> !
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

    meta.set_heap_bytes_used(ALLOCATOR.lock().get_counters().total_allocated_bytes as usize);

    // Main audio loop
    audio.run(|input, mut output| {
        buffer.convert_from(&input);
        buffer.convert_to(&mut output);
    });
}
