use core::slice;

use crate::ffi::program_vector::MemorySegment;

pub struct Meta {
    cycles_per_block: &'static u32,
    heap_bytes_used: &'static mut u32,
    checksum: &'static u8,
    hardware_version: &'static u8,
    heap_locations: &'static *mut MemorySegment,
}

impl Meta {
    pub(crate) fn new(
        cycles_per_block: &'static u32,
        heap_bytes_used: &'static mut u32,
        checksum: &'static u8,
        hardware_version: &'static u8,
        heap_locations: &'static *mut MemorySegment,
    ) -> Self {
        Self {
            cycles_per_block,
            heap_bytes_used,
            checksum,
            hardware_version,
            heap_locations,
        }
    }

    pub fn set_heap_bytes_used(&mut self, value: usize) {
        *self.heap_bytes_used = value as u32;
    }

    pub fn cycles_per_block(&self) -> u32 {
        *self.cycles_per_block
    }

    pub fn heap_bytes_used(&self) -> u32 {
        *self.heap_bytes_used
    }

    pub fn checksum(&self) -> u8 {
        *self.checksum
    }

    pub fn hardware_version(&self) -> u8 {
        *self.hardware_version
    }

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
        unsafe { slice::from_raw_parts(*self.heap_locations, count + 1) }
    }
}
