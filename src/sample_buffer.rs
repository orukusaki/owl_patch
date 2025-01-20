//! Audio Sample Buffers

extern crate alloc;

use core::{
    marker::PhantomData,
    ops::{AddAssign, Deref, DerefMut, DivAssign, MulAssign, Neg, RemAssign, SubAssign},
};

use alloc::vec;
use alloc::{boxed::Box, vec::Vec};
use num_traits::MulAddAssign;

use crate::interpolation::Lerp;

/// Sample / Buffer conversion trait
pub trait ConvertFrom<T: ?Sized> {
    /// Read from `other`, converting into the correct format
    fn convert_from(&mut self, other: T);
}

impl<T> ConvertFrom<T> for T {
    fn convert_from(&mut self, value: T) {
        *self = value
    }
}

/// Sample / Buffer conversion trait
pub trait ConvertTo<T> {
    /// Write to `other`, converting into the correct format
    fn convert_to(&self, other: &mut T);
}

/// Consuming Sample conversion trait
pub trait ConvertInto<T> {
    /// Convert to correct format
    fn convert_into(self) -> T;
}

/// Auto implementation making self->self conversion a nop
impl<T> ConvertInto<T> for T {
    fn convert_into(self) -> Self {
        self
    }
}

/// Auto implementation
impl<A, B> ConvertTo<B> for A
where
    for<'a> B: ConvertFrom<&'a A>,
{
    fn convert_to(&self, other: &mut B) {
        other.convert_from(self)
    }
}

impl ConvertInto<f32> for i32 {
    /// Convertion to float, so that i32::MAX => 1.0 and i32::MIN => -1.0
    fn convert_into(self) -> f32 {
        const MUL: f32 = 1.0 / (0x80000000i64 as f32);
        self as f32 * MUL
    }
}

impl ConvertInto<i32> for f32 {
    /// Convertion from float, so that 1.0 => i32::MAX and -1.0 => i32::MIN
    fn convert_into(self) -> i32 {
        const MUL: f32 = 0x80000000i64 as f32;
        (self * MUL) as i32
    }
}

impl ConvertFrom<i32> for f32 {
    fn convert_from(&mut self, other: i32) {
        *self = other.convert_into();
    }
}

impl ConvertFrom<f32> for i32 {
    fn convert_from(&mut self, other: f32) {
        *self = other.convert_into();
    }
}

/// Marker trait to indicate how samples are stored in a buffer
pub trait StoragePattern {}

/// Samples all from a single channel
pub struct Mono;
impl StoragePattern for Mono {}

/// Samples stored one channel at a time
/// eg: `[l0, l1, l2, ..., r0, r1, r2, ...]`
pub struct Channels;
impl StoragePattern for Channels {}

/// Samples stored interleaved
/// eg: `[l0, r0, l1, r1, l2, r2 ...]`
pub struct Interleaved;
impl StoragePattern for Interleaved {}

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

/// Sample buffer
///
/// ### Type params:
///
/// * S: Describes how the samples are stored, see [StoragePattern]
/// * C: [Container] or [MutableContainer] type for samples.
///   * C::Item Can be any of data, but [i32] and [f32] are the ones you'll most likely want to use.
///     If using [f32], the signal should be kept between -1.0 and 1.0. Anything outside
///     of this will be clipped during conversion. The range for [i32] is [i32::MIN]..[i32::MAX]
pub struct Buffer<S: StoragePattern, C: Container> {
    samples: C,
    channels: usize,
    blocksize: usize,
    _storage: PhantomData<S>,
}

impl<F: Default + Clone> Buffer<Mono, Box<[F]>> {
    /// Create a new mono buffer, with owned samples (allocates)
    ///
    /// ```
    /// # use owl_patch::sample_buffer::Buffer;
    /// let buffer = Buffer::new_mono(4);
    ///
    /// assert_eq!(&[0.0f32; 4], buffer.samples());
    /// ```
    pub fn new_mono(blocksize: usize) -> Self {
        let samples = vec![F::default(); blocksize];

        Self {
            samples: samples.into_boxed_slice(),
            channels: 1,
            blocksize,
            _storage: PhantomData,
        }
    }
}

impl<F: Default + Clone, S: StoragePattern> Buffer<S, Box<[F]>> {
    /// Create a new buffer, allocating a boxed slice to hold sample data
    ///
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let buffer: Buffer::<Channels, _> = Buffer::new(2, 4);
    ///
    /// buffer.channels().for_each(|ch| assert_eq!(&[0.0f32; 4], ch.samples()));
    /// ```
    pub fn new(channels: usize, blocksize: usize) -> Self {
        let samples = vec![F::default(); channels * blocksize];
        Self {
            samples: samples.into_boxed_slice(),
            channels,
            blocksize,
            _storage: PhantomData,
        }
    }
}

impl<'a, F, S: StoragePattern> Buffer<S, &'a [F]> {
    /// Create a new buffer holding a reference to read-only data allocated externally.
    ///
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let data = [0.0f32; 8];
    /// let buffer: Buffer::<Channels, _> = Buffer::new_ref(2, 4, &data);
    ///
    /// buffer.channels().for_each(|ch| assert_eq!(&[0.0; 4], ch.samples()));
    /// ```
    ///
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let data = vec![0.0f32; 8];
    /// let buffer: Buffer::<Channels, _> = Buffer::new_ref(2, 4, &data);
    ///
    /// buffer.channels().for_each(|ch| assert_eq!(&[0.0; 4], ch.samples()));
    /// ```
    pub fn new_ref(channels: usize, blocksize: usize, samples: &'a [F]) -> Self {
        assert_eq!(channels * blocksize, samples.len());
        Self {
            samples,
            channels,
            blocksize,
            _storage: PhantomData,
        }
    }
}

impl<'a, F, S: StoragePattern> Buffer<S, &'a mut [F]> {
    /// Create a new buffer holding a mutable reference to data allocated externally
    ///
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let mut data = [0.0f32; 8];
    /// let mut buffer: Buffer::<Channels, _> = Buffer::new_mut(2, 4, &mut data);
    ///
    /// buffer += 1.0;
    /// buffer.channels().for_each(|ch| assert_eq!(&[1.0; 4], ch.samples()));
    /// ```
    ///
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let mut data = vec![0.0f32; 8];
    /// let mut buffer: Buffer::<Channels, _> = Buffer::new_mut(2, 4, &mut data);
    ///
    /// buffer += 1.0;
    /// buffer.channels().for_each(|ch| assert_eq!(&[1.0; 4], ch.samples()));
    /// ```
    pub fn new_mut(channels: usize, blocksize: usize, samples: &'a mut [F]) -> Self {
        assert_eq!(channels * blocksize, samples.len());
        Self {
            samples,
            channels,
            blocksize,
            _storage: PhantomData,
        }
    }
}

impl<S: StoragePattern, C: MutableContainer> Buffer<S, C> {
    /// Create a new buffer from mutable data allocated externally (taking ownership).
    ///
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let data: Vec<f32> = vec![0.0f32; 8];
    /// let buffer: Buffer::<Channels, _> = Buffer::new_from(2, 4, data);
    ///
    /// buffer.channels().for_each(|ch| assert_eq!(&[0.0; 4], ch.samples()));
    /// ```
    ///
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let data: Box<[f32]> = vec![0.0f32; 8].into_boxed_slice();
    /// let buffer: Buffer::<Interleaved, _> = Buffer::new_from(2, 4, data);
    ///
    /// buffer.frames().for_each(|frame| assert_eq!(&[0.0; 2], frame));
    /// ```
    pub fn new_from(channels: usize, blocksize: usize, samples: C) -> Self {
        assert_eq!(channels * blocksize, samples.as_ref().len());
        Self {
            samples,
            channels,
            blocksize,
            _storage: PhantomData,
        }
    }
}

impl<'a, F> Buffer<Mono, &'a [F]> {
    /// Create a new mono buffer with borrowed samples.
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let data = vec![0.0f32; 8];
    /// let buffer = Buffer::mono_ref(&data);
    ///
    /// assert_eq!(&[0.0; 8], buffer.samples());
    /// ```
    pub fn mono_ref(samples: &'a [F]) -> Self {
        let len = samples.len();
        Self {
            samples,
            channels: 1,
            blocksize: len,
            _storage: PhantomData,
        }
    }
}

impl<'a, F> Buffer<Mono, &'a mut [F]> {
    /// Create a new mono buffer with mutably borrowed samples.
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let mut data: Box<[f32]> = vec![0.0f32; 8].into_boxed_slice();
    /// let mut buffer = Buffer::mono_mut(&mut data);
    /// buffer += 1.0;
    /// assert_eq!(&[1.0; 8], &data.as_ref());
    /// ```
    pub fn mono_mut(samples: &'a mut [F]) -> Self {
        let len = samples.len();
        Self {
            samples,
            channels: 1,
            blocksize: len,
            _storage: PhantomData,
        }
    }
}

impl<S: StoragePattern, C: Container> Buffer<S, C> {
    /// Get a reference to all samples in the buffer.
    ///
    /// Whether they are interleaved or not depends on the buffer's type.
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let mut buffer1: Buffer::<Channels, _> = Buffer::new(2, 2);
    ///
    /// buffer1.channels_mut().enumerate().for_each(|(n, mut ch)| ch += n as f32);
    /// assert_eq!(&[0.0f32, 0.0, 1.0, 1.0], buffer1.samples());
    ///
    /// let mut buffer2: Buffer::<Interleaved, _> = Buffer::new(2, 2);
    /// buffer2.convert_from(&buffer1);
    ///
    /// assert_eq!(&[0.0f32, 1.0, 0.0, 1.0], buffer2.samples());
    /// ```
    pub fn samples(&self) -> &[C::Item] {
        self.samples.as_ref()
    }
}

impl<S: StoragePattern, C: MutableContainer> Buffer<S, C> {
    /// Get a mutable reference to all samples in the buffer.
    ///
    /// Whether they are interleaved or not depends on the buffer's type.
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let mut buffer: Buffer::<Channels, _> = Buffer::new(2, 2);
    ///
    /// buffer.samples_mut().copy_from_slice(&[0.0, 1.0, 2.0, 3.0]);
    ///
    /// assert_eq!(&[0.0, 1.0], buffer.left().unwrap().samples());
    /// assert_eq!(&[2.0, 3.0], buffer.right().unwrap().samples());
    /// ```
    pub fn samples_mut(&mut self) -> &mut [C::Item] {
        self.samples.as_mut()
    }
}

// TODO: maybe this is a bit naughty?
#[doc(hidden)]
impl<C: Container> Deref for Buffer<Mono, C> {
    type Target = [C::Item];

    fn deref(&self) -> &Self::Target {
        self.samples()
    }
}

#[doc(hidden)]
impl<C: MutableContainer> DerefMut for Buffer<Mono, C> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        self.samples_mut()
    }
}

impl<C> Buffer<Mono, C>
where
    C: Container,
    C::Item: Lerp + Copy,
{
    /// Get sample value by partial index using linear interpolation
    pub fn index_lerp(&self, index: f32) -> C::Item {
        let (index0, index1, alpha) =
            crate::interpolation::partial_index(index, self.blocksize as f32);

        let samples = self.samples.as_ref();

        let a = samples[index0];
        let b = samples[index1];
        Lerp::lerp(a, b, alpha)
    }
}

impl<C> Buffer<Interleaved, C>
where
    C: Container,
    C::Item: Lerp + Copy,
{
    /// Get sample values by partial index using linear interpolation
    ///
    /// Returns an iterator over the partial value for each channel.
    pub fn index_lerp(&self, index: f32) -> impl Iterator<Item = C::Item> + use<'_, C> {
        let (index0, index1, alpha) =
            crate::interpolation::partial_index(index, self.blocksize as f32);

        let frame0 = &self.samples.as_ref()[index0 * self.blocksize..index1 * self.blocksize];
        let frame1 = &self.samples.as_ref()[index1 * self.blocksize..index1 * self.blocksize];

        let mut i = 0;
        core::iter::from_fn(move || {
            let ret = if i >= self.blocksize {
                None
            } else {
                Some(Lerp::lerp(frame0[i], frame1[i], alpha))
            };
            i += 1;
            ret
        })
    }
}

impl<C: Container> Buffer<Interleaved, C> {
    /// Get an iterator over the samples for each frame
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let buffer: Buffer::<Interleaved, _> = Buffer::new(2, 32);
    ///
    /// buffer.frames().for_each(|frame| assert_eq!(&[0.0; 2], frame));
    /// ```
    pub fn frames(&self) -> impl Iterator<Item = &[C::Item]> {
        self.samples.as_ref().chunks_exact(self.channels)
    }
}
impl<C: MutableContainer> Buffer<Interleaved, C> {
    /// Get a mutable iterator over the samples for each frame
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let mut buffer: Buffer::<Interleaved, _> = Buffer::new(2, 2);
    ///
    /// buffer.frames_mut().for_each(|frame| frame.copy_from_slice(&[1.0, 2.0]));
    ///
    /// assert_eq!(&[1.0f32, 2.0, 1.0, 2.0], buffer.samples());
    /// ```
    pub fn frames_mut(&mut self) -> impl Iterator<Item = &mut [C::Item]> {
        self.samples.as_mut().chunks_exact_mut(self.channels)
    }
}

impl<C: Container> Buffer<Channels, C> {
    /// Get an iterator over the samples for each channel
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let buffer: Buffer::<Channels, _> = Buffer::new(2, 4);
    ///
    /// buffer.channels().for_each(|ch| assert_eq!(&[0.0; 4], ch.samples()));
    /// ```
    pub fn channels(&self) -> impl Iterator<Item = Buffer<Mono, &[C::Item]>> {
        self.samples
            .as_ref()
            .chunks(self.blocksize)
            .map(Buffer::mono_ref)
    }

    /// Get the samples in the left channel as a readonly mono buffer
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let buffer: Buffer::<Channels, _> = Buffer::new(2, 4);
    ///
    /// assert!(buffer.left().is_some());
    /// if let Some(left) = buffer.left() {
    ///     assert_eq!(&[0.0; 4], left.samples())
    /// }
    /// ```
    pub fn left(&self) -> Option<Buffer<Mono, &[C::Item]>> {
        self.channels().take(1).next()
    }

    /// Get the samples in the right channel as a readonly mono buffer
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let buffer: Buffer::<Channels, _> = Buffer::new(2, 4);
    ///
    /// assert!(buffer.right().is_some());
    /// if let Some(right) = buffer.right() {
    ///     assert_eq!(&[0.0; 4], right.samples())
    /// }
    /// ```
    ///
    /// None will be returned if the buffer doesn't have at least 2 channels
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let buffer: Buffer::<Channels, Box<[f32]>> = Buffer::new(1, 4);
    ///
    /// assert!(buffer.right().is_none());
    /// ```
    pub fn right(&self) -> Option<Buffer<Mono, &[C::Item]>> {
        self.channels().skip(1).take(1).next()
    }
}

impl<C: MutableContainer> Buffer<Channels, C> {
    /// Get a mutable iterator over the samples for each channel
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let mut buffer: Buffer::<Channels, _> = Buffer::new(2, 2);
    ///
    /// buffer.channels_mut().enumerate().for_each(|(n, mut ch)| ch += n as f32);
    /// assert_eq!(&[0.0f32, 0.0, 1.0, 1.0], buffer.samples());
    /// ```
    pub fn channels_mut(&mut self) -> impl Iterator<Item = Buffer<Mono, &mut [C::Item]>> {
        self.samples
            .as_mut()
            .chunks_mut(self.blocksize)
            .map(Buffer::mono_mut)
    }

    /// Get the samples in the left channel as a mutable mono buffer
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let mut buffer: Buffer::<Channels, _> = Buffer::new(2, 4);
    ///
    /// if let Some(mut left) = buffer.left_mut() {
    ///     left.samples_mut().fill(1.0);
    /// }
    /// assert_eq!(&[1.0f32, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0], buffer.samples());
    /// ```
    pub fn left_mut(&mut self) -> Option<Buffer<Mono, &mut [C::Item]>> {
        self.channels_mut().take(1).next()
    }

    /// Get the samples in the right channel as a mutable mono buffer
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let mut buffer: Buffer::<Channels, _> = Buffer::new(2, 4);
    ///
    /// if let Some(mut right) = buffer.right_mut() {
    ///     right.samples_mut().fill(1.0);
    /// }
    /// assert_eq!(&[0.0f32, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 1.0,], buffer.samples());
    /// ```
    pub fn right_mut(&mut self) -> Option<Buffer<Mono, &mut [C::Item]>> {
        self.channels_mut().skip(1).take(1).next()
    }
}

impl<F2, S, C> ConvertFrom<&[F2]> for Buffer<S, C>
where
    C: MutableContainer,
    C::Item: ConvertFrom<F2>,
    S: StoragePattern,
    F2: Copy,
{
    /// Convert from a slice of data - the storage type is assumed to be the same
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let data = [i32::MIN, 0, i32::MAX, 0, i32::MIN, 0, i32::MAX, 0];
    /// let mut buffer: Buffer::<Channels, Box<[f32]>> = Buffer::new(2, 4);
    /// buffer.convert_from(&data[..]);
    ///
    /// assert_eq!(&[-1.0, 0.0, 1.0, 0.0, -1.0, 0.0, 1.0, 0.0], buffer.samples());
    /// ```
    fn convert_from(&mut self, other: &[F2]) {
        assert_eq!(self.samples.as_ref().len(), other.len());
        for (o, i) in self.samples.as_mut().iter_mut().zip(other.iter()) {
            o.convert_from(*i);
        }
    }
}

impl<S, C1, C2> ConvertFrom<&Buffer<S, C2>> for Buffer<S, C1>
where
    S: StoragePattern,
    C1::Item: ConvertFrom<C2::Item>,
    C2::Item: Copy,
    C1: MutableContainer,
    C2: Container,
{
    /// Convert from another buffer with the same storage type (but maybe different sample format)
    /// ```
    /// # use owl_patch::sample_buffer::*;
    /// let data = [i32::MIN, 0, i32::MAX, 0, i32::MIN, 0, i32::MAX, 0];
    /// let buffer1: Buffer::<Channels, _> = Buffer::new_ref(2, 4, &data);
    /// let mut buffer2: Buffer::<Channels, _> = Buffer::new(2, 4);
    ///
    /// buffer2.convert_from(&buffer1);
    ///
    /// assert_eq!(&[-1.0f32, 0.0, 1.0, 0.0, -1.0, 0.0, 1.0, 0.0], buffer2.samples());
    /// ```
    fn convert_from(&mut self, other: &Buffer<S, C2>) {
        self.convert_from(other.samples.as_ref());
    }
}

impl<F, S, C> ConvertFrom<&Buffer<S, C>> for &mut [F]
where
    C::Item: Copy,
    C: Container,
    S: StoragePattern,
    F: ConvertFrom<C::Item>,
{
    /// Convert to a slice of data
    /// ```
    /// # use owl_patch::sample_buffer::*;
    ///
    /// let buffer: Buffer::<Channels, _> = Buffer::new_from(2, 4, vec![-1.0, 0.0, 1.0, 0.0, -1.0, 0.0, 1.0, 0.0]);
    /// let mut output = [0i32; 8];
    /// output.as_mut_slice().convert_from(&buffer);
    ///
    /// assert_eq!([i32::MIN, 0, i32::MAX, 0, i32::MIN, 0, i32::MAX, 0], output);
    /// ```
    fn convert_from(&mut self, other: &Buffer<S, C>) {
        assert_eq!(self.len(), other.samples.as_ref().len());
        for (o, i) in self.iter_mut().zip(other.samples.as_ref().iter()) {
            o.convert_from(*i);
        }
    }
}

//
impl<C1, C2> ConvertFrom<&Buffer<Channels, C2>> for Buffer<Interleaved, C1>
where
    C1: MutableContainer,
    C2: Container,
    C1::Item: ConvertFrom<C2::Item>,
    C2::Item: Copy,
{
    /// Convert from Channels to Interleaved
    /// ```
    /// # use owl_patch::sample_buffer::*;
    ///
    /// let buffer1: Buffer::<Channels, _> = Buffer::new_from(2, 4, vec![-1.0, 0.0, 1.0, 0.0, -1.0, 0.0, 1.0, 0.0]);
    /// let mut buffer2: Buffer::<Interleaved, _> = Buffer::new(2, 4);
    ///
    /// buffer2.convert_from(&buffer1);
    ///
    /// assert_eq!(&[i32::MIN, i32::MIN, 0, 0, i32::MAX, i32::MAX, 0, 0], buffer2.samples());
    /// ```
    fn convert_from(&mut self, other: &Buffer<Channels, C2>) {
        assert_eq!(self.channels, other.channels);
        for (n, ch) in other.channels().enumerate() {
            self.samples
                .as_mut()
                .iter_mut()
                .skip(n)
                .step_by(self.channels)
                .zip(ch.samples())
                .for_each(|(s, os)| s.convert_from(*os));
        }
    }
}

// Interleaved -> Channels
impl<C1, C2> ConvertFrom<&Buffer<Interleaved, C2>> for Buffer<Channels, C1>
where
    C1: MutableContainer,
    C2: Container,
    C1::Item: ConvertFrom<C2::Item>,
    C2::Item: Copy,
{
    /// Convert from Interleaved to Channels
    /// ```
    /// # use owl_patch::sample_buffer::*;
    ///
    /// let buffer1: Buffer::<Interleaved, _> = Buffer::new_from(2, 4, vec![-1.0, -1.0, 0.0, 0.0, 1.0, 1.0, 0.0, 0.0]);
    /// let mut buffer2: Buffer::<Channels, _> = Buffer::new(2, 4);
    ///
    /// buffer2.convert_from(&buffer1);
    ///
    /// assert_eq!(&[i32::MIN, 0, i32::MAX, 0, i32::MIN, 0, i32::MAX, 0], buffer2.samples());
    /// ```
    fn convert_from(&mut self, other: &Buffer<Interleaved, C2>) {
        assert_eq!(self.channels, other.channels);
        for (n, mut ch) in self.channels_mut().enumerate() {
            other
                .samples
                .as_ref()
                .iter()
                .skip(n)
                .step_by(other.channels)
                .zip(ch.samples_mut())
                .for_each(|(os, s)| s.convert_from(*os));
        }
    }
}

macro_rules! impl_op {
    ($assign_trait:ident, $assign_method:ident) => {
        impl<F, S, C> $assign_trait<F> for Buffer<S, C>
        where
            F: $assign_trait<F> + Copy + Default,
            S: StoragePattern,
            C: MutableContainer<Item = F>,
        {
            fn $assign_method(&mut self, rhs: F) {
                for s in self.samples_mut() {
                    (*s).$assign_method(rhs);
                }
            }
        }

        impl<F, S, C1, C2> $assign_trait<&Buffer<S, C2>> for Buffer<S, C1>
        where
            F: $assign_trait<F> + Copy + Default,
            S: StoragePattern,
            C1: MutableContainer<Item = F>,
            C2: Container<Item = F>,
        {
            fn $assign_method(&mut self, rhs: &Buffer<S, C2>) {
                for (s, o) in self.samples_mut().iter_mut().zip(rhs.samples()) {
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

impl<F, S, C> MulAddAssign<F, F> for Buffer<S, C>
where
    F: Copy + Default + MulAddAssign<F>,
    S: StoragePattern,
    C: MutableContainer<Item = F>,
{
    fn mul_add_assign(&mut self, a: F, b: F) {
        for s in self.samples_mut() {
            s.mul_add_assign(a, b);
        }
    }
}

impl<F, S, C1, C2> MulAddAssign<&Buffer<S, C2>, F> for Buffer<S, C1>
where
    Self: for<'a> MulAssign<&'a Buffer<S, C2>> + AddAssign<F>,
    F: Copy + Default,
    S: StoragePattern,
    C1: MutableContainer<Item = F>,
    C2: Container<Item = F>,
{
    fn mul_add_assign(&mut self, a: &Buffer<S, C2>, b: F) {
        self.mul_assign(a);
        self.add_assign(b);
    }
}

impl<F, S, C1, C2> MulAddAssign<F, &Buffer<S, C2>> for Buffer<S, C1>
where
    Self: MulAssign<F> + for<'a> AddAssign<&'a Buffer<S, C2>>,
    F: Copy + Default,
    S: StoragePattern,
    C1: MutableContainer<Item = F>,
    C2: Container<Item = F>,
{
    fn mul_add_assign(&mut self, a: F, b: &Buffer<S, C2>) {
        self.mul_assign(a);
        self.add_assign(b);
    }
}

impl<F, S, C1, C2, C3> MulAddAssign<&Buffer<S, C2>, &Buffer<S, C3>> for Buffer<S, C1>
where
    Self: for<'a> MulAssign<&'a Buffer<S, C2>> + for<'a> AddAssign<&'a Buffer<S, C3>>,
    F: Copy + Default + MulAddAssign<F, F>,
    S: StoragePattern,
    C1: MutableContainer<Item = F>,
    C2: Container<Item = F>,
    C3: Container<Item = F>,
{
    #[inline(never)]
    fn mul_add_assign(&mut self, a: &Buffer<S, C2>, b: &Buffer<S, C3>) {
        // Seems to be faster than doing it in a single loop - on m4 and m7
        self.mul_assign(a);
        self.add_assign(b);
    }
}

impl<F, S, C> Neg for Buffer<S, C>
where
    F: Neg<Output = F> + Copy + Default,
    S: StoragePattern,
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
