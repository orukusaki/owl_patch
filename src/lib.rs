#![no_std]
#![feature(exclusive_wrapper)]
#![feature(array_chunks)]
#![doc = include_str!("../README.md")]

extern crate alloc;

mod ffi;
pub mod midi_message;
pub mod program_vector;
pub mod sample_buffer;

use alloc::format;
use program_vector::error;

use core::panic::PanicInfo;
#[panic_handler]
unsafe fn panic_handler(info: &PanicInfo) -> ! {
    error(&format!("{}", info.message()))
}

#[no_mangle]
unsafe extern "C" fn __libc_init_array() {}
