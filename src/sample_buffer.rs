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
pub trait SampleStorage {}

/// Samples all from a single channel
pub struct Mono;
impl SampleStorage for Mono {}

/// Samples stored one channel at a time
/// eg: `[l0, l1, l2, ..., r0, r1, r2, ...]`
pub struct Channels;
impl SampleStorage for Channels {}

/// Samples stored interleaved
/// eg: `[l0, r0, l1, r1, l2, r2 ...]`
pub struct Interleaved;
impl SampleStorage for Interleaved {}

/// Sample buffer
pub struct Buffer<F, S: SampleStorage, T> {
    samples: T,
    channels: usize,
    blocksize: usize,
    _storage: PhantomData<S>,
    _format: PhantomData<F>,
}

impl<F: Default + Clone> Buffer<F, Mono, Box<[F]>> {
    /// Create a new mono buffer, with owned samples (allocates)
    pub fn new_mono(blocksize: usize) -> Self {
        let mut samples = Vec::with_capacity(blocksize);

        samples.resize(blocksize, F::default());

        Self {
            samples: samples.into_boxed_slice(),
            channels: 1,
            blocksize,
            _storage: PhantomData,
            _format: PhantomData,
        }
    }
}

impl<F: Default + Clone, S: SampleStorage> Buffer<F, S, Box<[F]>> {
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
            _format: PhantomData,
        }
    }
}

impl<'a, F, S: SampleStorage> Buffer<F, S, &'a [F]> {
    /// Create a new buffer holding a reference to data allocated externally, read-only
    pub fn new_ref<T: AsRef<[F]>>(channels: usize, blocksize: usize, samples: &'a T) -> Self {
        assert_eq!(channels * blocksize, samples.as_ref().len());
        Self {
            samples: samples.as_ref(),
            channels,
            blocksize,
            _storage: PhantomData,
            _format: PhantomData,
        }
    }
}

impl<'a, F, S: SampleStorage> Buffer<F, S, &'a mut [F]> {
    /// Create a new buffer holding a reference to mutable data allocated externally
    pub fn new_mut<T: AsMut<[F]>>(channels: usize, blocksize: usize, samples: &'a mut T) -> Self {
        assert_eq!(channels * blocksize, samples.as_mut().len());
        Self {
            samples: samples.as_mut(),
            channels,
            blocksize,
            _storage: PhantomData,
            _format: PhantomData,
        }
    }
}

impl<F, T: AsRef<[F]>> Buffer<F, Mono, T> {
    /// Create a new mono buffer with borrowed samples
    pub fn mono_ref(samples: T) -> Self {
        let len = samples.as_ref().len();
        Self {
            samples,
            channels: 1,
            blocksize: len,
            _storage: PhantomData,
            _format: PhantomData,
        }
    }
}

impl<F, T: AsMut<[F]> + AsRef<[F]>> Buffer<F, Mono, T> {
    /// Create a new mono buffer with mutably borrowed samples
    pub fn mono_mut(samples: T) -> Self {
        let len = samples.as_ref().len();
        Self {
            samples,
            channels: 1,
            blocksize: len,
            _storage: PhantomData,
            _format: PhantomData,
        }
    }
}

impl<F, S: SampleStorage, T: AsRef<[F]>> Buffer<F, S, T> {
    /// Get a reference to all samples in the buffer
    /// Whether they are interleaved or not depends on the buffer's type
    pub fn samples(&self) -> &[F] {
        self.samples.as_ref()
    }
}

impl<F, S: SampleStorage, T: AsMut<[F]>> Buffer<F, S, T> {
    /// Get a mutable reference to all samples in the buffer
    /// Whether they are interleaved or not depends on the buffer's type
    pub fn samples_mut(&mut self) -> &mut [F] {
        self.samples.as_mut()
    }
}

impl<F, T: AsRef<[F]>> Deref for Buffer<F, Mono, T> {
    type Target = [F];

    fn deref(&self) -> &Self::Target {
        self.samples()
    }
}

impl<F, T: AsRef<[F]> + AsMut<[F]>> DerefMut for Buffer<F, Mono, T> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        self.samples_mut()
    }
}

impl<F, T: AsRef<[F]>> Buffer<F, Interleaved, T> {
    /// Get an iterator over the samples for each frame
    pub fn frames(&self) -> impl Iterator<Item = &[F]> {
        self.samples.as_ref().chunks(self.channels)
    }
}
impl<F, T: AsMut<[F]>> Buffer<F, Interleaved, T> {
    /// Get a mutable iterator over the samples for each frame
    pub fn frames_mut(&mut self) -> impl Iterator<Item = &mut [F]> {
        self.samples.as_mut().chunks_mut(self.channels)
    }
}

impl<F, T: AsRef<[F]>> Buffer<F, Channels, T> {
    /// Get an iterator over the samples for each channel
    pub fn channels(&self) -> impl Iterator<Item = Buffer<F, Mono, &[F]>> {
        self.samples
            .as_ref()
            .chunks(self.blocksize)
            .map(|chunk| Buffer::mono_ref(chunk))
    }

    /// Get the samples in the left channel as a readonly mono buffer
    pub fn left(&self) -> Option<Buffer<F, Mono, &[F]>> {
        self.channels().take(1).next()
    }

    /// Get the samples in the right channel as a readonly mono buffer
    pub fn right(&self) -> Option<Buffer<F, Mono, &[F]>> {
        self.channels().skip(1).take(1).next()
    }
}

impl<F, T: AsMut<[F]>> Buffer<F, Channels, T> {
    /// Get a mutable iterator over the samples for each channel
    pub fn channels_mut(&mut self) -> impl Iterator<Item = Buffer<F, Mono, &mut [F]>> {
        self.samples
            .as_mut()
            .chunks_mut(self.blocksize)
            .map(|chunk| Buffer::mono_mut(chunk))
    }

    /// Get the samples in the left channel as a mutable mono buffer
    pub fn left_mut(&mut self) -> Option<Buffer<F, Mono, &mut [F]>> {
        self.channels_mut().take(1).next()
    }

    /// Get the samples in the right channel as a mutable mono buffer
    pub fn right_mut(&mut self) -> Option<Buffer<F, Mono, &mut [F]>> {
        self.channels_mut().skip(1).take(1).next()
    }
}

// Converting from a slice of data - the storage type is assumed to be the same
impl<F1, F2, S, T> ConvertFrom<&[F2]> for Buffer<F1, S, T>
where
    S: SampleStorage,
    F1: ConvertFrom<F2>,
    F2: Copy,
    T: AsRef<[F1]> + AsMut<[F1]>,
{
    fn convert_from(&mut self, other: &[F2]) {
        assert_eq!(self.samples.as_ref().len(), other.len());
        for (o, i) in self.samples.as_mut().iter_mut().zip(other.iter()) {
            o.convert_from(*i);
        }
    }
}

// Converting from same storage type just means running the sample convertion for every sample
impl<F1, F2, S, T1, T2> ConvertFrom<&Buffer<F2, S, T2>> for Buffer<F1, S, T1>
where
    S: SampleStorage,
    F1: ConvertFrom<F2>,
    F2: Copy,
    T1: AsRef<[F1]> + AsMut<[F1]>,
    T2: AsRef<[F2]>,
{
    fn convert_from(&mut self, other: &Buffer<F2, S, T2>) {
        self.convert_from(other.samples.as_ref());
    }
}

// Converting to a slice of data
impl<F1, F2, S, T> ConvertFrom<&Buffer<F2, S, T>> for &mut [F1]
where
    S: SampleStorage,
    F1: ConvertFrom<F2>,
    F2: Copy,
    T: AsRef<[F2]>,
{
    fn convert_from(&mut self, other: &Buffer<F2, S, T>) {
        assert_eq!(self.len(), other.samples.as_ref().len());
        for (o, i) in self.iter_mut().zip(other.samples.as_ref().iter()) {
            o.convert_from(*i);
        }
    }
}

// Channels -> Interleaved
impl<F1, F2, T1, T2> ConvertFrom<&Buffer<F2, Channels, T2>> for Buffer<F1, Interleaved, T1>
where
    F1: ConvertFrom<F2>,
    F2: Copy,
    T1: AsMut<[F1]>,
    T2: AsRef<[F2]>,
{
    fn convert_from(&mut self, other: &Buffer<F2, Channels, T2>) {
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
impl<F1, F2, T1, T2> ConvertFrom<&Buffer<F2, Interleaved, T2>> for Buffer<F1, Channels, T1>
where
    F1: ConvertFrom<F2>,
    F2: Copy,
    T1: AsMut<[F1]>,
    T2: AsRef<[F2]>,
{
    fn convert_from(&mut self, other: &Buffer<F2, Interleaved, T2>) {
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
        impl<F, S, T> $assign_trait<F> for Buffer<F, S, T>
        where
            F: $assign_trait<F> + Copy + Default,
            S: SampleStorage,
            T: AsMut<[F]>,
        {
            fn $assign_method(&mut self, rhs: F) {
                for s in self.samples_mut() {
                    (*s).$assign_method(rhs);
                }
            }
        }

        impl<F, S, T1, T2> $assign_trait<&Buffer<F, S, T2>> for Buffer<F, S, T1>
        where
            F: $assign_trait<F> + Copy + Default,
            S: SampleStorage,
            T1: AsMut<[F]>,
            T2: AsRef<[F]>,
        {
            fn $assign_method(&mut self, rhs: &Buffer<F, S, T2>) {
                for (s, o) in self.samples_mut().iter_mut().zip(rhs.samples()) {
                    (*s).$assign_method(*o);
                }
            }
        }

        impl<F, U, S: SampleStorage, T: AsMut<[F]>> $short_trait<U> for Buffer<F, S, T>
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

impl<F, S, T> MulAddAssign<F, F> for Buffer<F, S, T>
where
    F: Copy + Default + MulAddAssign<F>,
    S: SampleStorage,
    T: AsMut<[F]>,
{
    fn mul_add_assign(&mut self, a: F, b: F) {
        for s in self.samples_mut() {
            s.mul_add_assign(a, b);
        }
    }
}

impl<F, S, T1, T2> MulAddAssign<&Buffer<F, S, T2>, F> for Buffer<F, S, T1>
where
    Self: for<'a> MulAssign<&'a Buffer<F, S, T2>> + AddAssign<F>,
    F: Copy + Default,
    S: SampleStorage,
{
    fn mul_add_assign(&mut self, a: &Buffer<F, S, T2>, b: F) {
        self.mul_assign(a);
        self.add_assign(b);
    }
}

impl<F, S, T1, T2> MulAddAssign<F, &Buffer<F, S, T2>> for Buffer<F, S, T1>
where
    Self: MulAssign<F> + for<'a> AddAssign<&'a Buffer<F, S, T2>>,
    F: Copy + Default,
    S: SampleStorage,
{
    fn mul_add_assign(&mut self, a: F, b: &Buffer<F, S, T2>) {
        self.mul_assign(a);
        self.add_assign(b);
    }
}

impl<F, S, T1, T2, T3> MulAddAssign<&Buffer<F, S, T2>, &Buffer<F, S, T3>> for Buffer<F, S, T1>
where
    Self: for<'a> MulAssign<&'a Buffer<F, S, T2>> + for<'a> AddAssign<&'a Buffer<F, S, T3>>,
    F: Copy + Default + MulAddAssign<F, F>,
    S: SampleStorage,
{
    #[inline(never)]
    fn mul_add_assign(&mut self, a: &Buffer<F, S, T2>, b: &Buffer<F, S, T3>) {
        // Seems to be faster than doing it in a single loop - on m4 and m7
        self.mul_assign(a);
        self.add_assign(b);
    }
}

impl<F, F1, F2, S, T> MulAdd<F1, F2> for Buffer<F, S, T>
where
    Self: MulAddAssign<F1, F2>,
    S: SampleStorage,
{
    type Output = Self;
    fn mul_add(mut self, a: F1, b: F2) -> Self::Output {
        self.mul_add_assign(a, b);
        self
    }
}

impl<F, S, T> Neg for Buffer<F, S, T>
where
    F: Neg<Output = F> + Copy + Default,
    S: SampleStorage,
    T: AsMut<[F]>,
{
    type Output = Self;

    fn neg(mut self) -> Self::Output {
        for s in self.samples_mut() {
            *s = s.neg();
        }

        self
    }
}
