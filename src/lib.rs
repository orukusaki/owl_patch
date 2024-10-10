#![cfg_attr(not(test), no_std)]
#![feature(array_chunks)]
#![feature(const_refs_to_static)]
#![feature(slice_from_ptr_range)]
#![doc = include_str!("../README.md")]

extern crate alloc;

mod ffi;
pub mod midi_message;

pub mod program_vector;
pub mod sample_buffer;
pub mod volts_per_octave;

pub use ffi::openware_midi_control::{
    OpenWareMidiControl, OpenWareMidiSysexCommand, PatchButtonId, PatchParameterId,
};
use ffi::program_vector::ProgramVector as FfiProgramVector;

use core::{
    ffi::{c_char, c_void, CStr},
    mem::MaybeUninit,
};

pub use owl_patch_macros::patch;

#[cfg(not(test))]
mod panic {
    use super::program_vector::error;
    use alloc::format;
    use core::panic::PanicInfo;
    #[panic_handler]
    unsafe fn panic_handler(info: &PanicInfo) -> ! {
        error(&format!("{}", info.message()))
    }
}

#[doc(hidden)]
#[repr(C)]
pub struct ProgramHeader<const N: usize> {
    magic_word: u32,
    start_prog: *const c_void,
    endprog: *const c_void,
    reset_handler: unsafe extern "C" fn(),
    stack: *const c_void,
    estack: *const c_void,
    programvector: *const MaybeUninit<FfiProgramVector>,
    patch_name: [u8; N],
}

unsafe impl<const N: usize> Sync for ProgramHeader<N> {}

impl<const N: usize> ProgramHeader<N> {
    const MAGIC_WORD: u32 = 0xdadac0de;

    pub const fn new(
        patch_name: &CStr,
        programvector: *const MaybeUninit<FfiProgramVector>,
    ) -> Self {
        extern "C" {
            static mut _startprog: c_void;
            static mut _endprog: c_void;
            static mut _stack: c_void;
            static mut _estack: c_void;
        }

        let mut name_bytes = [0u8; N];
        let p = patch_name.to_bytes_with_nul();

        let mut n = 0;
        while n < N {
            name_bytes[n] = p[n];
            n += 1;
        }

        ProgramHeader {
            magic_word: Self::MAGIC_WORD,
            start_prog: &raw const _startprog,
            endprog: &raw const _endprog,
            reset_handler,
            stack: &raw const _stack,
            estack: &raw const _estack,
            programvector,
            patch_name: name_bytes,
        }
    }

    pub fn patch_name(&self) -> *const c_char {
        self.patch_name.as_ptr() as *const c_char
    }
}

/// Startup function
unsafe extern "C" fn reset_handler() {
    // These values are provided by the linker script
    extern "C" {
        static mut _sidata: u32;
        static mut _sdata: u32;
        static mut _edata: u32;
        static mut _sbss: u32;
        static mut _ebss: u32;
    }

    // This function is created by the patch! macro.
    extern "Rust" {
        fn __main() -> !;
    }

    let data = core::slice::from_ptr_range(&raw mut _sdata..&raw mut _edata);
    let idata = core::slice::from_raw_parts_mut(&raw mut _sidata, data.len());

    idata.copy_from_slice(data);

    let bss = core::slice::from_mut_ptr_range(&raw mut _sbss..&raw mut _ebss);
    bss.fill(0);

    __main()
}
