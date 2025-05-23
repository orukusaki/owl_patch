//! Audio Sample Buffers

mod convert;
pub use convert::{ConvertFrom, ConvertTo};
mod frame;
use frame::Frame;
mod container;
pub use container::{Container, MutableContainer};
mod storage;
pub use storage::{Channels, Interleaved, Mono};
use storage::{Storage, StorageMut};

extern crate alloc;

use core::ops::{
    AddAssign, DivAssign, Index, IndexMut, MulAssign, Neg, RemAssign, ShlAssign, ShrAssign,
    SubAssign,
};

use alloc::boxed::Box;
use num_traits::MulAddAssign;

/// Sample buffer
#[derive(Debug)]
pub struct Buffer<S> {
    storage: S,
}

/// Single channel buffer with heap allocated samples
pub type MonoBuffer<T> = Buffer<Mono<Box<[T]>>>;

/// Multi channel buffer with heap allocated samples
pub type BufferByChannel<T> = Buffer<Channels<Box<[T]>>>;

/// Interleaved buffer with heap allocated samples
pub type InterleavedBuffer<T> = Buffer<Interleaved<Box<[T]>>>;

/// Single channel read-only buffer referencing samples stored externally
pub type MonoBufferRef<'a, T> = Buffer<Mono<&'a [T]>>;

/// Multi channel read-only buffer referencing samples stored externally
pub type BufferByChannelRef<'a, T> = Buffer<Channels<&'a [T]>>;

/// Interleaved read-only buffer referencing samples stored externally
pub type InterleavedBufferRef<'a, T> = Buffer<Interleaved<&'a [T]>>;

/// Single channel mutable buffer referencing samples stored externally
pub type MonoBufferMut<'a, T> = Buffer<Mono<&'a mut [T]>>;

/// Multi channel mutable buffer referencing samples stored externally
pub type BufferByChannelMut<'a, T> = Buffer<Channels<&'a mut [T]>>;

/// Interleaved mutable buffer referencing samples stored externally
pub type InterleavedBufferMut<'a, T> = Buffer<Interleaved<&'a mut [T]>>;

impl<T: Default + Clone> MonoBuffer<T> {
    /// Create a new mono buffer, with owned samples (allocates)
    ///
    /// ```
    /// # use owl_patch::sample_buffer::MonoBuffer;
    /// let buffer = MonoBuffer::new(4);
    ///
    /// assert_eq!(&[0.0f32; 4], buffer.as_slice());
    /// ```
    pub fn new(blocksize: usize) -> Self {
        Self {
            storage: Mono::new(blocksize),
        }
    }
}

impl<T: Default + Clone> Buffer<Interleaved<Box<[T]>>> {
    /// Create a new Interleaved buffer, with owned samples (allocates)
    ///
    /// ```
    /// use owl_patch::sample_buffer::InterleavedBuffer;
    /// let buffer = InterleavedBuffer::<f32>::new(4, 10);
    ///
    /// assert_eq!(10, buffer.frames().len());
    /// assert_eq!(4, buffer[0].len());
    /// ```
    pub fn new(nchannels: usize, blocksize: usize) -> Self {
        Self {
            storage: Interleaved::new(nchannels, blocksize),
        }
    }
}

impl<T: Default + Clone> Buffer<Channels<Box<[T]>>> {
    /// Create a new Multichannel buffer, with owned samples (allocates)
    ///
    /// ```
    /// use owl_patch::sample_buffer::BufferByChannel;
    /// let buffer = BufferByChannel::<f32>::new(4, 10);
    ///
    /// assert_eq!(4, buffer.channels().len());
    /// assert_eq!(10, buffer[0].len());
    /// ```
    pub fn new(nchannels: usize, blocksize: usize) -> Self {
        Self {
            storage: Channels::new(nchannels, blocksize),
        }
    }
}

impl<'a, T> Buffer<Mono<&'a [T]>> {
    /// Create a new Mono buffer, taking a reference to samples stored elsewhere
    ///
    /// ```
    /// use owl_patch::sample_buffer::MonoBufferRef;
    ///
    /// let samples = [0.0, 1.0, 2.0];
    /// let buffer = MonoBufferRef::<f32>::new(&samples);
    ///
    /// assert_eq!(&[0.0, 1.0, 2.0], buffer.as_slice());
    /// ```
    pub fn new(samples: &'a [T]) -> Self {
        Self {
            storage: samples.into(),
        }
    }
}

impl<'a, T> Buffer<Channels<&'a [T]>> {
    /// Create a new Multichannel buffer, taking a reference to samples stored elsewhere
    ///
    /// ```
    /// use owl_patch::sample_buffer::BufferByChannelRef;
    ///
    /// let samples = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0];
    /// let buffer = BufferByChannelRef::<f32>::new(&samples, 2);
    ///
    /// assert_eq!(&[0.0, 1.0, 2.0], buffer[0].as_slice());
    /// assert_eq!(&[3.0, 4.0, 5.0], buffer[1].as_slice());
    /// ```
    pub fn new(samples: &'a [T], nchannels: usize) -> Self {
        Self {
            storage: Channels::new_ref(samples, nchannels),
        }
    }
}

impl<'a, T> Buffer<Interleaved<&'a [T]>> {
    /// Create a new Interleaved buffer, taking a reference to samples stored elsewhere
    ///
    /// ```
    /// use owl_patch::sample_buffer::InterleavedBufferRef;
    ///
    /// let samples = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0];
    /// let buffer = InterleavedBufferRef::<f32>::new(&samples, 2);
    ///
    /// assert_eq!(&[0.0, 1.0], buffer[0].as_slice());
    /// assert_eq!(&[2.0, 3.0], buffer[1].as_slice());
    /// assert_eq!(&[4.0, 5.0], buffer[2].as_slice());
    /// ```
    pub fn new(samples: &'a [T], nchannels: usize) -> Self {
        Self {
            storage: Interleaved::new_ref(samples, nchannels),
        }
    }
}

impl<'a, T> Buffer<Mono<&'a mut [T]>> {
    /// Create a new Mono buffer, taking a mutable reference to samples stored elsewhere
    ///
    /// ```
    /// use owl_patch::sample_buffer::MonoBufferMut;
    ///
    /// let mut samples = [0.0, 1.0, 2.0];
    /// let mut buffer = MonoBufferMut::<f32>::new(&mut samples);
    /// buffer[1] = -1.0;
    ///
    /// assert_eq!(&[0.0, -1.0, 2.0], buffer.as_slice());
    /// ```
    pub fn new(samples: &'a mut [T]) -> Self {
        Self {
            storage: samples.into(),
        }
    }
}

impl<'a, T> Buffer<Channels<&'a mut [T]>> {
    /// Create a new Multichannel buffer, taking a reference to samples stored elsewhere
    ///
    /// ```
    /// use owl_patch::sample_buffer::BufferByChannelMut;
    ///
    /// let mut samples = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0];
    /// let mut buffer = BufferByChannelMut::<f32>::new(&mut samples, 2);
    /// buffer[1][0] = -3.0;
    ///
    /// assert_eq!(&[0.0, 1.0, 2.0], buffer[0].as_slice());
    /// assert_eq!(&[-3.0, 4.0, 5.0], buffer[1].as_slice());
    /// ```
    pub fn new(samples: &'a mut [T], nchannels: usize) -> Self {
        Self {
            storage: Channels::new_mut(samples, nchannels),
        }
    }
}

impl<'a, T> Buffer<Interleaved<&'a mut [T]>> {
    /// Create a new Interleaved buffer, taking a reference to samples stored elsewhere
    ///
    /// ```
    /// use owl_patch::sample_buffer::InterleavedBufferMut;
    ///
    /// let mut samples = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0];
    /// let mut buffer = InterleavedBufferMut::<f32>::new(&mut samples, 2);
    /// buffer[1][0] = -3.0;
    ///
    /// assert_eq!(&[0.0, 1.0], buffer[0].as_slice());
    /// assert_eq!(&[-3.0, 3.0], buffer[1].as_slice());
    /// assert_eq!(&[4.0, 5.0], buffer[2].as_slice());
    /// ```
    pub fn new(samples: &'a mut [T], nchannels: usize) -> Self {
        Self {
            storage: Interleaved::new_mut(samples, nchannels),
        }
    }
}

impl<'a, T> Buffer<Mono<&'a [T]>> {
    /// Create a new mono buffer with borrowed samples.
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let data = vec![0.0f32; 8];
    /// let buffer = Buffer::mono_ref(&data);
    ///
    /// assert_eq!(&[0.0; 8], buffer.as_slice());
    /// ```
    pub fn mono_ref(samples: &'a [T]) -> Self {
        Self::new(samples)
    }
}

impl<'a, T> Buffer<Mono<&'a mut [T]>> {
    /// Create a new mono buffer with mutably borrowed samples.
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let mut data: Box<[f32]> = vec![0.0f32; 8].into_boxed_slice();
    /// let mut buffer = Buffer::mono_mut(&mut data);
    /// buffer += 1.0;
    /// assert_eq!(&[1.0; 8], &data.as_ref());
    /// ```
    pub fn mono_mut(samples: &'a mut [T]) -> Self {
        Self::new(samples)
    }
}

impl<C: Container> Buffer<Mono<C>> {
    /// Length of this buffer (samples)
    pub fn len(&self) -> usize {
        self.storage.len()
    }

    /// Is the buffer empty?
    pub fn is_empty(&self) -> bool {
        self.storage.is_empty()
    }

    /// Get a slice containing all the samples
    pub fn as_slice(&self) -> &[C::Item] {
        self.storage.as_slice()
    }
}

impl<C: MutableContainer> Buffer<Mono<C>> {
    /// Get a Mutable slice of the samples
    pub fn as_slice_mut(&mut self) -> &mut [C::Item] {
        self.storage.as_slice_mut()
    }
}

impl<C: MutableContainer> Buffer<Mono<C>>
where
    C::Item: Clone,
{
    /// Fill the buffer with the given value
    pub fn fill(&mut self, value: C::Item) {
        self.storage.fill(value);
    }
}

impl<C: Container> Buffer<Interleaved<C>> {
    /// Get an iterator over each frame
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let buffer = InterleavedBuffer::<f32>::new(2, 32);
    ///
    /// buffer.frames().for_each(|frame| assert_eq!(&[0.0; 2], frame.as_slice()));
    /// ```
    pub fn frames(&self) -> impl ExactSizeIterator<Item = &Frame<C>> {
        self.storage.frames()
    }
}

impl<C: MutableContainer> Buffer<Interleaved<C>> {
    /// Get a mutable iterator over the samples for each frame
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let mut buffer = InterleavedBuffer::<f32>::new(2, 2);
    ///
    /// buffer.frames_mut().for_each(|frame| frame.as_slice_mut().copy_from_slice(&[1.0, 2.0]));
    ///
    /// assert_eq!(&[1.0, 2.0], buffer[0].as_slice());
    /// assert_eq!(&[1.0, 2.0], buffer[1].as_slice());
    /// ```
    pub fn frames_mut(&mut self) -> impl ExactSizeIterator<Item = &mut Frame<C>> {
        self.storage.frames_mut()
    }
}

impl<C: Container> Buffer<Channels<C>> {
    /// Get an iterator over each channel
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let buffer = BufferByChannel::new(2, 4);
    ///
    /// buffer.channels().for_each(|ch| assert_eq!(&[0.0; 4], ch.as_slice()));
    /// ```
    pub fn channels(&self) -> impl ExactSizeIterator<Item = &Buffer<Mono<C>>> {
        self.storage.channels()
    }

    /// Get (fallibly) a reference to a channel by index
    pub fn get(&self, index: usize) -> Option<&Buffer<Mono<C>>> {
        self.storage.get(index)
    }

    /// Get the samples in the left channel as a readonly mono buffer
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let buffer = BufferByChannel::new(2, 4);
    ///
    /// assert!(buffer.left().is_some());
    /// if let Some(left) = buffer.left() {
    ///     assert_eq!(&[0.0; 4], left.as_slice())
    /// }
    /// ```
    pub fn left(&self) -> Option<&Buffer<Mono<C>>> {
        self.get(0)
    }

    /// Get the samples in the right channel as a readonly mono buffer
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let buffer = BufferByChannel::new(2, 4);
    ///
    /// assert!(buffer.right().is_some());
    /// if let Some(right) = buffer.right() {
    ///     assert_eq!(&[0.0; 4], right.as_slice())
    /// }
    /// ```
    ///
    /// None will be returned if the buffer doesn't have at least 2 channels
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let buffer = BufferByChannel::<f32>::new(1, 4);
    ///
    /// assert!(buffer.right().is_none());
    /// ```
    pub fn right(&self) -> Option<&Buffer<Mono<C>>> {
        self.get(1)
    }
}

impl<C: MutableContainer> Buffer<Channels<C>> {
    /// Get a mutable iterator over the samples for each channel
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let mut buffer = BufferByChannel::new(2, 2);
    ///
    /// buffer.channels_mut().enumerate().for_each(|(n, mut ch)| ch += n as f32);
    /// assert_eq!(&[0.0f32, 0.0], buffer[0].as_slice());
    /// assert_eq!(&[1.0, 1.0], buffer[1].as_slice());
    /// ```
    pub fn channels_mut(&mut self) -> impl ExactSizeIterator<Item = &mut Buffer<Mono<C>>> {
        self.storage.channels_mut()
    }

    /// Get (fallibly) a mutable refernce to a channel by index
    pub fn get_mut(&mut self, index: usize) -> Option<&mut Buffer<Mono<C>>> {
        self.storage.get_mut(index)
    }

    /// Get the samples in the left channel as a mutable mono buffer
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let mut buffer = BufferByChannel::new(2, 4);
    ///
    /// if let Some(mut left) = buffer.left_mut() {
    ///     left.fill(1.0);
    /// }
    /// assert_eq!(&[1.0f32, 1.0, 1.0, 1.0], buffer[0].as_slice());
    /// assert_eq!(&[0.0, 0.0, 0.0, 0.0], buffer[1].as_slice ());
    /// ```
    pub fn left_mut(&mut self) -> Option<&mut Buffer<Mono<C>>> {
        self.get_mut(0)
    }

    /// Get the samples in the right channel as a mutable mono buffer
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let mut buffer = BufferByChannel::new(2, 4);
    ///
    /// if let Some(mut right) = buffer.right_mut() {
    ///     right.fill(1.0);
    /// }
    /// assert_eq!(&[0.0f32, 0.0, 0.0, 0.0], buffer[0].as_slice());
    /// assert_eq!(&[1.0, 1.0, 1.0, 1.0,], buffer[1].as_slice());
    /// ```
    pub fn right_mut(&mut self) -> Option<&mut Buffer<Mono<C>>> {
        self.get_mut(1)
    }
}

impl<S: Storage> Buffer<S> {
    /// Get an iterator over all the samples in the buffer
    pub fn samples(&self) -> impl Iterator<Item = &S::Item> {
        self.storage.samples()
    }
}

impl<S: StorageMut> Buffer<S> {
    /// Get a mutable iterator over all the samples in the buffer
    pub fn samples_mut(&mut self) -> impl Iterator<Item = &mut S::Item> {
        self.storage.samples_mut()
    }
}

impl<S: Storage> Index<usize> for Buffer<S>
where
    S: Index<usize>,
{
    type Output = S::Output;

    fn index(&self, index: usize) -> &Self::Output {
        self.storage.index(index)
    }
}

impl<S: StorageMut> IndexMut<usize> for Buffer<S>
where
    S: IndexMut<usize>,
{
    fn index_mut(&mut self, index: usize) -> &mut Self::Output {
        self.storage.index_mut(index)
    }
}

impl<S> Clone for Buffer<S>
where
    S: Clone,
{
    fn clone(&self) -> Self {
        Self {
            storage: self.storage.clone(),
        }
    }
}

impl<S1, S2> ConvertFrom<&Buffer<S2>> for Buffer<S1>
where
    S1: StorageMut,
    S2: Storage,
    S1: for<'a> ConvertFrom<&'a S2>,
{
    fn convert_from(&mut self, other: &Buffer<S2>) {
        self.storage.convert_from(&other.storage);
    }
}

impl<F2, S> ConvertFrom<&[F2]> for Buffer<S>
where
    S: StorageMut,
    S::Item: ConvertFrom<F2>,
    F2: Copy,
{
    /// Convert from a slice of data
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let data = [i32::MIN, 0, i32::MAX, 0, i32::MIN, 0, i32::MAX, 0];
    /// let mut buffer = MonoBuffer::<f32>::new(8);
    /// buffer.convert_from(&data[..]);
    ///
    /// assert_eq!(&[-1.0, 0.0, 1.0, 0.0, -1.0, 0.0, 1.0, 0.0], buffer.as_slice());
    /// ```
    fn convert_from(&mut self, other: &[F2]) {
        // assert_eq!(self.storage.samples_mut().len(), other.len());
        for (o, i) in self.storage.samples_mut().zip(other.iter()) {
            o.convert_from(*i);
        }
    }
}

impl<F, S> ConvertFrom<&Buffer<S>> for &mut [F]
where
    S: Storage,
    S::Item: Copy,
    F: ConvertFrom<S::Item>,
{
    /// Convert to a slice of data
    /// ```
    /// # use owl_patch::sample_buffer::*;
    ///
    /// let samples = [-1.0f32, 0.0, 1.0, 0.0, -1.0, 0.0, 1.0, 0.0];
    /// let buffer = BufferByChannelRef::new(&samples, 2);
    /// let mut output = [0i32; 8];
    /// output.as_mut_slice().convert_from(&buffer);
    ///
    /// assert_eq!([i32::MIN, 0, i32::MAX, 0, i32::MIN, 0, i32::MAX, 0], output);
    /// ```
    fn convert_from(&mut self, other: &Buffer<S>) {
        // assert_eq!(self.len(), other.storage.samples().len());
        for (o, i) in self.iter_mut().zip(other.storage.samples()) {
            o.convert_from(*i);
        }
    }
}

macro_rules! impl_op {
    ($assign_trait:ident, $assign_method:ident) => {
        impl<F, S> $assign_trait<F> for Buffer<S>
        where
            F: $assign_trait<F> + Copy + Default,
            S: StorageMut<Item = F>,
        {
            fn $assign_method(&mut self, rhs: F) {
                for s in self.samples_mut() {
                    (*s).$assign_method(rhs);
                }
            }
        }

        impl<F, S> $assign_trait<F> for &mut Buffer<S>
        where
            F: $assign_trait<F> + Copy + Default,
            S: StorageMut<Item = F>,
        {
            fn $assign_method(&mut self, rhs: F) {
                for s in self.samples_mut() {
                    (*s).$assign_method(rhs);
                }
            }
        }

        impl<F, S> $assign_trait<&Buffer<S>> for Buffer<S>
        where
            F: $assign_trait<F> + Copy + Default,
            S: StorageMut<Item = F>,
        {
            fn $assign_method(&mut self, rhs: &Buffer<S>) {
                for (s, o) in self.samples_mut().zip(rhs.storage.samples()) {
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

impl<F, S> MulAddAssign<F, F> for Buffer<S>
where
    F: Copy + Default + MulAddAssign<F>,
    S: StorageMut<Item = F>,
{
    fn mul_add_assign(&mut self, a: F, b: F) {
        for s in self.storage.samples_mut() {
            s.mul_add_assign(a, b);
        }
    }
}

impl<F, S> MulAddAssign<&Buffer<S>, F> for Buffer<S>
where
    Self: for<'a> MulAssign<&'a Buffer<S>> + AddAssign<F>,
    F: Copy + Default,
    S: StorageMut<Item = F>,
{
    fn mul_add_assign(&mut self, a: &Buffer<S>, b: F) {
        self.mul_assign(a);
        self.add_assign(b);
    }
}

impl<F, S> MulAddAssign<F, &Buffer<S>> for Buffer<S>
where
    Self: MulAssign<F> + for<'a> AddAssign<&'a Buffer<S>>,
    F: Copy + Default,
    S: StorageMut<Item = F>,
{
    fn mul_add_assign(&mut self, a: F, b: &Buffer<S>) {
        self.mul_assign(a);
        self.add_assign(b);
    }
}

impl<F, S> MulAddAssign<&Buffer<S>, &Buffer<S>> for Buffer<S>
where
    Self: for<'a> MulAssign<&'a Buffer<S>> + for<'a> AddAssign<&'a Buffer<S>>,
    F: Copy + Default + MulAddAssign<F, F>,
    S: StorageMut<Item = F>,
{
    #[inline(never)]
    fn mul_add_assign(&mut self, a: &Buffer<S>, b: &Buffer<S>) {
        // Seems to be faster than doing it in a single loop - on m4 and m7
        self.mul_assign(a);
        self.add_assign(b);
    }
}

impl<F, S> Neg for Buffer<S>
where
    F: Neg<Output = F> + Copy + Default,
    S: StorageMut<Item = F>,
{
    type Output = Self;

    fn neg(mut self) -> Self::Output {
        for s in self.storage.samples_mut() {
            *s = s.neg();
        }

        self
    }
}
