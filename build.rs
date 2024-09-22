use std::env;
use std::fs::{copy, File};
use std::io::Write as _;
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
            | "OpenWareMidiControl" => vec!["num_derive::FromPrimitive".to_string()],
            _ => vec![],
        }
    }
}

const GCC_ARGS: [&str; 14] = [
    "-DARM_CORTEX",
    "-DEXTERNAL_SRAM",
    "-nostdlib",
    "-fno-builtin",
    "-ffreestanding",
    "-mtune=cortex-m4",
    "-fpic",
    "-fpie",
    "-fdata-sections",
    "-ffunction-sections",
    "-mno-unaligned-access",
    "-fno-omit-frame-pointer",
    "-c",
    "-std=gnu11",
];

fn main() {
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
    compile_c_lib(&cpp_source, &out_path);
    copy_linker_scripts(&cpp_source, &out_path);
}

fn copy_linker_scripts(cpp_source: &Path, out_path: &Path) {
    for file in ["owl1.ld", "owl2.ld", "owl3.ld"] {
        copy(cpp_source.join(file), out_path.join(file)).expect("failed to copy linker file");
    }
}

fn compile_c_lib(cpp_source: &Path, out_path: &Path) {
    copy(cpp_source.join("startup.s"), out_path.join("startup.s"))
        .expect("failed to copy startup.s");

    let progname = env::var("PATCHNAME").unwrap_or("Rust Patch".to_string());

    println!("cargo::rustc-env=PATCHNAME={}", &progname);
    println!("cargo::rerun-if-env-changed=PATCHNAME");

    let mut progname_file = File::create(out_path.join("progname.s")).unwrap();
    progname_file
        .write_all(format!(".string \"{}\"\n", progname).as_bytes())
        .unwrap();

    in_dir(out_path, || {
        let mut c_builder = cc::Build::new();

        c_builder.file(out_path.join("startup.s"));

        for flag in GCC_ARGS {
            c_builder.flag(flag);
        }
        c_builder.compile("startup");
    });

    println!("cargo:rustc-link-search={}", out_path.to_str().unwrap());
    println!("cargo:rustc-link-lib=startup");
}

fn generate_bindings(cpp_source: &Path, out_path: &Path, lib_source: &Path) {
    let bindings = bindgen::Builder::default()
        .header(cpp_source.join("ProgramVector.h").to_str().unwrap())
        .use_core()
        .prepend_enum_name(false)
        .parse_callbacks(Box::new(bindgen::CargoCallbacks))
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
        .prepend_enum_name(false)
        .parse_callbacks(Box::new(bindgen::CargoCallbacks))
        // .clang_args(gcc_args)
        .clang_args(["-x", "c++"])
        .generate()
        .expect("Unable to generate bindings");

    bindings
        .write_to_file(out_path.join("midi_message.rs"))
        .expect("Couldn't write bindings!");

    let bindings = bindgen::Builder::default()
        .header(cpp_source.join("ServiceCall.h").to_str().unwrap())
        .use_core()
        .prepend_enum_name(false)
        .parse_callbacks(Box::new(bindgen::CargoCallbacks))
        .blocklist_function("serviceCall")
        // .clang_args(gcc_args)
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
        .parse_callbacks(Box::new(bindgen::CargoCallbacks))
        .parse_callbacks(Box::new(MyCallback))
        .clang_args(["-x", "c++"])
        .rustified_enum("PatchParameterId")
        .rustified_enum("PatchButtonId")
        .rustified_enum("OpenWareMidiSysexCommand")
        .rustified_enum("OpenWareMidiControl")
        .generate()
        .expect("Unable to generate bindings");

    bindings
        .write_to_file(out_path.join("openware_midi_control.rs"))
        .expect("Couldn't write bindings!");
}

fn in_dir(dir: &Path, f: impl FnOnce()) {
    let old_dir = std::env::current_dir().unwrap();
    std::env::set_current_dir(dir).unwrap();
    f();
    std::env::set_current_dir(old_dir).unwrap();
}
