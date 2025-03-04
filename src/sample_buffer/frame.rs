use super::*;
extern crate alloc;

use alloc::{boxed::Box, vec};
use core::ops::{Index, IndexMut};

/// Frame - a container holding one sample for each channel
#[derive(Debug, Default)]
pub struct Frame<C: Container>(C);

impl<C: Container> Frame<C>
where
    C::Item: Clone,
{
    /// Get all samples as a slice
    pub fn as_slice(&self) -> &[C::Item] {
        self.0.as_ref()
    }

    /// Number of channels
    pub fn len(&self) -> usize {
        self.0.as_ref().len()
    }
}

impl<C: MutableContainer> Frame<C>
where
    C::Item: Clone,
{
    /// Fill frame with the given value
    pub fn fill(&mut self, value: C::Item) {
        self.0.as_mut().fill(value);
    }

    /// Get all samples as a mutable slice
    pub fn as_slice_mut(&mut self) -> &mut [C::Item] {
        self.0.as_mut()
    }
}

impl<C: Container> Storage for Frame<C> {
    type Item = C::Item;
    fn samples(&self) -> impl Iterator<Item = &Self::Item> {
        self.0.as_ref().iter()
    }
}

impl<C: MutableContainer> StorageMut for Frame<C> {
    fn samples_mut(&mut self) -> impl Iterator<Item = &mut Self::Item> {
        self.0.as_mut().iter_mut()
    }
}

impl<C: Container> Index<usize> for Frame<C> {
    type Output = C::Item;

    fn index(&self, index: usize) -> &Self::Output {
        &self.0.as_ref()[index]
    }
}

impl<C: MutableContainer> IndexMut<usize> for Frame<C> {
    fn index_mut(&mut self, index: usize) -> &mut Self::Output {
        &mut self.0.as_mut()[index]
    }
}

impl<T: Default + Clone> Frame<Box<[T]>> {
    pub(crate) fn new(n_channels: usize) -> Self {
        Self(vec![T::default(); n_channels].into_boxed_slice())
    }
}

impl<C: Container> From<C> for Frame<C> {
    fn from(samples: C) -> Self {
        Self(samples)
    }
}
