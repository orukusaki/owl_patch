extern crate alloc;
use alloc::{boxed::Box, vec::Vec};

/// Container type for samples
pub trait Container: AsRef<[Self::Item]> {
    /// Sample type
    type Item;
}

impl<T> Container for [T] {
    type Item = T;
}

impl<T> Container for &[T] {
    type Item = T;
}

impl<T> Container for &mut [T] {
    type Item = T;
}

impl<T> Container for Box<[T]> {
    type Item = T;
}

impl<T> Container for Vec<T> {
    type Item = T;
}

/// Container type for samples, but it's mutable
pub trait MutableContainer: Container + AsMut<[Self::Item]> {}
impl<T> MutableContainer for T where T: Container + AsMut<[Self::Item]> {}
