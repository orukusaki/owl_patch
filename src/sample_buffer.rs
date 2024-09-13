extern crate alloc;

use core::{
    marker::PhantomData,
    ops::{Deref, DerefMut},
    slice::{Chunks, ChunksMut},
};

use alloc::{boxed::Box, vec::Vec};

pub trait Sample: Copy + Default {
    type BaseType;
    fn new(value: &Self::BaseType) -> Self;
}

#[derive(Clone, Copy, Default)]
#[repr(transparent)]
pub struct Samplei32(i32);
impl Sample for Samplei32 {
    type BaseType = i32;
    fn new(value: &Self::BaseType) -> Self {
        Self(*value)
    }
}

impl Deref for Samplei32 {
    type Target = i32;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

impl DerefMut for Samplei32 {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.0
    }
}

#[derive(Clone, Copy, Default)]
#[repr(transparent)]
// Word-swapped
pub struct Samplew16(i32);
impl Sample for Samplew16 {
    type BaseType = i32;
    fn new(value: &Self::BaseType) -> Self {
        Self(*value)
    }
}

impl Deref for Samplew16 {
    type Target = i32;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

impl DerefMut for Samplew16 {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.0
    }
}

impl Sample for f32 {
    type BaseType = f32;
    fn new(value: &Self::BaseType) -> Self {
        *value
    }
}

impl From<Samplei32> for f32 {
    fn from(value: Samplei32) -> Self {
        const MUL: f32 = 1.0 / (0x80000000i64 as f32);
        (value.0 << 8) as f32 * MUL
    }
}

impl From<f32> for Samplei32 {
    fn from(value: f32) -> Self {
        const MUL: f32 = 0x00800000i64 as f32;
        Samplei32((value * MUL) as i32)
    }
}

impl From<Samplew16> for f32 {
    fn from(value: Samplew16) -> Self {
        const MUL: f32 = 1.0 / (0x80000000i64 as f32);

        let bytes = value.0.to_le_bytes();
        let qint: i32 = i32::from_le_bytes([bytes[2], bytes[3], bytes[0], bytes[1]]);
        qint as f32 * MUL
    }
}

impl From<f32> for Samplew16 {
    fn from(value: f32) -> Self {
        const MUL: f32 = 0x00800000i64 as f32;

        let qint = (value * MUL) as i32;
        let bytes = qint.to_le_bytes();
        Samplew16(i32::from_le_bytes([bytes[2], bytes[3], bytes[0], bytes[1]]))
    }
}

/// Marker trait to indicate how samples are stored in a buffer
pub trait SampleStorage {}

pub struct Channels;

/// Samples stored one channel at a time
/// eg: `[l0, l1, l2, ..., r0, r1, r2, ...]`
impl SampleStorage for Channels {}
pub struct Interleaved;

/// Samples stored interleaved
/// eg: `[l0, r0, l1, r1, l2, r2 ...]`
impl SampleStorage for Interleaved {}

pub struct Buffer<F: Sample, S: SampleStorage> {
    storage: Box<[F]>,
    channels: usize,
    blocksize: usize,
    _storage: PhantomData<S>,
}

impl<F: Sample, S: SampleStorage> Buffer<F, S> {
    pub fn as_ref(&self) -> BufferRef<'_, F, S> {
        BufferRef {
            storage: &self.storage,
            channels: self.channels,
            blocksize: self.blocksize,
            _storage: PhantomData,
        }
    }

    pub fn as_mut(&mut self) -> BufferMut<'_, F, S> {
        BufferMut {
            storage: &mut self.storage,
            channels: self.channels,
            blocksize: self.blocksize,
            _storage: PhantomData,
        }
    }
}

impl<F: Sample, S: SampleStorage> Buffer<F, S> {
    pub fn new(channels: usize, blocksize: usize) -> Buffer<F, S> {
        let len = channels * blocksize;
        let mut storage = Vec::with_capacity(len);

        storage.resize(len, F::default());

        Self {
            storage: storage.into_boxed_slice(),
            channels,
            blocksize,
            _storage: PhantomData,
        }
    }
}

impl<F: Sample> Buffer<F, Channels> {
    pub fn channels(&self) -> Chunks<'_, F> {
        self.storage.chunks(self.blocksize)
    }
}

impl<F: Sample> Buffer<F, Interleaved> {
    pub fn frames(&self) -> Chunks<'_, F> {
        self.storage.chunks(self.channels)
    }
}

impl<F: Sample> Buffer<F, Channels> {
    pub fn channels_mut(&mut self) -> ChunksMut<'_, F> {
        self.storage.chunks_mut(self.blocksize)
    }
}

impl<F: Sample> Buffer<F, Interleaved> {
    pub fn frames_mut(&mut self) -> ChunksMut<'_, F> {
        self.storage.chunks_mut(self.channels)
    }
}

pub struct BufferRef<'a, F: Sample, S: SampleStorage> {
    storage: &'a [F],
    channels: usize,
    blocksize: usize,
    _storage: PhantomData<S>,
}

impl<'a, F: Sample> BufferRef<'a, F, Interleaved> {
    pub fn new(storage: &'a [F], channels: usize, blocksize: usize) -> Self {
        assert_eq!(storage.len(), channels * blocksize);
        Self::new_unchecked(storage, channels, blocksize)
    }
    fn new_unchecked(storage: &'a [F], channels: usize, blocksize: usize) -> Self {
        Self {
            storage,
            channels,
            blocksize,
            _storage: PhantomData,
        }
    }
}

impl<'a, F: Sample> BufferRef<'a, F, Channels> {
    pub fn iter(&self) -> Chunks<'_, F> {
        self.storage.chunks(self.blocksize)
    }
}

impl<'a, F: Sample> BufferRef<'a, F, Interleaved> {
    pub fn iter(&self) -> Chunks<'_, F> {
        self.storage.chunks(self.channels)
    }
}

pub struct BufferMut<'a, F: Sample, S: SampleStorage>
where
    F: 'a,
{
    storage: &'a mut [F],
    channels: usize,
    blocksize: usize,
    _storage: PhantomData<S>,
}

impl<'a, F: Sample> BufferMut<'a, F, Interleaved> {
    pub fn new(storage: &'a mut [F], channels: usize, blocksize: usize) -> Self {
        assert_eq!(storage.len(), channels * blocksize);
        Self::new_unchecked(storage, channels, blocksize)
    }

    fn new_unchecked(storage: &'a mut [F], channels: usize, blocksize: usize) -> Self {
        Self {
            storage,
            channels,
            blocksize,
            _storage: PhantomData,
        }
    }
}

impl<'a, F: Sample> BufferMut<'a, F, Channels> {
    pub fn iter_mut(&mut self) -> ChunksMut<'_, F> {
        self.storage.chunks_mut(self.blocksize)
    }
}

impl<'a, F: Sample> BufferMut<'a, F, Interleaved> {
    pub fn iter_mut(&mut self) -> ChunksMut<'_, F> {
        self.storage.chunks_mut(self.channels)
    }
}

pub trait ConvertFrom<T> {
    fn convert_from(&mut self, other: &T);
}

pub trait ConvertTo<T> {
    fn convert_to(&self, other: &mut T);
}

impl<B, T> ConvertTo<T> for B
where
    T: ConvertFrom<B>,
{
    fn convert_to(&self, other: &mut T) {
        other.convert_from(self)
    }
}

// Converting from same storage type just means running the sample convertion for every sample
impl<'a, F1, F2, S> ConvertFrom<BufferRef<'_, F2, S>> for BufferMut<'a, F1, S>
where
    F1: Sample + From<F2>,
    F2: Sample,
    S: SampleStorage,
{
    fn convert_from(&mut self, other: &BufferRef<F2, S>) {
        assert_eq!(self.storage.len(), other.storage.len());
        for (o, i) in self.storage.iter_mut().zip(other.storage.iter()) {
            *o = (*i).into()
        }
    }
}

// interleave
impl<'a, F: Sample + From<F2>, F2: Sample> ConvertFrom<BufferRef<'_, F2, Channels>>
    for BufferMut<'a, F, Interleaved>
{
    fn convert_from(&mut self, other: &BufferRef<F2, Channels>) {
        assert_eq!(self.channels, other.channels);
        for (n, ch) in other.iter().enumerate() {
            let it = self
                .storage
                .iter_mut()
                .skip(n)
                .step_by(self.channels)
                .zip(ch.iter());

            for (s, os) in it {
                *s = (*os).into();
            }
        }
    }
}

// deinterleave
impl<'a, F: Sample + From<F2>, F2: Sample> ConvertFrom<BufferRef<'_, F2, Interleaved>>
    for BufferMut<'a, F, Channels>
{
    fn convert_from(&mut self, other: &BufferRef<F2, Interleaved>) {
        assert_eq!(self.channels, other.channels);
        for (n, ch) in self.iter_mut().enumerate() {
            let it = other
                .storage
                .iter()
                .skip(n)
                .step_by(other.channels)
                .zip(ch.iter_mut());

            for (os, s) in it {
                *s = (*os).into();
            }
        }
    }
}

// A Buffer can convert from anything that its BufferMut can convert from
impl<F, S, T> ConvertFrom<T> for Buffer<F, S>
where
    for<'a> BufferMut<'a, F, S>: ConvertFrom<T>,
    S: SampleStorage,
    F: Sample,
{
    fn convert_from(&mut self, other: &T) {
        self.as_mut().convert_from(other)
    }
}

// A BufferMut can convert from a Buffer if it can already convert from its BufferRef
impl<'a, F1, S1, F2, S2> ConvertFrom<Buffer<F1, S1>> for BufferMut<'a, F2, S2>
where
    for<'b> BufferRef<'b, F1, S1>: ConvertTo<BufferMut<'a, F2, S2>>,
    S1: SampleStorage,
    F1: Sample,
    S2: SampleStorage,
    F2: Sample,
{
    fn convert_from(&mut self, other: &Buffer<F1, S1>) {
        other.as_ref().convert_to(self);
    }
}
