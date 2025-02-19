extern crate alloc;

use alloc::boxed::Box;
use alloc::vec;
use core::ffi::CStr;

use super::service_call::ServiceCall;
use crate::resource::Resource;

/// Used to fetch resource files
///
/// /// Use [ProgramVector::resources()] to obtain this service.
///
/// [ProgramVector::resources()]: crate::program_vector::ProgramVector::resources
pub struct Resources<'a> {
    service_call: &'a ServiceCall,
}

impl<'a> Resources<'a> {
    /// Get a resource file by name
    pub fn get(&self, name: &CStr) -> Result<Resource, &str> {
        self.service_call
            .get_resource(name)
            .map(|(size, data)| Resource::new(name, size, data))
    }

    /// Load data from the resource into a destination slice.
    pub fn load(&self, resource: &Resource, offset: usize, dest: &mut [u8]) -> Result<(), &str> {
        self.service_call
            .load_resource(resource.name(), offset, dest)
    }

    /// Load all data from the resource into a new boxed slice (allocates)
    pub fn load_all(&self, resource: &Resource) -> Result<Box<[u8]>, &str> {
        let mut buffer = vec![0; resource.size()].into_boxed_slice();
        self.load(resource, 0, buffer.as_mut()).map(|_| buffer)
    }

    pub(crate) fn new(service_call: &'a ServiceCall) -> Self {
        Self { service_call }
    }
}
