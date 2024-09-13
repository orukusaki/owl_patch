use alloc::format;

use crate::ffi::heap::*;

extern crate alloc;

use crate::ffi::program_vector::MemorySegment;
use crate::program_vector::debug_message;
use core::alloc::{GlobalAlloc, Layout};
use core::ffi::c_void;
use core::sync::atomic::{AtomicBool, Ordering};

/// Heap memory allocator - deferring to The FreeRTOS allocator in heap_5.c
///
/// # Example
/// ```
/// #![no_main]
/// #![no_std]
/// extern crate alloc;
///
/// use owl_patch::heap::Heap;
/// use owl_patch::program_vector::ProgramVector;    
///
/// #[global_allocator]
/// pub static HEAP: Heap = Heap::new();
///
/// #[no_mangle]
/// pub extern "C" fn main() -> ! {
///   let pv = ProgramVector::instance();
///   // Heap must be initialised before any heap allocations are attempted
///   HEAP.init(pv.memory_segments());
///   // The heap is now initialised, and we can use heap allocated types like Box, Vec etc
/// }
/// ```
pub struct Heap {
    init: AtomicBool,
}

impl Default for Heap {
    fn default() -> Self {
        Self::new()
    }
}

impl Heap {
    const BYTE_ALIGNMENT: usize = portBYTE_ALIGNMENT as usize;

    /// Create a new, unitialised Heap.
    pub const fn new() -> Self {
        Self {
            init: AtomicBool::new(false),
        }
    }

    /// Initialise the Heap, providing memory segments to use
    ///
    /// MUST be called before any allocations are attempted
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

    /// Get free heap memory in bytes
    pub fn free_heap_size(&self) -> usize {
        assert!(self.init.load(Ordering::Relaxed));
        unsafe { xPortGetFreeHeapSize() }
    }
}

unsafe impl GlobalAlloc for Heap {
    unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
        assert!(self.init.load(Ordering::Relaxed));

        let mut size = layout.size();

        if layout.align() > Self::BYTE_ALIGNMENT {
            debug_message(&format!("allocating big layout {:?}", layout));
            size += layout.align() - Self::BYTE_ALIGNMENT;
        }

        let ptr = pvPortMalloc(size) as *mut u8;
        ptr.byte_add(ptr.align_offset(layout.align()))
    }

    unsafe fn dealloc(&self, ptr: *mut u8, layout: Layout) {
        if layout.align() > Self::BYTE_ALIGNMENT {
            // There's no way we can recover the original pointer address if we messed with it to get
            // the correct alignment when we allocated it.
            // so just.. don't deallocate it??
            // afterall, in this context, objects are not expected to be deallocated very often, so leaking memory
            // shouldn't really cause any problems
            return;
        }

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

#[no_mangle]
extern "C" fn vApplicationMallocFailedHook() {
    panic!("Memory overflow");
}
