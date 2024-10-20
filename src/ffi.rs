#![allow(dead_code)]
#![allow(non_camel_case_types)]
#![allow(non_upper_case_globals)]
#![allow(non_snake_case)]
#![allow(clippy::upper_case_acronyms)]
#![allow(clippy::manual_c_str_literals)]
#![allow(missing_docs)]

pub mod midi_message {
    include!(concat!(env!("OUT_DIR"), "/midi_message.rs"));
}
pub mod openware_midi_control {
    include!(concat!(env!("OUT_DIR"), "/openware_midi_control.rs"));
}
pub mod program_vector {
    include!(concat!(env!("OUT_DIR"), "/program_vector.rs"));
}
pub mod service_call {
    include!(concat!(env!("OUT_DIR"), "/service_call.rs"));
}

pub mod fastmaths {

    // included manually becuase I couldn't get clang to work with the target set to thumbv7em-none-eabihf
    // It can't find stdlib, probably need to install something else

    /* automatically generated by rust-bindgen 0.70.1 */

    extern "C" {
        pub fn fast_powf(x: f32, y: f32) -> f32;
    }
    extern "C" {
        pub fn fast_expf(x: f32) -> f32;
    }
    extern "C" {
        pub fn fast_exp2f(x: f32) -> f32;
    }
    extern "C" {
        pub fn fast_exp10f(x: f32) -> f32;
    }
    extern "C" {
        pub fn fast_pow_set_table(table: *const u32, size: ::core::ffi::c_int);
    }
    extern "C" {
        pub fn fast_logf(x: f32) -> f32;
    }
    extern "C" {
        pub fn fast_log2f(x: f32) -> f32;
    }
    extern "C" {
        pub fn fast_log10f(x: f32) -> f32;
    }
    extern "C" {
        pub fn fast_log2i(x: u32) -> u32;
    }
    extern "C" {
        pub fn fast_log_set_table(table: *const f32, size: ::core::ffi::c_int);
    }
    extern "C" {
        pub fn fast_atan2f(a: f32, b: f32) -> f32;
    }
    extern "C" {
        pub fn fast_fmodf(x: f32, y: f32) -> f32;
    }
    extern "C" {
        pub fn set_default_tables();
    }
}
