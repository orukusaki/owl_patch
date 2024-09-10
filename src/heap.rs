use crate::ffi::heap::*;

use crate::ffi::program_vector::MemorySegment;
use crate::program_vector::{error, CHECKSUM_ERROR_STATUS};
use core::alloc::{GlobalAlloc, Layout};
use core::ffi::c_void;
use core::sync::atomic::{AtomicBool, Ordering};

#[no_mangle]
/// # Safety
///
/// This is a crash event
pub unsafe extern "C" fn vApplicationMallocFailedHook() {
    error(CHECKSUM_ERROR_STATUS, c"Memory overflow");
}

pub struct Heap {
    init: AtomicBool,
}

impl Default for Heap {
    fn default() -> Self {
        Self::new()
    }
}

impl Heap {
    pub const fn new() -> Self {
        Self {
            init: AtomicBool::new(false),
        }
    }

    // MUST be called before any allocations are attempted
    pub fn init(&self, segments: &[MemorySegment]) {
        let mut regions: [HeapRegion_t; 5] = Default::default();
        // regions must be null-terminated, so we must never write to the last entry
        let len = regions.len() - 1;
        for (r, s) in regions.iter_mut().take(len).zip(segments) {
            *r = s.into();
        }

        // Safety: the regions pointer needs to be valid for this call, but `regions`
        // can be safely dropped afterwards. vPortDefineHeapRegions does not modify the array
        unsafe { vPortDefineHeapRegions(regions.as_ptr()) };
        self.init.store(true, Ordering::Relaxed);
    }

    pub fn free_heap_size(&self) -> usize {
        assert!(self.init.load(Ordering::Relaxed));
        unsafe { xPortGetFreeHeapSize() }
    }
}

unsafe impl GlobalAlloc for Heap {
    unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
        assert!(self.init.load(Ordering::Relaxed));
        const BYTE_ALIGNMENT: usize = portBYTE_ALIGNMENT as usize;

        let mut size = layout.size();

        if layout.align() > BYTE_ALIGNMENT {
            size += layout.align() - BYTE_ALIGNMENT;
        }

        let ptr = pvPortMalloc(size) as *mut u8;
        ptr.byte_add(ptr.align_offset(layout.align()))
    }

    unsafe fn dealloc(&self, ptr: *mut u8, _layout: Layout) {
        assert!(self.init.load(Ordering::Relaxed));
        vPortFree(ptr as *mut c_void)
    }
}

impl Default for HeapRegion_t {
    fn default() -> Self {
        Self {
            pucStartAddress: core::ptr::null_mut(),
            xSizeInBytes: Default::default(),
        }
    }
}

impl From<&MemorySegment> for HeapRegion_t {
    fn from(segment: &MemorySegment) -> Self {
        Self {
            pucStartAddress: segment.location,
            xSizeInBytes: segment.size as usize,
        }
    }
}
