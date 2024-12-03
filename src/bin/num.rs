fn main() {
    println!("1.0: {:x}", 1.0f32.to_bits());
    println!("2.0: {:x}", 2.0f32.to_bits());
    println!("0x3FFFFFFF: {}", f32::from_bits(0x3FFFFFFF));
    println!("0x3F7FFFFF: {}", f32::from_bits(0x3F7FFFFF));
    // const MUL_IN: f32 = 1.0 / (0x80000000u32 as f32); //(2^-31)
    // const MUL_IN: f32 = 2.0f32.powf(-2.0);
    const MUL_OUT: f32 = (1u32 << 31) as f32;
    const MUL_IN: f32 = 1.0 / MUL_OUT;

    println!("MUL_IN: {}, {:x}", MUL_IN, MUL_IN.to_bits());
    println!("MUL_OUT: {}, {:x}", MUL_OUT, MUL_OUT.to_bits());

    // for i in i16::MIN..=i16::MAX {
    //     let s = (i as i32) << 16;
    //     let sf = s as f32 * MUL_IN;

    //     let o = (sf * MUL_OUT) as i32;
    //     let so = (o >> 16) as i16;

    //     if so != i {
    //         println!("{},{}, {:x}, {}, {},", i, sf, sf.to_bits(), o, so);
    //     }
    // }

    // for i in -8388607i32..=8388607 {
    //     let s = (i as i32) << 8;
    //     let sf = s as f32 * MUL_IN;

    //     let o = (sf * MUL_OUT) as i32;
    //     let so = (o >> 8) as i32;

    //     if so != i {
    //         println!("{},{}, {:x}, {}, {},", i, sf, sf.to_bits(), o, so);
    //     }
    // }
}
