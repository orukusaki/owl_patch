extern crate alloc;

use core::{
    marker::PhantomData,
    slice::{Chunks, ChunksMut},
};

use alloc::{boxed::Box, vec::Vec};

pub trait ConvertFrom<T: ?Sized> {
    fn convert_from(&mut self, other: T);
}

pub trait ConvertTo<T> {
    fn convert_to(&self, other: &mut T);
}

impl<B, T> ConvertTo<T> for B
where
    for<'a> T: ConvertFrom<&'a B>,
{
    fn convert_to(&self, other: &mut T) {
        other.convert_from(self)
    }
}

#[derive(Clone, Copy, Default)]
#[repr(transparent)]
pub struct Samplew16(i32);

// The C code for 24B16 reads two 16 bit words and swaps them over to create a 32 bit value. I *think* that the codec is
// actually operating in 16 bit mode though, so here we're just doing a 16 bit shift instead.
// The C code for 24B32 does an 8 bit shift, I'm fairly certain it is actually 24 bit.

impl ConvertFrom<i32> for Samplew16 {
    fn convert_from(&mut self, value: i32) {
        self.0 = value << 16
    }
}

impl ConvertFrom<Samplew16> for i32 {
    fn convert_from(&mut self, value: Samplew16) {
        *self = value.0 >> 16;
    }
}

#[derive(Clone, Copy, Default)]
#[repr(transparent)]
pub struct Samplei32(i32);

impl ConvertFrom<i32> for Samplei32 {
    fn convert_from(&mut self, value: i32) {
        self.0 = value << 8;
    }
}

impl ConvertFrom<Samplei32> for i32 {
    fn convert_from(&mut self, value: Samplei32) {
        *self = value.0 >> 8;
    }
}

impl ConvertFrom<i32> for f32 {
    fn convert_from(&mut self, other: i32) {
        const MUL: f32 = 1.0 / (0x00800000 as f32);
        *self = other as f32 * MUL
    }
}

impl ConvertFrom<f32> for i32 {
    fn convert_from(&mut self, other: f32) {
        const MUL: f32 = 0x00800000 as f32;
        *self = (other * MUL) as i32
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

pub struct Buffer<F, S: SampleStorage> {
    storage: Box<[F]>,
    channels: usize,
    blocksize: usize,
    _storage: PhantomData<S>,
}

impl<F: Default + Clone, S: SampleStorage> Buffer<F, S> {
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

impl<F> Buffer<F, Channels> {
    pub fn channels(&self) -> Chunks<'_, F> {
        self.storage.chunks(self.blocksize)
    }
}

impl<F> Buffer<F, Interleaved> {
    pub fn frames(&self) -> Chunks<'_, F> {
        self.storage.chunks(self.channels)
    }
}

impl<F> Buffer<F, Channels> {
    pub fn channels_mut(&mut self) -> ChunksMut<'_, F> {
        self.storage.chunks_mut(self.blocksize)
    }
}

impl<F> Buffer<F, Interleaved> {
    pub fn frames_mut(&mut self) -> ChunksMut<'_, F> {
        self.storage.chunks_mut(self.channels)
    }
}

// Converting from a slice of data
impl<F1: ConvertFrom<F2>, F2: Copy, S> ConvertFrom<&[F2]> for Buffer<F1, S>
where
    S: SampleStorage,
{
    fn convert_from(&mut self, other: &[F2]) {
        assert_eq!(self.storage.len(), other.len());
        for (o, i) in self.storage.iter_mut().zip(other.iter()) {
            o.convert_from(*i);
        }
    }
}

// Converting from same storage type just means running the sample convertion for every sample
impl<F1: ConvertFrom<F2>, F2: Copy, S> ConvertFrom<&Buffer<F2, S>> for Buffer<F1, S>
where
    S: SampleStorage,
{
    fn convert_from(&mut self, other: &Buffer<F2, S>) {
        self.convert_from(other.storage.as_ref());
    }
}

// Converting to a slice of data
impl<F1: ConvertFrom<F2>, F2: Copy, S> ConvertFrom<&Buffer<F2, S>> for &mut [F1]
where
    S: SampleStorage,
{
    fn convert_from(&mut self, other: &Buffer<F2, S>) {
        assert_eq!(self.len(), other.storage.len());
        for (o, i) in self.iter_mut().zip(other.storage.iter()) {
            o.convert_from(*i);
        }
    }
}

// Channels -> Interleaved
impl<F1: ConvertFrom<F2>, F2: Copy> ConvertFrom<&Buffer<F2, Channels>> for Buffer<F1, Interleaved> {
    fn convert_from(&mut self, other: &Buffer<F2, Channels>) {
        assert_eq!(self.channels, other.channels);
        for (n, ch) in other.channels().enumerate() {
            let it = self
                .storage
                .iter_mut()
                .skip(n)
                .step_by(self.channels)
                .zip(ch.iter());

            for (s, os) in it {
                s.convert_from(*os);
            }
        }
    }
}

// Interleaved -> Channels
impl<F1: ConvertFrom<F2>, F2: Copy> ConvertFrom<&Buffer<F2, Interleaved>> for Buffer<F1, Channels> {
    fn convert_from(&mut self, other: &Buffer<F2, Interleaved>) {
        assert_eq!(self.channels, other.channels);
        for (n, ch) in self.channels_mut().enumerate() {
            let it = other
                .storage
                .iter()
                .skip(n)
                .step_by(other.channels)
                .zip(ch.iter_mut());

            for (os, s) in it {
                s.convert_from(*os);
            }
        }
    }
}
