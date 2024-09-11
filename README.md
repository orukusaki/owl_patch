# Owl Patch

Write Patches in Rust for many [Rebel Technology](https://www.rebeltech.org/) devices based on the Owl2/3 modules.

This repo contains all the foundational pieces needed to start creating patches:
* Communication with the Host OS Firmware (via the ProgramVector)
* Heap memory allocator
* Access to audio io buffers, plus a simple in-memory buffer implementation
* Access to input and output parameters & buttons
* Midi send / receive

## License

Licensed under either of <a href="LICENSE-APACHE">Apache License, Version 2.0</a>
or <a href="LICENSE-MIT">MIT license</a> at your option.

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in this repository by you, as defined in the Apache-2.0 license,
shall be dual licensed as above, without any additional terms or conditions.

> [!NOTE]
> I am in no way affiliated with Rebel Technology. The Owl Platform and associated published code is their copyright.
Use of this software is entirely at your own risk. If by using it you brick your device, I will not be able to help you.

## Getting Started
1. Make sure you have the `thumbv7em-none-eabihf` Rust target installed:
```
rustup target add thumbv7em-none-eabihf
```
2. Install `gcc-arm-none-eabi` and [FirmwareSender](https://github.com/pingdynasty/FirmwareSender/releases). See the instructions on https://github.com/RebelTechnology/OwlProgram for details.
3. Create a new binary package using Cargo, and add this repo as a dependency:
```   
[dependencies]
owl_patch = {git = "https://github.com/orukusaki/owl_patch"}
```
4. Create a `.cargo/config.toml` file:
```
[build]
target = "thumbv7em-none-eabihf"

# For Owl 2
[target.thumbv7em-none-eabihf]
rustflags = [
    "-C", "link-arg=--nmagic",
    "-C", "target-cpu=cortex-m4",
    "-C", "link-arg=-Towl2.ld",
]

# For Owl 3
#[target.thumbv7em-none-eabihf]
#rustflags = [
#    "-C", "link-arg=--nmagic",
#    "-C", "target-cpu=cortex-m7",
#    "-C", "link-arg=-Towl3.ld",
#]
```
5. Copy one of the [examples](examples) into `src/main.rs`
6. Build your patch
```
cargo build --release
```
7. Use `arm-none-eabi-objcopy` to get the final binary:
```
arm-none-eabi-objcopy -O binary target/thumbv7em-none-eabihf/release/<your_patch> target/thumbv7em-none-eabihf/release/<your_patch>.bin
```
9. Use `FirmwareSender` to upload the patch to your device.

## Running the Examples
1. As above, make sure you have `gcc-arm-none-eabi`, `FirmwareSender` and the `thumbv7em-none-eabihf` Rust target installed
2. Check out this repo
3. Run with
```
cargo run --release --example mimimal
```

## Todo:
* Get i/o callibration data using OWL_SERVICE_GET_PARAMETERS service call
* Load resource files with OWL_SERVICE_LOAD_RESOURCE service call
## Maybe pile:
* Get system log / pow tables
* FFT init service calls with OWL_SERVICE_ARM_RFFT_FAST_INIT_F32 and OWL_SERVICE_ARM_CFFT_INIT_F32
* Service version - OWL_SERVICE_VERSION
