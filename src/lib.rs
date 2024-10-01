#![no_std]
#![feature(array_chunks)]
#![feature(const_refs_to_static)]
#![feature(slice_from_ptr_range)]
#![doc = include_str!("../README.md")]

extern crate alloc;

mod ffi;
pub mod midi_message;
pub mod program_vector;
pub mod sample_buffer;

use alloc::format;
use ffi::program_vector::ProgramVector as FfiProgramVector;
use program_vector::error;

use core::{
    ffi::{c_char, c_void},
    mem::MaybeUninit,
    panic::PanicInfo,
};
#[panic_handler]
unsafe fn panic_handler(info: &PanicInfo) -> ! {
    error(&format!("{}", info.message()))
}

#[macro_export]
/// Register the patch, providing its name, and the name of your "main" function.
/// ```
/// patch!("My New Patch", run);
/// fn run(mut pv: ProgramVector) -> ! {}
/// ```
/// Must be called exactly once for your patch to build properly
macro_rules! patch {
    ($patch_name:literal, $main_func:ident) => {
        mod __header {

            #[link_section = ".program_header"]
            static HEADER: owl_patch::ProgramHeader<{ $patch_name.len() + 1 }> =
                owl_patch::ProgramHeader::new(const_str::to_byte_array!(concat!(
                    $patch_name,
                    "\0"
                )));

            #[no_mangle]
            extern "Rust" fn __patch_name() -> *const core::ffi::c_char {
                HEADER.patch_name()
            }

            #[no_mangle]
            extern "Rust" fn __main() -> ! {
                super::$main_func(owl_patch::program_vector::ProgramVector::take());
            }
        }
    };
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

    pub const fn new(patch_name: [u8; N]) -> Self {
        extern "C" {
            static mut _startprog: c_void;
            static mut _endprog: c_void;
            static mut _stack: c_void;
            static mut _estack: c_void;
        }

        ProgramHeader {
            magic_word: Self::MAGIC_WORD,
            start_prog: &raw const _startprog,
            endprog: &raw const _endprog,
            reset_handler,
            stack: &raw const _stack,
            estack: &raw const _estack,
            programvector: &raw const program_vector::PROGRAM_VECTOR,
            patch_name,
        }
    }

    pub fn patch_name(&self) -> *const c_char {
        self.patch_name.as_ptr() as *const c_char
    }
}

/// Startup function
unsafe extern "C" fn reset_handler() {
    extern "C" {
        static mut _sidata: u32;
        static mut _sdata: u32;
        static mut _edata: u32;
        static mut _sbss: u32;
        static mut _ebss: u32;
    }

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
