use ::core::{
    ffi::{c_int, c_void},
    option::Option,
};
use core::{ptr::NonNull, slice};

use crate::ffi::service_call::{
    OWL_SERVICE_GET_ARRAY, OWL_SERVICE_OK, OWL_SERVICE_REGISTER_CALLBACK,
    OWL_SERVICE_REQUEST_CALLBACK, SYSTEM_FUNCTION_DRAW,
};

pub struct ServiceCall {
    service_call:
        Option<unsafe extern "C" fn(service: c_int, params: *mut *mut c_void, len: c_int) -> c_int>,
}

impl ServiceCall {
    pub fn new(
        service_call: Option<
            unsafe extern "C" fn(service: c_int, params: *mut *mut c_void, len: c_int) -> c_int,
        >,
    ) -> Self {
        Self { service_call }
    }

    pub fn register_callback(
        &mut self,
        code: &[u8; 4usize],
        callback: *mut c_void,
    ) -> Result<(), &str> {
        let service_call = self.service_call.ok_or("service call not available")?;

        let mut args = [code.as_ptr() as *mut _, callback];

        let ret = unsafe {
            service_call(
                OWL_SERVICE_REGISTER_CALLBACK as i32,
                args.as_mut_ptr(),
                args.len() as i32,
            )
        };
        (ret == OWL_SERVICE_OK as i32)
            .then_some(())
            .ok_or("service call returned error")
    }

    pub fn request_callback(&mut self, code: &[u8; 4usize]) -> Result<NonNull<()>, &str> {
        let service_call = self.service_call.ok_or("service call not available")?;

        let mut callback: *mut c_void = core::ptr::null_mut();
        let mut args = [
            code.as_ptr() as *mut _,
            // Pass a pointer to the callback pointer, allowing the OS to write to it
            &mut callback as *mut *mut c_void as *mut c_void,
        ];
        let ret = unsafe {
            service_call(
                OWL_SERVICE_REQUEST_CALLBACK as i32,
                args.as_mut_ptr(),
                args.len() as i32,
            )
        };

        if ret == OWL_SERVICE_OK as i32 {
            NonNull::new(callback as *mut ()).ok_or("bad callback")
        } else {
            Err("service call returned error")
        }
    }

    //TODO: return Result
    pub fn get_array<T>(&mut self, code: &[u8; 4usize]) -> Option<&[T]> {
        self.service_call.and_then(|service_call| {
            let mut size: usize = 0;
            let mut ptr: *mut T = core::ptr::null_mut();
            let mut args = [
                code.as_ptr() as *mut _,
                &mut ptr as *mut *mut T as *mut _,
                &mut size as *mut usize as *mut _,
            ];

            let ret = unsafe {
                service_call(
                    OWL_SERVICE_GET_ARRAY as i32,
                    args.as_mut_ptr(),
                    args.len() as i32,
                )
            };

            (ret == OWL_SERVICE_OK as i32 && !ptr.is_null())
                .then(|| unsafe { slice::from_raw_parts(ptr as *const T, size) })
        })
    }

    pub fn register_draw_callback(
        &mut self,
        callback: fn(pixels: *mut u8, width: u16, height: u16),
    ) -> Result<(), &str> {
        self.register_callback(SYSTEM_FUNCTION_DRAW, callback as *mut _)
    }
}
