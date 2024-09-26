use crate::ffi::service_call as ffi;
use ::core::{
    ffi::{c_int, c_void},
    option::Option,
};
use core::{ptr::NonNull, slice};

const OWL_SERVICE_OK: i32 = ffi::OWL_SERVICE_OK as i32;

#[allow(dead_code)]
#[repr(i32)]
pub enum ServiceCallType {
    OwlServiceArmRfftFastInitF32 = ffi::OWL_SERVICE_ARM_RFFT_FAST_INIT_F32 as i32,
    OwlServiceArmCfftInitF32 = ffi::OWL_SERVICE_ARM_CFFT_INIT_F32 as i32,
    OwlServiceGetParameters = ffi::OWL_SERVICE_GET_PARAMETERS as i32,
    OwlServiceLoadResource = ffi::OWL_SERVICE_LOAD_RESOURCE as i32,
    OwlServiceGetArray = ffi::OWL_SERVICE_GET_ARRAY as i32,
    OwlServiceRegisterCallback = ffi::OWL_SERVICE_REGISTER_CALLBACK as i32,
    OwlServiceRequestCallback = ffi::OWL_SERVICE_REQUEST_CALLBACK as i32,
}

pub enum SystemTable {
    SystemTableLog,
    SystemTablePow,
}

impl SystemTable {
    fn code(self) -> &'static [u8; 4] {
        match self {
            SystemTable::SystemTableLog => ffi::SYSTEM_TABLE_LOG,
            SystemTable::SystemTablePow => ffi::SYSTEM_TABLE_POW,
        }
    }
}

pub enum SystemFunction {
    SystemFunctionDraw,
    SystemFunctionMidi,
}

impl SystemFunction {
    fn code(self) -> &'static [u8; 4] {
        match self {
            SystemFunction::SystemFunctionDraw => ffi::SYSTEM_FUNCTION_DRAW,
            SystemFunction::SystemFunctionMidi => ffi::SYSTEM_FUNCTION_MIDI,
        }
    }
}

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
        function: SystemFunction,
        callback: *mut c_void,
    ) -> Result<(), &str> {
        let mut args = [function.code().as_ptr() as *mut _, callback];
        self.service_call(ServiceCallType::OwlServiceRegisterCallback, &mut args)
    }

    pub fn request_callback(&mut self, function: SystemFunction) -> Result<NonNull<()>, &str> {
        let mut callback: *mut () = core::ptr::null_mut();
        let mut args = [
            function.code().as_ptr() as *mut _,
            // Pass a pointer to the callback pointer, allowing the OS to write to it
            &mut callback as *mut *mut () as *mut c_void,
        ];

        self.service_call(ServiceCallType::OwlServiceRequestCallback, &mut args)
            .and_then(|_| NonNull::new(callback).ok_or("bad callback"))
    }

    pub fn get_array<T>(&mut self, table: SystemTable) -> Result<&'static [T], &str> {
        let mut size: usize = 0;
        let mut ptr: *mut T = core::ptr::null_mut();
        let mut args = [
            table.code().as_ptr() as *mut _,
            &mut ptr as *mut *mut T as *mut _,
            &mut size as *mut usize as *mut _,
        ];

        self.service_call(ServiceCallType::OwlServiceGetArray, &mut args)
            .and_then(|_| NonNull::new(ptr).ok_or("array not found"))
            .map(|ptr| unsafe { slice::from_raw_parts(ptr.as_ptr(), size) })
    }

    fn service_call(
        &mut self,
        call_type: ServiceCallType,
        args: &mut [*mut c_void],
    ) -> Result<(), &str> {
        let service_call = self.service_call.ok_or("service call not available")?;

        let ret = unsafe { service_call(call_type as i32, args.as_mut_ptr(), args.len() as i32) };

        match ret {
            OWL_SERVICE_OK => Ok(()),
            _ => Err("service call returned error"),
        }
    }
}