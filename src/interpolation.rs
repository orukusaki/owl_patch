//! Interpolation traits

use num_traits::Euclid;
#[cfg(target_arch = "arm")]
use num_traits::Float as _;

use crate::sample_buffer::{Buffer, Container, Mono};

/// Linear Interpolation
pub trait Lerp {
    /// Interpolate two values, alpha should be between 0.0 and 1.0
    fn lerp(a: Self, b: Self, alpha: f32) -> Self;
}

impl Lerp for f32 {
    fn lerp(a: Self, b: Self, alpha: f32) -> Self {
        a + (b - a) * alpha
    }
}

impl Lerp for i32 {
    fn lerp(a: Self, b: Self, alpha: f32) -> Self {
        let fraction = (alpha * 0x10000 as f32) as i64;
        let partial = ((b as i64 - a as i64) * fraction) >> 16;
        (a as i64 + partial) as i32
    }
}

impl Lerp for i16 {
    fn lerp(a: Self, b: Self, alpha: f32) -> Self {
        let fraction = (alpha * 0x100 as f32) as i32;
        let partial = ((b as i32 - a as i32) * fraction) >> 8;
        (a as i32 + partial) as i16
    }
}

/// Create (from, to, alpha) values from a float index and max length (wrapping)
fn partial_index(index: f32, wrap_len: f32) -> (usize, usize, f32) {
    let f = index.floor();
    let alpha = index - f;

    let index0 = Euclid::rem_euclid(&f, &wrap_len) as usize;
    let index1 = Euclid::rem_euclid(&(f + 1.0), &wrap_len) as usize;

    (index0, index1, alpha)
}

/// Create (y0, y1, y2, y3, alpha) values from a float index and max length (wrapping)
fn quad_index(index: f32, wrap_len: f32) -> (usize, usize, usize, usize, f32) {
    let f = index.floor();
    let alpha = index - f;

    let index0 = Euclid::rem_euclid(&(f - 1.0), &wrap_len) as usize;
    let index1 = Euclid::rem_euclid(&f, &wrap_len) as usize;
    let index2 = Euclid::rem_euclid(&(f + 1.0), &wrap_len) as usize;
    let index3 = Euclid::rem_euclid(&(f + 2.0), &wrap_len) as usize;

    (index0, index1, index2, index3, alpha)
}

/// Cubic Interpolation
pub trait Cubic {
    /// Interpolate between y1 and y2 using cubic interpolation
    fn cubic(y0: Self, y1: Self, y2: Self, y3: Self, alpha: f32) -> Self;
}

impl Cubic for f32 {
    fn cubic(y0: Self, y1: Self, y2: Self, y3: Self, alpha: f32) -> Self {
        let alpha2 = alpha * alpha;
        let alpha3 = alpha2 * alpha;

        let a = -y0 + y1 - y2 + y3;
        let b = 2.0 * y0 - 2.0 * y1 + y2 - y3;
        let c = -y0 + y2;
        let d = y1;
        a * alpha3 + b * alpha2 + c * alpha + d
    }
}

/// CubicSmooth Interpolation
pub trait CubicSmooth {
    /// Interpolate between y1 and y2 using smoothed cubic interpolation. More accurate but slower.
    fn cubic_smooth(y0: Self, y1: Self, y2: Self, y3: Self, alpha: f32) -> Self;
}

impl CubicSmooth for f32 {
    fn cubic_smooth(y0: Self, y1: Self, y2: Self, y3: Self, alpha: f32) -> Self {
        let alpha2 = alpha * alpha;
        let alpha3 = alpha2 * alpha;

        let a = -0.5 * y0 + 1.5 * y1 - 1.5 * y2 + 0.5 * y3;
        let b = y0 - 2.5 * y1 + 2.0 * y2 - 0.5 * y3;
        let c = -0.5 * y0 + 0.5 * y2;
        let d = y1;

        a * alpha3 + b * alpha2 + c * alpha + d
    }
}

/// Linear interpolated index trait
pub trait IndexLerp {
    /// Result type
    type Output;

    /// Get a value by partial index using linear interpolation
    fn index_lerp(&self, index: f32) -> Self::Output;
}

impl<C> IndexLerp for Buffer<Mono<C>>
where
    C: Container,
    C::Item: Lerp + Copy,
{
    type Output = C::Item;

    fn index_lerp(&self, index: f32) -> Self::Output {
        let (index0, index1, alpha) = partial_index(index, self.len() as f32);

        let a = self[index0];
        let b = self[index1];
        Lerp::lerp(a, b, alpha)
    }
}

/// Cubic interpolated index trait
pub trait IndexCubic {
    /// Result type
    type Output;

    /// Get a value by partial index using cubic interpolation
    fn index_cubic(&self, index: f32) -> Self::Output;
}

impl<C> IndexCubic for Buffer<Mono<C>>
where
    C: Container,
    C::Item: Cubic + Copy,
{
    type Output = C::Item;

    fn index_cubic(&self, index: f32) -> Self::Output {
        let (index0, index1, index2, index3, alpha) = quad_index(index, self.len() as f32);

        let a = self[index0];
        let b = self[index1];
        let c = self[index2];
        let d = self[index3];
        Cubic::cubic(a, b, c, d, alpha)
    }
}

/// Cubic smooth interpolated index trait
pub trait IndexCubicSmooth {
    /// Result type
    type Output;

    /// Get a value by partial index using cubic smooth interpolation
    fn index_cubic_smooth(&self, index: f32) -> Self::Output;
}

impl<C> IndexCubicSmooth for Buffer<Mono<C>>
where
    C: Container,
    C::Item: CubicSmooth + Copy,
{
    type Output = C::Item;

    fn index_cubic_smooth(&self, index: f32) -> Self::Output {
        let (index0, index1, index2, index3, alpha) = quad_index(index, self.len() as f32);

        let a = self[index0];
        let b = self[index1];
        let c = self[index2];
        let d = self[index3];
        CubicSmooth::cubic_smooth(a, b, c, d, alpha)
    }
}

#[cfg(test)]
mod tests {

    use super::*;

    #[test]
    fn lerp_f32() {
        assert_eq!(Lerp::lerp(0.0, 1.0, 0.0), 0.0);
        assert_eq!(Lerp::lerp(0.0, 1.0, 1.0), 1.0);
        assert_eq!(Lerp::lerp(0.0, 1.0, 0.5), 0.5);
        assert_eq!(Lerp::lerp(-1.0, 1.0, 0.5), 0.0);
        assert_eq!(Lerp::lerp(10.0, -10.0, 0.25), 5.0);
    }

    #[test]
    fn lerp_i32() {
        assert_eq!(Lerp::lerp(0i32, 100, 0.5), 50);
        assert_eq!(Lerp::lerp(i32::MAX, i32::MAX - 100, 0.5), i32::MAX - 50);
        assert_eq!(Lerp::lerp(i32::MIN, i32::MAX, 0.5), -1);
        assert_eq!(Lerp::lerp(i32::MAX, i32::MIN, 0.5), -1);
        assert_eq!(Lerp::lerp(i32::MAX, i32::MIN, 0.0), i32::MAX);
        assert_eq!(Lerp::lerp(i32::MAX, i32::MIN, 1.0), i32::MIN);
    }

    #[test]
    fn lerp_i16() {
        assert_eq!(Lerp::lerp(0i16, 100, 0.5), 50);
        assert_eq!(Lerp::lerp(i16::MAX, i16::MAX - 100, 0.5), i16::MAX - 50);
        assert_eq!(Lerp::lerp(i16::MIN, i16::MAX, 0.5), -1);
        assert_eq!(Lerp::lerp(i16::MAX, i16::MIN, 0.5), -1);
        assert_eq!(Lerp::lerp(i16::MAX, i16::MIN, 0.0), i16::MAX);
        assert_eq!(Lerp::lerp(i16::MAX, i16::MIN, 1.0), i16::MIN);
    }
}
