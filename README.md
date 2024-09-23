# Owl Patch
Write Patches in [Rust](https://www.rust-lang.org/) for many [Rebel Technology](https://www.rebeltech.org/) devices based on the Owl2/3 modules.

### Note
The authors of this repository are not affiliated with Rebel Technology. The Owl Platform and associated published code is their copyright.

## Getting Started

1. Make sure you have the `thumbv7em-none-eabihf` Rust target installed:
```bash
rustup target add thumbv7em-none-eabihf
```
2. Install `gcc-arm-none-eabi` and [FirmwareSender](<https://github.com/pingdynasty/FirmwareSender/releases>). See the instructions on https://github.com/RebelTechnology/OwlProgram for details.
3. Create a new binary package using Cargo, and add this repo as a dependency:
```toml   
[dependencies]
owl_patch = {git = "https://github.com/orukusaki/owl_patch"}
```
It is also a good idea to add this to your Cargo.toml:
```toml
[profile.release]
strip = "debuginfo"
codegen-units = 1
debug = 2
debug-assertions = false
incremental = false
lto = "fat"
opt-level = "3"
overflow-checks = false

[profile.release.package."*"]
strip = "debuginfo"
opt-level = "3"
```
4. Create a `.cargo/config.toml` file:
```toml
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
```bash
PATCHNAME="Your Patch Name" cargo build --release
```
7. Use `arm-none-eabi-objcopy` to get the final binary:
```bash
arm-none-eabi-objcopy -O binary target/thumbv7em-none-eabihf/release/<your_patch> target/thumbv7em-none-eabihf/release/<your_patch>.bin
```
9. Use `FirmwareSender` to upload the patch to your device.

## Supported devices
The examples in this repo have only been tested on a Befaco Lich using an Owl2 module.  They should work on others too, but I am unable to verify this.  To give you the best chance of success, make sure your device is running the latest Firmware.

## Project state
Experimental. Will probabably always be that way.

### Todo List:

- Get i/o callibration data using OWL_SERVICE_GET_PARAMETERS service call
- Load resource files with OWL_SERVICE_LOAD_RESOURCE service call
- Add example using `cmsis_dsp`
- Add support for display devices

### Maybe pile:

- Get system log / pow tables
- FFT init service calls with OWL_SERVICE_ARM_RFFT_FAST_INIT_F32 and OWL_SERVICE_ARM_CFFT_INIT_F32
- Service version - OWL_SERVICE_VERSION

## License

Licensed under either of <a href="LICENSE-APACHE">Apache License, Version 2.0</a>
or <a href="LICENSE-MIT">MIT license</a> at your option.

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in this repository by you, as defined in the Apache-2.0 license,
shall be dual licensed as above, without any additional terms or conditions.