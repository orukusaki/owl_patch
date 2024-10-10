//! Audio Sample Buffers
//!
//! Buffers to store audio samples during processing.
//!

extern crate alloc;

use core::{
    marker::PhantomData,
    ops::{
        Add, AddAssign, Deref, DerefMut, Div, DivAssign, Mul, MulAssign, Neg, Rem, RemAssign, Sub,
        SubAssign,
    },
};

use alloc::{boxed::Box, vec::Vec};
use num_traits::{MulAdd, MulAddAssign};

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

/// Auto implementation
impl<B, T> ConvertTo<T> for B
where
    for<'a> T: ConvertFrom<&'a B>,
{
    fn convert_to(&self, other: &mut T) {
        other.convert_from(self)
    }
}

impl ConvertFrom<i32> for f32 {
    /// Convertion to float, so that i32::MAX => 1.0 and i32::MIN => -1.0
    fn convert_from(&mut self, other: i32) {
        const MUL: f32 = 1.0 / (0x80000000i64 as f32);
        *self = other as f32 * MUL
    }
}

impl ConvertFrom<f32> for i32 {
    /// Convertion from float, so that 1.0 => i32::MAX and -1.0 => i32::MIN
    fn convert_from(&mut self, other: f32) {
        const MUL: f32 = 0x80000000i64 as f32;
        *self = (other * MUL) as i32
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

/// Container type for samples, but it's mutable
pub trait MutableContainer: Container + AsMut<[Self::Item]> {}

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

impl<T> MutableContainer for &mut [T] {}
impl<T> MutableContainer for Box<[T]> {}
impl<T> MutableContainer for Vec<T> {}

/// Sample buffer
///
/// ### Type params:
///
/// * S: Describes how the samples are stored, see [StoragePattern]
/// * C: [Container] or [MutableContainer] type for samples.
///   * C::Item Can be any of data, but [i32] and [f32] are the ones you'll most likely want to use. If using [f32], the signal should be kept between -1.0 and 1.0. Anything outside
///     of this will be clipped during conversion. The range for [i32] is [i32::MIN]..[i32::MAX]
pub struct Buffer<S: StoragePattern, C: Container> {
    samples: C,
    channels: usize,
    blocksize: usize,
    _storage: PhantomData<S>,
}

impl<F: Default + Clone> Buffer<Mono, Box<[F]>> {
    /// Create a new mono buffer, with owned samples (allocates)
    pub fn new_mono(blocksize: usize) -> Self {
        let mut samples = Vec::with_capacity(blocksize);

        samples.resize(blocksize, F::default());

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
    pub fn new(channels: usize, blocksize: usize) -> Self {
        let len = channels * blocksize;
        let mut samples = Vec::with_capacity(len);

        samples.resize(len, F::default());

        Self {
            samples: samples.into_boxed_slice(),
            channels,
            blocksize,
            _storage: PhantomData,
        }
    }
}

impl<'a, F, S: StoragePattern> Buffer<S, &'a [F]> {
    /// Create a new buffer holding a reference to data allocated externally, read-only
    pub fn new_ref<C: Container<Item = F>>(
        channels: usize,
        blocksize: usize,
        samples: &'a C,
    ) -> Self {
        assert_eq!(channels * blocksize, samples.as_ref().len());
        Self {
            samples: samples.as_ref(),
            channels,
            blocksize,
            _storage: PhantomData,
        }
    }
}

impl<'a, F, S: StoragePattern> Buffer<S, &'a mut [F]> {
    /// Create a new buffer holding a reference to mutable data allocated externally
    pub fn new_mut<C: MutableContainer<Item = F>>(
        channels: usize,
        blocksize: usize,
        samples: &'a mut C,
    ) -> Self {
        assert_eq!(channels * blocksize, samples.as_mut().len());
        Self {
            samples: samples.as_mut(),
            channels,
            blocksize,
            _storage: PhantomData,
        }
    }
}

impl<C: Container> Buffer<Mono, C> {
    /// Create a new mono buffer with borrowed samples
    pub fn mono_ref(samples: C) -> Self {
        let len = samples.as_ref().len();
        Self {
            samples,
            channels: 1,
            blocksize: len,
            _storage: PhantomData,
        }
    }
}

impl<C: MutableContainer> Buffer<Mono, C> {
    /// Create a new mono buffer with mutably borrowed samples
    pub fn mono_mut(samples: C) -> Self {
        let len = samples.as_ref().len();
        Self {
            samples,
            channels: 1,
            blocksize: len,
            _storage: PhantomData,
        }
    }
}

impl<S: StoragePattern, C: Container> Buffer<S, C> {
    /// Get a reference to all samples in the buffer
    /// Whether they are interleaved or not depends on the buffer's type
    pub fn samples(&self) -> &[C::Item] {
        self.samples.as_ref()
    }
}

impl<S: StoragePattern, C: MutableContainer> Buffer<S, C> {
    /// Get a mutable reference to all samples in the buffer
    /// Whether they are interleaved or not depends on the buffer's type
    pub fn samples_mut(&mut self) -> &mut [C::Item] {
        self.samples.as_mut()
    }
}

impl<C: Container> Deref for Buffer<Mono, C> {
    type Target = [C::Item];

    fn deref(&self) -> &Self::Target {
        self.samples()
    }
}

impl<C: MutableContainer> DerefMut for Buffer<Mono, C> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        self.samples_mut()
    }
}

impl<C: Container> Buffer<Interleaved, C> {
    /// Get an iterator over the samples for each frame
    pub fn frames(&self) -> impl Iterator<Item = &[C::Item]> {
        self.samples.as_ref().chunks(self.channels)
    }
}
impl<C: MutableContainer> Buffer<Interleaved, C> {
    /// Get a mutable iterator over the samples for each frame
    pub fn frames_mut(&mut self) -> impl Iterator<Item = &mut [C::Item]> {
        self.samples.as_mut().chunks_mut(self.channels)
    }
}

impl<C: Container> Buffer<Channels, C> {
    /// Get an iterator over the samples for each channel
    pub fn channels(&self) -> impl Iterator<Item = Buffer<Mono, &[C::Item]>> {
        self.samples
            .as_ref()
            .chunks(self.blocksize)
            .map(Buffer::mono_ref)
    }

    /// Get the samples in the left channel as a readonly mono buffer
    pub fn left(&self) -> Option<Buffer<Mono, &[C::Item]>> {
        self.channels().take(1).next()
    }

    /// Get the samples in the right channel as a readonly mono buffer
    pub fn right(&self) -> Option<Buffer<Mono, &[C::Item]>> {
        self.channels().skip(1).take(1).next()
    }
}

impl<C: MutableContainer> Buffer<Channels, C> {
    /// Get a mutable iterator over the samples for each channel
    pub fn channels_mut(&mut self) -> impl Iterator<Item = Buffer<Mono, &mut [C::Item]>> {
        self.samples
            .as_mut()
            .chunks_mut(self.blocksize)
            .map(Buffer::mono_mut)
    }

    /// Get the samples in the left channel as a mutable mono buffer
    pub fn left_mut(&mut self) -> Option<Buffer<Mono, &mut [C::Item]>> {
        self.channels_mut().take(1).next()
    }

    /// Get the samples in the right channel as a mutable mono buffer
    pub fn right_mut(&mut self) -> Option<Buffer<Mono, &mut [C::Item]>> {
        self.channels_mut().skip(1).take(1).next()
    }
}

// Converting from a slice of data - the storage type is assumed to be the same
impl<F2, S, C> ConvertFrom<&[F2]> for Buffer<S, C>
where
    C: MutableContainer,
    C::Item: ConvertFrom<F2>,
    S: StoragePattern,
    F2: Copy,
{
    fn convert_from(&mut self, other: &[F2]) {
        assert_eq!(self.samples.as_ref().len(), other.len());
        for (o, i) in self.samples.as_mut().iter_mut().zip(other.iter()) {
            o.convert_from(*i);
        }
    }
}

// Converting from same storage type just means running the sample convertion for every sample
impl<S, C1, C2> ConvertFrom<&Buffer<S, C2>> for Buffer<S, C1>
where
    S: StoragePattern,
    C1::Item: ConvertFrom<C2::Item>,
    C2::Item: Copy,
    C1: MutableContainer,
    C2: Container,
{
    fn convert_from(&mut self, other: &Buffer<S, C2>) {
        self.convert_from(other.samples.as_ref());
    }
}

// Converting to a slice of data
impl<F, S, C> ConvertFrom<&Buffer<S, C>> for &mut [F]
where
    C::Item: Copy,
    C: Container,
    S: StoragePattern,
    F: ConvertFrom<C::Item>,
{
    fn convert_from(&mut self, other: &Buffer<S, C>) {
        assert_eq!(self.len(), other.samples.as_ref().len());
        for (o, i) in self.iter_mut().zip(other.samples.as_ref().iter()) {
            o.convert_from(*i);
        }
    }
}

// Channels -> Interleaved
impl<C1, C2> ConvertFrom<&Buffer<Channels, C2>> for Buffer<Interleaved, C1>
where
    C1: MutableContainer,
    C2: Container,
    C1::Item: ConvertFrom<C2::Item>,
    C2::Item: Copy,
{
    fn convert_from(&mut self, other: &Buffer<Channels, C2>) {
        assert_eq!(self.channels, other.channels);
        for (n, ch) in other.channels().enumerate() {
            let it = self
                .samples
                .as_mut()
                .iter_mut()
                .skip(n)
                .step_by(self.channels)
                .zip(ch.samples());

            for (s, os) in it {
                s.convert_from(*os);
            }
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
    fn convert_from(&mut self, other: &Buffer<Interleaved, C2>) {
        assert_eq!(self.channels, other.channels);
        for (n, mut ch) in self.channels_mut().enumerate() {
            let it = other
                .samples
                .as_ref()
                .iter()
                .skip(n)
                .step_by(other.channels)
                .zip(ch.samples_mut());

            for (os, s) in it {
                s.convert_from(*os);
            }
        }
    }
}

macro_rules! impl_op {
    ($assign_trait:ident, $assign_method:ident, $short_trait:ident, $short_method:ident) => {
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

        impl<F, U, S: StoragePattern, C: MutableContainer<Item = F>> $short_trait<U>
            for Buffer<S, C>
        where
            Self: $assign_trait<U>,
        {
            type Output = Self;

            fn $short_method(mut self, rhs: U) -> Self::Output {
                self.$assign_method(rhs);
                self
            }
        }
    };
}

impl_op!(AddAssign, add_assign, Add, add);
impl_op!(SubAssign, sub_assign, Sub, sub);
impl_op!(MulAssign, mul_assign, Mul, mul);
impl_op!(DivAssign, div_assign, Div, div);
impl_op!(RemAssign, rem_assign, Rem, rem);

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

impl<F, F1, F2, S, C> MulAdd<F1, F2> for Buffer<S, C>
where
    Self: MulAddAssign<F1, F2>,
    S: StoragePattern,
    C: MutableContainer<Item = F>,
{
    type Output = Self;
    fn mul_add(mut self, a: F1, b: F2) -> Self::Output {
        self.mul_add_assign(a, b);
        self
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
