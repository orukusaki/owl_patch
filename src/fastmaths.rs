//! Fast Maths functions using lookup tables
//!
//! # Example:
//! ```
//! use owl_patch::fastmaths::FastFloat as _;
//!
//! owl_patch::fastmaths::set_default_tables();
//!
//! assert_eq!(2.0.fast_pow(2.0), 4.0217195); // values are approximate!
//! ```
//!
//! These functions rely on the lookup tables being set. Either [set_default_tables] or [set_log_table] *and* [set_pow_table]
//! Must be called before any of them are used. This is handled automatically when using the [patch] attribute macro.
//!
//! The `fastmaths` crate feature must be enabled if you want to use this module
//!
//! [patch]: crate::patch
use crate::ffi::fastmaths::*;

/// Fast (approximate) maths functions
pub trait FastFloat {
    /// Fast (approximate) power: `self^n`
    fn fast_pow(self, n: Self) -> Self;

    /// Fast (approximate) exp: `e^(self)`
    fn fast_exp(self) -> Self;

    /// Fast (approximate) exp2: `2^(self)`
    fn fast_exp2(self) -> Self;

    /// Fast (approximate) exp10 : `10^(self)`
    fn fast_exp10(self) -> Self;

    /// Fast (approximate) natural log
    fn fast_ln(self) -> Self;

    /// Fast (approximate) base 2 logarithm
    fn fast_log2(self) -> Self;

    /// Fast (approximate) base 10 logarithm
    fn fast_log10(self) -> Self;

    /// Fast (approximate) four quadrant arctangent
    fn fast_atan2(self, y: Self) -> Self;
}

impl FastFloat for f32 {
    #[inline]
    fn fast_pow(self, n: Self) -> Self {
        unsafe { fast_powf(self, n) }
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
    fn fast_ln(self) -> Self {
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
    fn fast_atan2(self, y: Self) -> Self {
        unsafe { fast_atan2f(self, y) }
    }
}

/// Set the log table to use
pub fn set_log_table(table: &'static [f32]) {
    unsafe { fast_log_set_table(table.as_ptr(), table.len() as core::ffi::c_int) }
}

/// Set the pow table to use
pub fn set_pow_table(table: &'static [u32]) {
    unsafe { fast_pow_set_table(table.as_ptr(), table.len() as core::ffi::c_int) }
}

/// Set the default pow/log tables
pub fn set_default_tables() {
    unsafe { crate::ffi::fastmaths::set_default_tables() }
}

#[cfg(test)]
mod tests {
    use crate::fastmaths::FastFloat;
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
    fn test_fast_ln() {
        let val = 5620.1f32;
        assert_close_enough!(val.fast_ln(), val.ln());
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
}
