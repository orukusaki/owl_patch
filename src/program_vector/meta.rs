use core::{ffi::CStr, slice};

use crate::ffi::program_vector as ffi;
pub use ffi::MemorySegment;

/// Checksum value used to verify that the program vector was initialised, as well as indicating
/// features available in the host OS
#[repr(u8)]
#[derive(Debug, Copy, Clone, Hash, PartialEq, Eq, num_derive :: FromPrimitive)]
pub enum ProgramVectorChecksum {
    /// Version 11
    V11 = ffi::PROGRAM_VECTOR_CHECKSUM_V11 as u8,
    /// Version 12
    V12 = ffi::PROGRAM_VECTOR_CHECKSUM_V12 as u8,
    /// Version 13
    V13 = ffi::PROGRAM_VECTOR_CHECKSUM_V13 as u8,
}

/// Owl Pedal hardware identifier
pub const OWL_PEDAL_HARDWARE: u8 = ffi::OWL_PEDAL_HARDWARE as u8;

/// Owl Modular hardware identifier
pub const OWL_MODULAR_HARDWARE: u8 = ffi::OWL_MODULAR_HARDWARE as u8;

/// Owl Rack hardware identifier
pub const OWL_RACK_HARDWARE: u8 = ffi::OWL_RACK_HARDWARE as u8;

/// Prism hardware identifier
pub const PRISM_HARDWARE: u8 = ffi::PRISM_HARDWARE as u8;

/// Player hardware identifier
pub const PLAYER_HARDWARE: u8 = ffi::PLAYER_HARDWARE as u8;

/// Program Metadata
///
/// Use [ProgramVector::meta] to obtain this service.
///
/// [ProgramVector::meta]: crate::program_vector::ProgramVector::meta
pub struct Meta {
    cycles_per_block: &'static u32,
    heap_bytes_used: &'static mut u32,
    checksum: ProgramVectorChecksum,
    hardware_version: u8,
    heap_locations: *mut MemorySegment,
    register_patch: Option<
        unsafe extern "C" fn(
            name: *const ::core::ffi::c_char,
            inputChannels: u8,
            outputChannels: u8,
        ),
    >,
}

unsafe impl Send for Meta {}

impl Meta {
    pub(crate) fn new(
        cycles_per_block: &'static u32,
        heap_bytes_used: &'static mut u32,
        checksum: ProgramVectorChecksum,
        hardware_version: u8,
        heap_locations: *mut MemorySegment,
        register_patch: Option<
            unsafe extern "C" fn(
                name: *const ::core::ffi::c_char,
                inputChannels: u8,
                outputChannels: u8,
            ),
        >,
    ) -> Self {
        Self {
            cycles_per_block,
            heap_bytes_used,
            checksum,
            hardware_version,
            heap_locations,
            register_patch,
        }
    }

    /// Register the patch, setting its name on display devices.
    pub fn register_patch(&self, patch_name: &CStr) {
        if let Some(register_patch) = self.register_patch {
            unsafe { register_patch(patch_name.as_ptr(), 2, 2) };
        }
    }

    /// Report to the OS how much heap memory this patch is using
    pub fn set_heap_bytes_used(&mut self, value: usize) {
        *self.heap_bytes_used = value as u32;
    }

    /// How many cycles we are taking to process each block of samples
    pub fn cycles_per_block(&self) -> u32 {
        *self.cycles_per_block
    }

    /// The checksum set by the OS before program start
    pub fn checksum(&self) -> ProgramVectorChecksum {
        self.checksum
    }

    /// Get Hardware version. *might* match one of the *_HARDWARE constants.
    pub fn hardware_version(&self) -> u8 {
        self.hardware_version
    }

    /// Get a slice of memory segments available for use in heap allocations
    pub fn memory_segments(&self) -> &[MemorySegment] {
        const MAX: usize = 5;

        let count = (0..MAX)
            .take_while(|i| {
                // Safety: heapLocations should be provided by the OS, we're checking for null pointers
                // and null values, that's probably the best we can do
                if let Some(segment) = unsafe { self.heap_locations.add(*i).as_ref() } {
                    !segment.location.is_null()
                } else {
                    false
                }
            })
            .last()
            .unwrap_or_else(|| {
                panic!("pv.heapLocations.is_null");
            });

        // Safety: We've checked and the data at least seems to be valid. It is not expected to change
        // during the program's runtime, so effectively the lifetime is 'static
        unsafe { slice::from_raw_parts(self.heap_locations, count + 1) }
    }
}
