#![no_std]
#![feature(exclusive_wrapper)]
#![feature(array_chunks)]
#![doc = include_str!("../README.md")]

mod ffi;
pub mod heap;
pub mod midi_message;
pub mod program_vector;
pub mod sample_buffer;

use program_vector::error;

use core::{ffi::CStr, panic::PanicInfo};
#[panic_handler]
unsafe fn panic_handler(info: &PanicInfo) -> ! {
    let message = info.message().as_str().unwrap_unchecked();
    let mut buff = [0u8; 64];
    let len = message.len().min(64 - 1);
    buff[..len].copy_from_slice(&message.as_bytes()[..len]);

    error(0x01, CStr::from_bytes_with_nul_unchecked(&buff));
}

#[no_mangle]
unsafe extern "C" fn __libc_init_array() {}
