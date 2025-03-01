#![allow(dead_code)]

use crate::ffi::service_call as ffi;
use ::core::{
    ffi::{c_int, c_void},
    option::Option,
};
use core::{ffi::CStr, ptr::NonNull, slice};

use super::OWL_MODULAR_HARDWARE;

const OWL_SERVICE_OK: i32 = ffi::OWL_SERVICE_OK as i32;

use cmsis_dsp_sys_pregenerated::{arm_cfft_instance_f32, arm_rfft_fast_instance_f32};

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
    fn code(self) -> &'static CStr {
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
    fn code(self) -> &'static CStr {
        match self {
            SystemFunction::SystemFunctionDraw => ffi::SYSTEM_FUNCTION_DRAW,
            SystemFunction::SystemFunctionMidi => ffi::SYSTEM_FUNCTION_MIDI,
        }
    }
}

#[derive(Clone, Copy, Debug)]
pub(crate) struct DeviceParameters {
    pub input_offset: f32,
    pub input_scalar: f32,
    pub output_offset: f32,
    pub output_scalar: f32,
}

impl DeviceParameters {
    fn default() -> Self {
        Self {
            input_scalar: 2.0,
            input_offset: 0.0,
            output_scalar: 2.0,
            output_offset: 0.0,
        }
    }

    fn default_owl_modular() -> Self {
        Self {
            input_scalar: -4.29,
            input_offset: -0.06382,
            output_scalar: -4.642,
            output_offset: 0.1208,
        }
    }
}

pub struct ServiceCall {
    service_call:
        Option<unsafe extern "C" fn(service: c_int, params: *mut *mut c_void, len: c_int) -> c_int>,
    hardware_version: u8,
}

impl ServiceCall {
    pub(crate) fn new(
        service_call: Option<
            unsafe extern "C" fn(service: c_int, params: *mut *mut c_void, len: c_int) -> c_int,
        >,
        hardware_version: u8,
    ) -> Self {
        Self {
            service_call,
            hardware_version,
        }
    }

    pub(crate) fn register_callback(
        &self,
        function: SystemFunction,
        callback: *mut c_void,
    ) -> Result<(), &str> {
        let mut args = [function.code().as_ptr() as *mut _, callback];
        self.service_call(ServiceCallType::OwlServiceRegisterCallback, &mut args)
    }

    pub(crate) fn request_callback(&self, function: SystemFunction) -> Result<NonNull<()>, &str> {
        let mut callback: *mut () = core::ptr::null_mut();
        let mut args = [
            function.code().as_ptr() as *mut _,
            // Pass a pointer to the callback pointer, allowing the OS to write to it
            &mut callback as *mut *mut () as *mut c_void,
        ];

        self.service_call(ServiceCallType::OwlServiceRequestCallback, &mut args)
            .and_then(|_| NonNull::new(callback).ok_or("bad callback"))
    }

    pub(crate) fn get_array<T>(&self, table: SystemTable) -> Result<&'static [T], &str> {
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

    /// Get a resource file
    ///
    /// The OwlServiceGetArray service call takes 4 (pointer) args:
    ///  - resource name
    ///  - buffer address
    ///  - offset in bytes
    ///  - max_length in bytes
    ///
    /// if resource is not found or offset is not aligned, OWL_SERVICE_INVALID_ARGS is returned.
    /// if buffer address is null, max_length will by updated giving the actual length of the resource data minus offset.
    ///   if the resource is memory mapped, the buffer address will also be updated to the start of the resource + offet.
    /// if a non-null buffer address is given, data will be copied to the pointer, min(size, resourceSize - offet) bytes.
    pub(crate) fn get_resource(&self, name: &CStr) -> Result<(usize, Option<NonNull<u8>>), &str> {
        let mut size: usize = 0;
        let mut offset: usize = 0;
        let mut ptr: *mut u8 = core::ptr::null_mut();
        let mut args = [
            name.as_ptr() as *mut _,
            &mut ptr as *mut *mut u8 as *mut _,
            &mut offset as *mut usize as *mut _,
            &mut size as *mut usize as *mut _,
        ];

        self.service_call(ServiceCallType::OwlServiceLoadResource, &mut args)?;

        Ok((size, NonNull::new(ptr)))
    }

    pub(crate) fn load_resource(
        &self,
        name: &CStr,
        mut offset: usize,
        dest: &mut [u8],
    ) -> Result<(), &str> {
        let mut size: usize = dest.len();
        let mut args = [
            name.as_ptr() as *mut _,
            &mut dest.as_mut_ptr() as *mut *mut u8 as *mut _,
            &mut offset as *mut usize as *mut _,
            &mut size as *mut usize as *mut _,
        ];
        self.service_call(ServiceCallType::OwlServiceLoadResource, &mut args)
    }

    pub(crate) fn device_parameters(&self) -> DeviceParameters {
        const IN_OFFSET: &[u8; 3usize] = b"IO\0";
        const IN_SCALAR: &[u8; 3usize] = b"IS\0";
        const OUT_OFFSET: &[u8; 3usize] = b"OO\0";
        const OUT_SCALAR: &[u8; 3usize] = b"OS\0";

        let mut in_offset: i32 = 0;
        let mut in_scalar: i32 = 0;
        let mut out_offset: i32 = 0;
        let mut out_scalar: i32 = 0;

        let mut args = [
            IN_OFFSET.as_ptr() as *mut _,
            &mut in_offset as *mut i32 as *mut _,
            IN_SCALAR.as_ptr() as *mut _,
            &mut in_scalar as *mut i32 as *mut _,
            OUT_OFFSET.as_ptr() as *mut _,
            &mut out_offset as *mut i32 as *mut _,
            OUT_SCALAR.as_ptr() as *mut _,
            &mut out_scalar as *mut i32 as *mut _,
        ];

        let hardware_version = self.hardware_version;
        self.service_call(ServiceCallType::OwlServiceGetParameters, &mut args)
            .map_or_else(
                |_| match hardware_version {
                    OWL_MODULAR_HARDWARE => DeviceParameters::default_owl_modular(),
                    _ => DeviceParameters::default(),
                },
                |_| DeviceParameters {
                    input_offset: in_offset as f32 / u16::MAX as f32,
                    input_scalar: in_scalar as f32 / u16::MAX as f32,
                    output_offset: out_offset as f32 / u16::MAX as f32,
                    output_scalar: out_scalar as f32 / u16::MAX as f32,
                },
            )
    }

    pub(crate) fn init_rfft(
        &self,
        instance: *mut arm_rfft_fast_instance_f32,
        mut size: usize,
    ) -> Result<(), &str> {
        let mut args = [instance as *mut _, &mut size as *mut usize as *mut _];
        self.service_call(ServiceCallType::OwlServiceArmRfftFastInitF32, &mut args)
    }

    pub(crate) fn init_cfft(
        &self,
        instance: *mut arm_cfft_instance_f32,
        mut size: usize,
    ) -> Result<(), &str> {
        let mut args = [instance as *mut _, &mut size as *mut usize as *mut _];
        self.service_call(ServiceCallType::OwlServiceArmCfftInitF32, &mut args)
    }

    fn service_call(
        &self,
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
