#![no_std]
#![feature(exclusive_wrapper)]
#![feature(array_chunks)]
#![doc = include_str!("../README.md")]

mod ffi;
pub mod heap;
pub mod midi_message;
pub mod program_vector;
pub mod sample_buffer;

use ffi::program_vector::ProgramVectorAudioStatus;
use program_vector::{CONFIGURATION_ERROR_STATUS, PROGRAM_VECTOR};

use core::{
    ffi::CStr,
    panic::PanicInfo,
    sync::atomic::{compiler_fence, Ordering},
};
#[panic_handler]
unsafe fn panic_handler(info: &PanicInfo) -> ! {
    let pv = unsafe { PROGRAM_VECTOR.assume_init_mut() };

    let message = info.message().as_str().unwrap_unchecked();
    let mut buff = [0u8; 64];
    let len = message.len().min(64 - 1);
    buff[..len].copy_from_slice(&message.as_bytes()[..len]);

    pv.error = CONFIGURATION_ERROR_STATUS;
    pv.message = CStr::from_bytes_with_nul_unchecked(&buff).as_ptr() as *mut i8;

    if let Some(program_status) = pv.programStatus {
        // This function never returns
        unsafe {
            program_status(ProgramVectorAudioStatus::AUDIO_ERROR_STATUS);
        }
        unreachable!();
    }
    loop {
        compiler_fence(Ordering::SeqCst);
    }
}

#[no_mangle]
unsafe extern "C" fn __libc_init_array() {}
