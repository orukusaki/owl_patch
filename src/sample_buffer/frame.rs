use super::*;
extern crate alloc;

use alloc::{boxed::Box, vec};
use core::ops::{Index, IndexMut};

/// Frame - a container holding one sample for each channel
#[derive(Debug, Default)]
pub struct Frame<C: Container + ?Sized>(C);

impl<C: Container + ?Sized> Frame<C>
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

    /// Is it empty?
    pub fn is_empty(&self) -> bool {
        self.0.as_ref().len() > 0
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

impl<C: Container + ?Sized> Index<usize> for Frame<C> {
    type Output = C::Item;

    fn index(&self, index: usize) -> &Self::Output {
        &self.0.as_ref()[index]
    }
}

impl<C: MutableContainer + ?Sized> IndexMut<usize> for Frame<C> {
    fn index_mut(&mut self, index: usize) -> &mut Self::Output {
        &mut self.0.as_mut()[index]
    }
}

impl<C: Container + ?Sized> Index<usize> for &mut Frame<C> {
    type Output = C::Item;
    fn index(&self, index: usize) -> &Self::Output {
        &self.0.as_ref()[index]
    }
}

impl<T> IndexMut<usize> for &mut Frame<[T]> {
    fn index_mut(&mut self, index: usize) -> &mut Self::Output {
        &mut self.0[index]
    }
}

impl<T: Default + Clone> Frame<Box<[T]>> {
    /// Create a new, zeroed frame
    pub fn new(n_channels: usize) -> Self {
        Self(vec![T::default(); n_channels].into_boxed_slice())
    }
}

impl<C: Container> From<C> for Frame<C> {
    fn from(samples: C) -> Self {
        Self(samples)
    }
}

impl<T> From<&[T]> for &Frame<[T]> {
    fn from(samples: &[T]) -> Self {
        // Safety: size, layout, and lifetime are all the same
        unsafe { core::mem::transmute(samples) }
    }
}

impl<T> From<&mut [T]> for &mut Frame<[T]> {
fn from(samples: &mut [T]) -> Self {
        // Safety: size, layout, and lifetime are all the same
        unsafe { core::mem::transmute(samples) }
    }
}

impl<C> Clone for Frame<C>
where
    C: Container + Clone,
    C::Item: Clone
{
    fn clone(&self) -> Self {
        Self(self.0.clone())
    }
}

macro_rules! impl_op {
    ($assign_trait:ident, $assign_method:ident) => {
        impl<F, C> $assign_trait<F> for Frame<C>
        where
            F: $assign_trait<F> + Copy + Default,
            C: MutableContainer<Item = F>,
        {
            fn $assign_method(&mut self, rhs: F) {
                for s in self.samples_mut() {
                    (*s).$assign_method(rhs);
                }
            }
        }

        impl<F, C> $assign_trait<F> for &mut Frame<C>
        where
            F: $assign_trait<F> + Copy + Default,
            C: MutableContainer<Item = F>,
        {
            fn $assign_method(&mut self, rhs: F) {
                for s in self.samples_mut() {
                    (*s).$assign_method(rhs);
                }
            }
        }

        impl<F, C1, C2> $assign_trait<Frame<C2>> for Frame<C1>
        where
            F: $assign_trait<F> + Copy + Default,
            C1: MutableContainer<Item = F>,
            C2: Container<Item = F>,
        {
            fn $assign_method(&mut self, rhs: Frame<C2>) {
                for (s, o) in self.samples_mut().zip(rhs.samples()) {
                    (*s).$assign_method(*o);
                }
            }
        }

        impl<F, C1, C2> $assign_trait<&Frame<C2>> for Frame<C1>
        where
            F: $assign_trait<F> + Copy + Default,
            C1: MutableContainer<Item = F>,
            C2: Container<Item = F>,
        {
            fn $assign_method(&mut self, rhs: &Frame<C2>) {
                for (s, o) in self.samples_mut().zip(rhs.samples()) {
                    (*s).$assign_method(*o);
                }
            }
        }
    };
}

impl_op!(AddAssign, add_assign);
impl_op!(SubAssign, sub_assign);
impl_op!(MulAssign, mul_assign);
impl_op!(DivAssign, div_assign);
impl_op!(RemAssign, rem_assign);
impl_op!(ShlAssign, shl_assign);
impl_op!(ShrAssign, shr_assign);

impl<F, C> MulAddAssign<F, F> for Frame<C>
where
    F: Copy + Default + MulAddAssign<F>,
    C: MutableContainer<Item = F>,
{
    fn mul_add_assign(&mut self, a: F, b: F) {
        for s in self.samples_mut() {
            s.mul_add_assign(a, b);
        }
    }
}

impl<F, C1, C2> MulAddAssign<&Frame<C2>, F> for Frame<C1>
where
    Self: for<'a> MulAssign<&'a Frame<C2>> + AddAssign<F>,
    F: Copy + Default,
    C1: MutableContainer<Item = F>,
    C2: Container<Item = F>,
{
    fn mul_add_assign(&mut self, a: &Frame<C2>, b: F) {
        self.mul_assign(a);
        self.add_assign(b);
    }
}

impl<F, C1, C2> MulAddAssign<F, &Frame<C2>> for Frame<C1>
where
    Self: MulAssign<F> + for<'a> AddAssign<&'a Frame<C2>>,
    F: Copy + Default,
    C1: MutableContainer<Item = F>,
    C2: Container<Item = F>,
{
    fn mul_add_assign(&mut self, a: F, b: &Frame<C2>) {
        self.mul_assign(a);
        self.add_assign(b);
    }
}

impl<F, C1, C2> MulAddAssign<&Frame<C2>, &Frame<C2>> for Frame<C1>
where
    Self: for<'a> MulAssign<&'a Frame<C2>> + for<'a> AddAssign<&'a Frame<C2>>,
    F: Copy + Default + MulAddAssign<F, F>,
    C1: MutableContainer<Item = F>,
    C2: Container<Item = F>,
{
    #[inline(never)]
    fn mul_add_assign(&mut self, a: &Frame<C2>, b: &Frame<C2>) {
        // Seems to be faster than doing it in a single loop - on m4 and m7
        self.mul_assign(a);
        self.add_assign(b);
    }
}

impl<F, C> Neg for Frame<C>
where
    F: Neg<Output = F> + Copy + Default,
    C: MutableContainer<Item = F>,
{
    type Output = Self;

    fn neg(mut self) -> Self::Output {
        for s in self.samples_mut() {
            *s = s.neg();
        }

        self
    }
}
