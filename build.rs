use std::env;
use std::fs::copy;
use std::path::{Path, PathBuf};
use std::process::Command;

use bindgen::callbacks::DeriveInfo;

#[derive(Debug)]
struct MyCallback;
impl core::panic::UnwindSafe for MyCallback {}

impl bindgen::callbacks::ParseCallbacks for MyCallback {
    fn add_derives(&self, info: &DeriveInfo<'_>) -> Vec<String> {
        match info.name {
            "PatchParameterId"
            | "PatchButtonId"
            | "OpenWareMidiSysexCommand"
            | "OpenWareMidiControl"
            | "MidiRPN"
            | "OwlProtocol"
            | "UsbMidi"
            | "MidiControlChange"
            | "MidiStatus" => vec!["num_derive::FromPrimitive".to_string()],
            _ => vec![],
        }
    }
}

fn main() {
    println!("cargo:rerun-if-changed=build.rs");
    let out_path = PathBuf::from(env::var("OUT_DIR").unwrap())
        .canonicalize()
        .unwrap();

    if !PathBuf::from("OwlProgram/.git").exists() {
        let _ = Command::new("git")
            .args(["submodule", "update", "--init", "OwlProgram"])
            .status();
    }

    let owl_base_path = PathBuf::from("OwlProgram")
        .canonicalize()
        .expect("Could not locate OwlProgram");

    let lib_source = owl_base_path.join("LibSource");
    let cpp_source = owl_base_path.join("Source");

    generate_bindings(&cpp_source, &out_path, &lib_source);
    copy_linker_scripts(&cpp_source, &out_path);
    compile_c_lib(&lib_source, &cpp_source, &out_path);
}

fn copy_linker_scripts(cpp_source: &Path, out_path: &Path) {
    println!("cargo:rustc-link-search={}", out_path.to_str().unwrap());
    for file in ["owl1.ld", "owl2.ld", "owl3.ld"] {
        copy(cpp_source.join(file), out_path.join(file)).expect("failed to copy linker file");
    }
}

fn generate_bindings(cpp_source: &Path, out_path: &Path, lib_source: &Path) {
    let bindings = bindgen::Builder::default()
        .header(cpp_source.join("ProgramVector.h").to_str().unwrap())
        .use_core()
        .prepend_enum_name(false)
        .parse_callbacks(Box::new(bindgen::CargoCallbacks::new()))
        .allowlist_type("ProgramVector")
        .allowlist_var("[^_].*")
        .blocklist_var("programVector")
        .clang_args(["-x", "c++"])
        .rustified_enum("ProgramVectorAudioStatus")
        .generate()
        .expect("Unable to generate bindings");

    bindings
        .write_to_file(out_path.join("program_vector.rs"))
        .expect("Couldn't write bindings!");

    let bindings = bindgen::Builder::default()
        .header("stddef.h")
        .header("stdint.h")
        .header(lib_source.join("MidiMessage.h").to_str().unwrap())
        .use_core()
        .allowlist_type("MidiRPN")
        .allowlist_type("OwlProtocol")
        .allowlist_type("UsbMidi")
        .allowlist_type("MidiControlChange")
        .allowlist_type("MidiStatus")
        .rustified_enum("MidiRPN")
        .rustified_enum("OwlProtocol")
        .rustified_enum("UsbMidi")
        .rustified_enum("MidiControlChange")
        .rustified_enum("MidiStatus")
        .blocklist_var("_.*")
        .prepend_enum_name(false)
        .parse_callbacks(Box::new(bindgen::CargoCallbacks::new()))
        .parse_callbacks(Box::new(MyCallback))
        .clang_args(["-x", "c++", "-fshort-enums"])
        .generate()
        .expect("Unable to generate bindings");

    bindings
        .write_to_file(out_path.join("midi_message.rs"))
        .expect("Couldn't write bindings!");

    let bindings = bindgen::Builder::default()
        .header(cpp_source.join("ServiceCall.h").to_str().unwrap())
        .use_core()
        .prepend_enum_name(false)
        .generate_cstr(true)
        .parse_callbacks(Box::new(bindgen::CargoCallbacks::new()))
        .blocklist_function("serviceCall")
        .clang_args(["-x", "c++"])
        .generate()
        .expect("Unable to generate bindings");

    bindings
        .write_to_file(out_path.join("service_call.rs"))
        .expect("Couldn't write bindings!");

    let bindings = bindgen::Builder::default()
        .header(lib_source.join("OpenWareMidiControl.h").to_str().unwrap())
        .use_core()
        .prepend_enum_name(false)
        .parse_callbacks(Box::new(bindgen::CargoCallbacks::new()))
        .parse_callbacks(Box::new(MyCallback))
        .generate_cstr(true)
        .clang_args(["-x", "c++", "-fshort-enums"])
        .rustified_enum("PatchParameterId")
        .rustified_enum("PatchButtonId")
        .rustified_enum("OpenWareMidiSysexCommand")
        .rustified_enum("OpenWareMidiControl")
        .generate()
        .expect("Unable to generate bindings");

    bindings
        .write_to_file(out_path.join("openware_midi_control.rs"))
        .expect("Couldn't write bindings!");

    // let bindings = bindgen::Builder::default()
    //     .header(lib_source.join("basicmaths.h").to_str().unwrap())
    //     .allowlist_function("fast_.*")
    //     .allowlist_function("arm_.*")
    //     .use_core()
    //     .prepend_enum_name(false)
    //     .parse_callbacks(Box::new(bindgen::CargoCallbacks::new()))
    //     .clang_args([&format!("-I{}", cpp_source.to_str().unwrap())])
    //     .generate()
    //     .expect("Unable to generate bindings");

    // bindings
    //     .write_to_file(out_path.join("fastmaths.rs"))
    //     .expect("Couldn't write bindings!");
}

fn compile_c_lib(lib_source: &Path, cpp_source: &Path, out_path: &Path) {
    const GCC_ARGS: [&str; 10] = [
        // "-DARM_CORTEX",
        // "-DEXTERNAL_SRAM",
        "-nostdlib",
        "-fno-builtin",
        "-ffreestanding",
        // "-mtune=cortex-m4",
        "-fpic",
        "-fpie",
        "-fdata-sections",
        "-ffunction-sections",
        "-mno-unaligned-access",
        "-fno-omit-frame-pointer",
        // "-c",
        "-std=gnu11",
    ];

    copy("tables.c", out_path.join("tables.c")).expect("failed to copy tables.c");
    copy(
        lib_source.join("FastPowTable.h"),
        out_path.join("FastPowTable.h"),
    )
    .expect("failed to copy FastPowTable.h");

    copy(
        lib_source.join("FastLogTable.h"),
        out_path.join("FastLogTable.h"),
    )
    .expect("failed to copy FastLogTable.h");

    copy(lib_source.join("fastpow.h"), out_path.join("fastpow.h"))
        .expect("failed to copy fastpow.h");

    copy(lib_source.join("fastlog.h"), out_path.join("fastlog.h"))
        .expect("failed to copy fastlog.h");

    copy(
        lib_source.join("basicmaths.h"),
        out_path.join("basicmaths.h"),
    )
    .expect("failed to copy basicmaths.h");

    in_dir(out_path, || {
        let mut c_builder = cc::Build::new();

        c_builder.include(cpp_source);
        c_builder.file(lib_source.join("basicmaths.c"));
        c_builder.file(lib_source.join("fastpow.c"));
        c_builder.file(lib_source.join("fastlog.c"));
        c_builder.file("tables.c");
        // c_builder.file(lib_source.join("FastPowTable.h"));
        // c_builder.file(lib_source.join("FastLogTable.h"));

        for flag in GCC_ARGS {
            c_builder.flag(flag);
        }
        c_builder.compile("basicmaths");
    });

    println!("cargo:rustc-link-search={}", lib_source.to_str().unwrap());
    println!("cargo:rustc-link-lib=basicmaths");
}

fn in_dir(dir: &Path, f: impl FnOnce()) {
    let old_dir = std::env::current_dir().unwrap();
    std::env::set_current_dir(dir).unwrap();
    f();
    std::env::set_current_dir(old_dir).unwrap();
}
