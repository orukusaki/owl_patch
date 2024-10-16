use crate::ffi::fastmaths::*;

pub trait FastFloat {
    fn fast_pow(self, rhs: Self) -> Self;
    fn fast_exp(self) -> Self;
    fn fast_exp2(self) -> Self;
    fn fast_exp10(self) -> Self;
    fn fast_log(self) -> Self;
    fn fast_log2(self) -> Self;
    fn fast_log10(self) -> Self;
    fn fast_atan2(self, rhs: Self) -> Self;
    fn fast_fmod(self, rhs: Self) -> Self;
}

impl FastFloat for f32 {
    #[inline]
    fn fast_pow(self, rhs: Self) -> Self {
        unsafe { fast_powf(self, rhs) }
    }
    #[inline]
    fn fast_exp(self) -> Self {
        unsafe { fast_expf(self) }
    }
    #[inline]
    fn fast_exp2(self) -> Self {
        unsafe { fast_exp2f(self) }
    }
    #[inline]
    fn fast_exp10(self) -> Self {
        unsafe { fast_exp10f(self) }
    }
    #[inline]
    fn fast_log(self) -> Self {
        unsafe { fast_logf(self) }
    }
    #[inline]
    fn fast_log2(self) -> Self {
        unsafe { fast_log2f(self) }
    }
    #[inline]
    fn fast_log10(self) -> Self {
        unsafe { fast_log10f(self) }
    }
    #[inline]
    fn fast_atan2(self, rhs: Self) -> Self {
        unsafe { fast_atan2f(self, rhs) }
    }
    #[inline]
    fn fast_fmod(self, rhs: Self) -> Self {
        unsafe { fast_fmodf(self, rhs) }
    }
}

pub trait FastInt {
    fn fast_log2(self) -> Self;
}

impl FastInt for u32 {
    fn fast_log2(self) -> Self {
        unsafe { fast_log2i(self) }
    }
}

pub(crate) fn set_log_table(table: &'static [f32]) {
    unsafe { fast_log_set_table(table.as_ptr(), table.len() as core::ffi::c_int) }
}

pub(crate) fn set_pow_table(table: &'static [u32]) {
    unsafe { fast_pow_set_table(table.as_ptr(), table.len() as core::ffi::c_int) }
}

/// Set the default pow/log tables
pub fn set_default_tables() {
    unsafe { crate::ffi::fastmaths::setDefaultTables() }
}

#[cfg(test)]
mod tests {
    use crate::fastmaths::{FastFloat, FastInt};
    use std::ops::Rem;

    macro_rules! assert_close_enough {
        ($a:expr, $b:expr) => {
            println!("{} : {}", $a, $b);
            let ratio = $a / $b;
            assert!(ratio < 1.01);
            assert!(ratio > 0.99);
        };
    }

    #[ctor::ctor]
    fn init() {
        super::set_default_tables();
    }

    #[test]
    fn test_fast_pow() {
        let val = 2.0f32;
        let pow = 2.0;
        assert_close_enough!(val.fast_pow(pow), val.powf(pow));
    }

    #[test]
    fn test_fast_exp() {
        let val = 86.4f32;
        assert_close_enough!(val.fast_exp(), val.exp());
    }

    #[test]
    fn test_fast_exp2() {
        let val = 23.5f32;
        assert_close_enough!(val.fast_exp2(), val.exp2());
    }

    #[test]
    fn test_fast_exp10() {
        let val = -26.96f32;
        assert_close_enough!(val.fast_exp10(), 10.0f32.powf(val));
    }

    #[test]
    fn test_fast_log() {
        let val = 5620.1f32;
        assert_close_enough!(val.fast_log(), val.ln());
    }

    #[test]
    fn test_fast_log2() {
        let val = 92.0f32;
        assert_close_enough!(val.fast_log2(), val.log2());
    }

    #[test]
    fn test_fast_log10() {
        let val = 200.0f32;
        assert_close_enough!(val.fast_log10(), val.log10());
    }

    #[test]
    fn test_fast_atan2() {
        let val = 3.0;
        let rhs = -3.0;
        assert_close_enough!(val.fast_atan2(rhs), val.atan2(rhs));
    }

    #[test]
    fn test_fast_fmod() {
        let val = 21.7f32;
        let rhs = 3.2;
        assert_close_enough!(val.fast_fmod(rhs), val.rem(rhs));
    }

    #[test]
    fn test_fast_log2i() {
        let val = 92u32;
        assert_eq!(val.fast_log2(), val.ilog2());
    }
}
