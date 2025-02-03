//! Resource files

extern crate alloc;
use alloc::ffi::CString;
use core::{ffi::CStr, ptr::NonNull};

/// Resource
pub struct Resource {
    name: CString,
    size: usize,
    data: Option<NonNull<u8>>,
}

impl Resource {
    #[cfg(not(target_arch = "arm"))]
    #[doc(hidden)]
    pub fn new_for_test(name: impl Into<CString>, size: usize, data: Option<NonNull<u8>>) -> Self {
        Self {
            name: name.into(),
            size,
            data,
        }
    }

    pub(crate) fn new(name: impl Into<CString>, size: usize, data: Option<NonNull<u8>>) -> Self {
        Self {
            name: name.into(),
            size,
            data,
        }
    }

    /// Is this resource memory-mapped?
    ///
    /// Memory mapped resources have their contents available directly at a memory address,
    /// other resources need to be loaded from flash
    pub fn is_memory_mapped(&self) -> bool {
        self.data.is_some()
    }

    /// Get data as a slice
    ///
    /// For memory mapped resources (is_memory_mapped() == true), a slice will be returned containing the full resource data.
    /// For non-memory mapped resources, you'll need to use [Resources::load] instead
    ///
    /// ```
    /// # use owl_patch::resource::*;
    /// # use core::ptr::NonNull;
    /// # let mut mm_data = [1u8,2,3];
    /// # let res = Resource::new_for_test(c"test", 100, Some(NonNull::new(mm_data.as_mut_ptr()).unwrap()));
    /// // let res = resources.get(c"test").unwrap();
    /// if (res.is_memory_mapped()) {
    ///     let data: &[u8] = res.data().unwrap();
    ///     assert_eq!(data.len(), res.size());
    /// };
    /// ```
    /// [Resources::load]: crate::program_vector::Resources::load
    pub fn data(&self) -> Option<&[u8]> {
        self.data
            .map(|data| unsafe { core::slice::from_raw_parts(data.as_ptr(), self.size) })
    }

    /// Resource name
    ///
    /// ```
    /// # use owl_patch::resource::*;
    /// # let res = Resource::new_for_test(c"test", 100, None);
    /// // let res = resources.get(c"test").unwrap();
    /// assert_eq!(c"test", res.name());
    /// ```
    pub fn name(&self) -> &CStr {
        self.name.as_c_str()
    }

    /// Size in bytes of the resource
    ///
    /// ```
    /// # use owl_patch::resource::*;
    /// # let res = Resource::new_for_test(c"test", 100, None);
    /// // let res = resources.get(c"test").unwrap();
    /// assert_eq!(100, res.size());
    /// ```
    pub fn size(&self) -> usize {
        self.size
    }
}
