# Owl Patch
Write Patches in Rust for many for Rebel Technology devices based on the Owl2/3 modules.

This repo contains all the foundational pieces needed to start creating patches.  It doesn't include
any DSP libraries however, you are free to find / create your own.

## Licence
TODO
Note: I am in no way affiliated with Rebel Technology. The Owl Platform and associated published code is their copyright.
Use of this software is entirely at your own risk. If by using it you brick your device, I will not be able to help you.

## Getting Started
1. Make sure you have the `thumbv7em-none-eabihf` target installed:
    rustup target add thumbv7em-none-eabihf
2. Install `gcc-arm-none-eabi` and FirmwareSender.  See the instructions on https://github.com/RebelTechnology/OwlProgram for details
3. Create a new binary package using Cargo, and add this repo as a dependency:
   
    [dependencies]
    owl_patch = {path="../owl_patch"}

4. Create a `.cargo/config.toml` file:

    [build]
    target = "thumbv7em-none-eabihf"
    
    [target.'cfg(all(target_arch = "arm", target_os = "none"))']
    rustflags = [
        "-C", "link-arg=--nmagic",
        "-C", "target-cpu=cortex-m4",
        "-C", "link-arg=-Towl.ld",
    ]
5. Copy one of the [examples](tree/main/examples) into `src/main.rs`
6. Build your patch
    cargo build --release
7. Use `arm-none-eabi-objcopy` to get the final binary:
    arm-none-eabi-objcopy -O binary target/thumbv7em-none-eabihf/release/<your_patch> target/thumbv7em-none-eabihf/release/<your_patch>.bin
8. Use FirwwareSender to upload the patch to your device.

## Running the Examples
1. As above, make sure you have `gcc-arm-none-eabi`, `FirmwareSender` and the `thumbv7em-none-eabihf` Rust target installed
2. Check out this repo
3. Run with
    cargo run --release --example fundsp

## Todo:
* Get i/o callibration data using OWL_SERVICE_GET_PARAMETERS service call
* Load resource files with OWL_SERVICE_LOAD_RESOURCE service call
## Maybe pile:
* Get system log / pow tables
* FFT init service calls with OWL_SERVICE_ARM_RFFT_FAST_INIT_F32 and OWL_SERVICE_ARM_CFFT_INIT_F32
* Service version - OWL_SERVICE_VERSION