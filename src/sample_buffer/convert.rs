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
impl<A, B> ConvertTo<B> for A
where
    for<'a> B: ConvertFrom<&'a A>,
{
    fn convert_to(&self, other: &mut B) {
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

impl ConvertFrom<i16> for f32 {
    /// Convertion to float, so that i16::MAX => 1.0 and i16::MIN => -1.0
    fn convert_from(&mut self, other: i16) {
        const MUL: f32 = 1.0 / i16::MAX as f32;
        *self = other as f32 * MUL
    }
}

impl ConvertFrom<f32> for i16 {
    /// Convertion from float, so that 1.0 => i16::MAX and -1.0 => i16::MIN
    fn convert_from(&mut self, other: f32) {
        const MUL: f32 = i16::MAX as f32;
        *self = (other * MUL) as i16
    }
}
