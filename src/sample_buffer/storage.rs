//! Audio Sample Storage types

use alloc::boxed::Box;
use alloc::vec;
use core::ops::{Index, IndexMut};

use super::*;

pub trait Storage {
    type Item;
    fn samples(&self) -> impl Iterator<Item = &Self::Item>;
}

pub trait StorageMut: Storage {
    fn samples_mut(&mut self) -> impl Iterator<Item = &mut Self::Item>;
}

/// Single channel sample storage
pub struct Mono<C: Container> {
    samples: C,
}

impl<T: Default + Clone> Mono<Box<[T]>> {
    pub(crate) fn new(blocksize: usize) -> Self {
        vec![T::default(); blocksize].into_boxed_slice().into()
    }
}

impl<C: Container> Storage for Mono<C> {
    type Item = C::Item;
    fn samples(&self) -> impl Iterator<Item = &Self::Item> {
        self.samples.as_ref().iter()
    }
}

impl<C: MutableContainer> StorageMut for Mono<C> {
    fn samples_mut(&mut self) -> impl Iterator<Item = &mut Self::Item> {
        self.samples.as_mut().iter_mut()
    }
}

impl<C1, C2> ConvertFrom<&Mono<C1>> for Mono<C2>
where
    C1: Container,
    C2: MutableContainer,
    C2::Item: ConvertFrom<C1::Item>,
    C1::Item: Copy,
{
    fn convert_from(&mut self, other: &Mono<C1>) {
        for (s1, s2) in self.samples_mut().zip(other.samples()) {
            s1.convert_from(*s2)
        }
    }
}

impl<C: Container> From<C> for Mono<C> {
    fn from(samples: C) -> Self {
        Self { samples }
    }
}

impl<C: Container> Index<usize> for Mono<C> {
    type Output = C::Item;

    fn index(&self, index: usize) -> &Self::Output {
        &self.samples.as_ref()[index]
    }
}

impl<C: MutableContainer> IndexMut<usize> for Mono<C> {
    fn index_mut(&mut self, index: usize) -> &mut C::Item {
        &mut self.samples.as_mut()[index]
    }
}

impl<C: Container> Mono<C> {
    /// Number of samples
    pub fn len(&self) -> usize {
        self.samples.as_ref().len()
    }

    /// Is the buffer empty?
    pub fn is_empty(&self) -> bool {
        self.samples.as_ref().is_empty()
    }

    /// Get all samples as a slice
    pub fn as_slice(&self) -> &[C::Item] {
        self.samples.as_ref()
    }
}
impl<C: MutableContainer> Mono<C> {
    /// Get all samples as a mutable slice
    pub fn as_slice_mut(&mut self) -> &mut [C::Item] {
        self.samples.as_mut()
    }
}

impl<C: MutableContainer> Mono<C>
where
    C::Item: Clone,
{
    /// Fill buffer with the given value
    pub fn fill(&mut self, value: C::Item) {
        self.samples.as_mut().fill(value);
    }
}

impl<C> Clone for Mono<C>
where
    C: Container + Clone,
{
    fn clone(&self) -> Self {
        Self {
            samples: self.samples.clone(),
        }
    }
}

/// Samples stored one channel at a time: [l0, l1, l3, ... r0, r1, r2, ...]
pub struct Channels<C: Container> {
    channels: Box<[Buffer<Mono<C>>]>,
}

impl<C: Container> Storage for Channels<C> {
    type Item = C::Item;
    fn samples(&self) -> impl Iterator<Item = &Self::Item> {
        self.channels().flat_map(|ch| ch.storage.samples())
    }
}

impl<C: MutableContainer> StorageMut for Channels<C> {
    fn samples_mut(&mut self) -> impl Iterator<Item = &mut Self::Item> {
        self.channels_mut().flat_map(|ch| ch.storage.samples_mut())
    }
}

impl<C: Container> Channels<C> {
    pub(crate) fn channels(&self) -> impl ExactSizeIterator<Item = &Buffer<Mono<C>>> {
        self.channels.iter()
    }

    pub(crate) fn get(&self, index: usize) -> Option<&Buffer<Mono<C>>> {
        self.channels.get(index)
    }
}

impl<C: MutableContainer> Channels<C> {
    pub(crate) fn channels_mut(&mut self) -> impl ExactSizeIterator<Item = &mut Buffer<Mono<C>>> {
        self.channels.iter_mut()
    }

    pub(crate) fn get_mut(&mut self, index: usize) -> Option<&mut Buffer<Mono<C>>> {
        self.channels.get_mut(index)
    }
}

impl<'a, T> Channels<&'a [T]> {
    pub(crate) fn new_ref(samples: &'a [T], nchannels: usize) -> Self {
        let blocksize = samples.as_ref().len() / nchannels;
        let channels = samples
            .chunks(blocksize)
            .map(|chunk| MonoBufferRef::new(chunk))
            .collect();
        Self { channels }
    }
}

impl<'a, T> Channels<&'a mut [T]> {
    pub(crate) fn new_mut(samples: &'a mut [T], nchannels: usize) -> Self {
        let blocksize = samples.as_ref().len() / nchannels;
        let channels = samples
            .chunks_mut(blocksize)
            .map(|chunk| MonoBufferMut::new(chunk))
            .collect();
        Self { channels }
    }
}

impl<T: Default + Clone> Channels<Box<[T]>> {
    pub(crate) fn new(nchannels: usize, blocksize: usize) -> Self {
        Self {
            channels: (0..nchannels).map(|_| MonoBuffer::new(blocksize)).collect(),
        }
    }
}

impl<C: Container> Index<usize> for Channels<C> {
    type Output = Buffer<Mono<C>>;

    fn index(&self, index: usize) -> &Self::Output {
        &self.channels[index]
    }
}

impl<C: Container> IndexMut<usize> for Channels<C> {
    fn index_mut(&mut self, index: usize) -> &mut <Self as Index<usize>>::Output {
        &mut self.channels[index]
    }
}

impl<C1, C2> ConvertFrom<&Channels<C1>> for Channels<C2>
where
    C1: Container,
    C2: MutableContainer,
    C2::Item: ConvertFrom<C1::Item>,
    C1::Item: Copy,
{
    fn convert_from(&mut self, other: &Channels<C1>) {
        for (s1, s2) in self.samples_mut().zip(other.samples()) {
            s1.convert_from(*s2)
        }
    }
}

impl<C> Clone for Channels<C>
where
    C: Container,
    Buffer<Mono<C>>: Clone,
{
    fn clone(&self) -> Self {
        Self {
            channels: self.channels.clone(),
        }
    }
}

/// Samples stored interleaved [l0, r0, l1, r1, l2, r2, ...]
pub struct Interleaved<C: Container> {
    frames: Box<[Frame<C>]>,
}

impl<T: Default + Clone> Interleaved<Box<[T]>> {
    pub(crate) fn new(nchannels: usize, blocksize: usize) -> Self {
        Self {
            frames: (0..blocksize).map(|_| Frame::new(nchannels)).collect(),
        }
    }
}

impl<C: Container> Storage for Interleaved<C> {
    type Item = C::Item;
    fn samples(&self) -> impl Iterator<Item = &Self::Item> {
        self.frames().flat_map(|frame: &Frame<C>| frame.samples())
    }
}

impl<C: MutableContainer> StorageMut for Interleaved<C> {
    fn samples_mut(&mut self) -> impl Iterator<Item = &mut Self::Item> {
        self.frames_mut().flat_map(|frame| frame.samples_mut())
    }
}

impl<'a, T> Interleaved<&'a [T]> {
    pub(crate) fn new_ref(samples: &'a [T], nchannels: usize) -> Self {
        let frames = samples
            .chunks(nchannels)
            .map(|chunk| chunk.into())
            .collect();
        Self { frames }
    }
}

impl<'a, T> Interleaved<&'a mut [T]> {
    pub(crate) fn new_mut(samples: &'a mut [T], nchannels: usize) -> Self {
        let frames = samples
            .chunks_mut(nchannels)
            .map(|chunk| chunk.into())
            .collect();
        Self { frames }
    }
}

impl<C: Container> Interleaved<C> {
    pub(crate) fn frames(&self) -> impl ExactSizeIterator<Item = &Frame<C>> {
        self.frames.iter()
    }
}

impl<C: MutableContainer> Interleaved<C> {
    pub(crate) fn frames_mut(&mut self) -> impl ExactSizeIterator<Item = &mut Frame<C>> {
        self.frames.iter_mut()
    }
}

impl<C: Container> Index<usize> for Interleaved<C> {
    type Output = Frame<C>;

    fn index(&self, index: usize) -> &Self::Output {
        &self.frames[index]
    }
}

impl<C: MutableContainer> IndexMut<usize> for Interleaved<C> {
    fn index_mut(&mut self, index: usize) -> &mut Frame<C> {
        &mut self.frames[index]
    }
}

impl<C> Clone for Interleaved<C>
where
    C: Container,
    Frame<C>: Clone,
{
    fn clone(&self) -> Self {
        Self {
            frames: self.frames.clone(),
        }
    }
}

impl<C1, C2> ConvertFrom<&Interleaved<C1>> for Interleaved<C2>
where
    C1: Container,
    C2: MutableContainer,
    C2::Item: ConvertFrom<C1::Item>,
    C1::Item: Copy,
{
    fn convert_from(&mut self, other: &Interleaved<C1>) {
        for (s1, s2) in self.samples_mut().zip(other.samples()) {
            s1.convert_from(*s2)
        }
    }
}

impl<C1, C2> ConvertFrom<&Channels<C2>> for Interleaved<C1>
where
    C1: MutableContainer,
    C2: Container,
    <Interleaved<C1> as Storage>::Item: ConvertFrom<<Channels<C2> as Storage>::Item>,
    <Channels<C2> as Storage>::Item: Copy,
{
    fn convert_from(&mut self, other: &Channels<C2>) {
        for (n, ch) in other.channels().enumerate() {
            for (frame, s) in self.frames_mut().zip(ch.storage.samples()) {
                frame[n].convert_from(*s)
            }
        }
    }
}

impl<C1, C2> ConvertFrom<&Interleaved<C2>> for Channels<C1>
where
    C1: MutableContainer,
    C2: Container,
    <Channels<C1> as Storage>::Item: ConvertFrom<<Interleaved<C2> as Storage>::Item>,
    <Interleaved<C2> as Storage>::Item: Copy,
{
    fn convert_from(&mut self, other: &Interleaved<C2>) {
        for (n, ch) in self.channels_mut().enumerate() {
            for (frame, s) in other.frames().zip(ch.storage.samples_mut()) {
                s.convert_from(frame[n]);
            }
        }
    }
}
