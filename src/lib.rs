#![cfg_attr(target_os = "none", no_std)]
#![feature(slice_from_ptr_range)]
#![warn(missing_docs)]
#![doc = include_str!("../README.md")]

extern crate alloc;

mod ffi;
pub mod midi_message;

#[cfg(feature = "fastmaths")]
pub mod fastmaths;
pub mod interpolation;
pub mod program_vector;
pub mod sample_buffer;
pub mod volts_per_octave;

pub use ffi::openware_midi_control::{
    OpenWareMidiControl, OpenWareMidiSysexCommand, PatchButtonId, PatchParameterId,
};

pub mod resource;

#[cfg(not(target_os = "none"))]
#[doc(hidden)]
pub mod test_harness;

use ffi::program_vector::ProgramVector as FfiProgramVector;

use core::{
    ffi::{c_char, c_void},
    mem::MaybeUninit,
};

/// # Patch entry-point
///
/// Use this macro to define the entry-point of your patch. Pass a string literal as your patch name.
/// The function can have any name, but should have the signature `fn(ProgramVector) -> !`. There should be
/// exactly one invocation per patch to ensure it builds correctly.
///
/// # example
/// ```
/// #![no_main]
/// #![no_std]
///
/// use owl_patch::patch;
/// use owl_patch::program_vector::ProgramVector;
///
/// #[patch("My Patch Name")]
/// fn run(mut pv: ProgramVector) -> ! {
/// // patch code
/// # pv.audio().run(|_, _| {});
/// }
/// ```
///
/// The [ProgramVector] argument contains everything you need to interact with the hardware / os
///
/// [ProgramVector]: crate::program_vector::ProgramVector
pub use owl_patch_macros::patch;

#[cfg(target_os = "none")]
#[panic_handler]
unsafe fn panic_handler(info: &core::panic::PanicInfo) -> ! {
    match info.message().as_str() {
        Some(m) => program_vector::error(&m),
        None => program_vector::error(&alloc::format!("{}", info.message())),
    }
}

#[doc(hidden)]
#[repr(C)]
pub struct ProgramHeader {
    magic_word: u32,
    start_prog: *const c_void,
    endprog: *const c_void,
    reset_handler: unsafe extern "C" fn(),
    stack: *const c_void,
    estack: *const c_void,
    programvector: *const MaybeUninit<FfiProgramVector>,
    patch_name: [u8; 24],
}

unsafe impl Sync for ProgramHeader {}

impl ProgramHeader {
    const MAGIC_WORD: u32 = 0xdadac0de;

    pub const fn new(
        patch_name: &str,
        programvector: *const MaybeUninit<FfiProgramVector>,
    ) -> Self {
        extern "C" {
            static mut _startprog: c_void;
            static mut _endprog: c_void;
            static mut _stack: c_void;
            static mut _estack: c_void;
        }

        let mut name_bytes = [0u8; 24];
        let p = patch_name.as_bytes();
        let len = if p.len() < name_bytes.len() {
            p.len()
        } else {
            name_bytes.len()
        };
        let mut n = 0;
        while n < len {
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
#[cfg(target_os = "none")]
#[link_section = ".text.Reset_Handler"]
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

    // core::arch::asm!("ldr   sp, = _estack      /* set stack pointer */");
    // core::arch::asm!("ldr   sp, = 0xD0800000      /* set stack pointer */");

    // Copy initialised static data to RAM
    if &raw mut _sdata < &raw mut _edata {
        let data = core::slice::from_ptr_range(&raw mut _sdata..&raw mut _edata);
        let idata = core::slice::from_raw_parts_mut(&raw mut _sidata, data.len());
        idata.copy_from_slice(data);
    }

    // Zero-fill uninialised static data
    if &raw mut _sbss < &raw mut _ebss {
        let bss = core::slice::from_mut_ptr_range(&raw mut _sbss..&raw mut _ebss);
        bss.fill(0);
    }

    #[cfg(feature = "fastmaths")]
    crate::ffi::fastmaths::set_default_tables();
    // Start the program
    __main()
}

#[cfg(not(target_os = "none"))]
unsafe extern "C" fn reset_handler() {}
