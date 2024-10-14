use crate::ffi::program_vector as ffi;
use crate::program_vector::ProgramVector;
use crate::program_vector::ProgramVectorChecksum;

static mut AUDIO_IN: [i32; 64] = [0; 64];
static mut AUDIO_OUT: [i32; 64] = [0; 64];

static mut PARAMETERS: [i16; 8] = [0; 8];

pub unsafe fn program_vector() -> ProgramVector {
    #[allow(static_mut_refs)]
    let pv = crate::program_vector::PROGRAM_VECTOR.assume_init_mut();

    pv.checksum = ProgramVectorChecksum::V13 as u8;
    pv.hardware_version = 0;
    pv.audio_input = core::ptr::addr_of!(AUDIO_IN) as *mut i32;
    pv.audio_output = core::ptr::addr_of!(AUDIO_OUT) as *mut i32;
    pv.audio_format = ffi::AUDIO_FORMAT_24B16 as u8;
    pv.audio_blocksize = 32;
    pv.audio_samplingrate = 44100;
    pv.parameters_size = 8;
    pv.parameters = core::ptr::addr_of!(PARAMETERS) as *mut i16;
    pv.buttons = 0;
    pv.error = 0;
    pv.registerPatch = None;
    pv.registerPatchParameter = None;
    pv.programReady = None;
    pv.programStatus = None;
    pv.serviceCall = None;
    pv.cycles_per_block = 0;
    pv.heap_bytes_used = 0;
    pv.message = core::ptr::null_mut();
    pv.setButton = None;
    pv.setPatchParameter = None;
    pv.buttonChangedCallback = None;
    pv.heapLocations = core::ptr::null_mut();

    ProgramVector::new(pv, c"test".as_ptr())
}
