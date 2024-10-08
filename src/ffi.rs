#![allow(dead_code)]
#![allow(non_camel_case_types)]
#![allow(non_upper_case_globals)]
#![allow(non_snake_case)]
#![allow(clippy::upper_case_acronyms)]
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
