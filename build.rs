use std::env;
use std::fs::{copy, File};
use std::io::Write as _;
use std::path::PathBuf;
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
            .args(&["submodule", "update", "--init", "OwlProgram"])
            .status();
    }

    let owl_base_path = PathBuf::from("OwlProgram")
        .canonicalize()
        .expect("Could not locate OwlProgram");

    let lib_source = owl_base_path.join("LibSource");
    let cpp_source = owl_base_path.join("Source");

    generate_bindings(&cpp_source, &out_path, lib_source);
    compile_c_lib(&cpp_source, &out_path);
    linker_args(&cpp_source, &out_path);
}

fn linker_args(cpp_source: &PathBuf, out_path: &PathBuf) {
    println!("cargo::rerun-if-env-changed=PLATFORM");

    let platform = env::var("PLATFORM").unwrap_or("OWL2".to_string());

    let link_script = match platform.as_str() {
        "OWL1" => cpp_source.join("owl1.ld"),
        "OWL2" => cpp_source.join("owl2.ld"),
        "OWL3" => cpp_source.join("owl3.ld"),
        _ => panic!("unknown PLATFORM, should be one of OWL1, OWL2, or OWL3"),
    };

    copy(link_script, out_path.join("owl.ld")).expect("failed to copy linker file");
}

fn compile_c_lib(cpp_source: &PathBuf, out_path: &PathBuf) {
    copy(cpp_source.join("startup.s"), out_path.join("startup.s"))
        .expect("failed to copy startup.s");
    copy(cpp_source.join("heap_5.c"), out_path.join("heap_5.c")).expect("failed to copy heap_5.c");
    copy(cpp_source.join("heap.h"), out_path.join("heap.h")).expect("failed to copy heap.h");

    let progname = env::var("PROGNAME").unwrap_or("Rust Patch".to_string());
    println!("cargo::rerun-if-env-changed=PROGNAME");

    let mut progname_file = File::create(out_path.join("progname.s")).unwrap();
    progname_file
        .write_all(format!(".string \"{}\"\n", progname).as_bytes())
        .unwrap();

    in_dir(out_path, || {
        let mut c_builder = cc::Build::new();

        c_builder.file(out_path.join("startup.s"));
        c_builder.file(out_path.join("heap_5.c"));

        for flag in GCC_ARGS {
            c_builder.flag(flag);
        }
        c_builder.compile("startup");
    });

    println!("cargo:rustc-link-search={}", out_path.to_str().unwrap());
    println!("cargo:rustc-link-lib=startup");
}

fn generate_bindings(cpp_source: &PathBuf, out_path: &PathBuf, lib_source: PathBuf) {
    // Generate bundings
    let bindings = bindgen::Builder::default()
        .header("stddef.h")
        .header(cpp_source.join("heap.h").to_str().unwrap())
        .use_core()
        .allowlist_type("HeapRegion")
        .allowlist_type("HeapRegion_t")
        .allowlist_function("pvPortMalloc")
        .allowlist_function("vPortFree")
        .allowlist_function("xPortGetFreeHeapSize")
        .allowlist_function("xPortGetMinimumEverFreeHeapSize")
        .allowlist_function("vPortDefineHeapRegions")
        .allowlist_function("vPortGetSizeBlock")
        .allowlist_var("portBYTE_ALIGNMENT")
        .size_t_is_usize(true)
        .prepend_enum_name(false)
        .parse_callbacks(Box::new(bindgen::CargoCallbacks))
        .clang_args(GCC_ARGS)
        .generate()
        .expect("Unable to generate bindings");

    bindings
        .write_to_file(out_path.join("heap.rs"))
        .expect("Couldn't write bindings!");

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

fn in_dir(dir: &PathBuf, f: impl FnOnce()) {
    let old_dir = std::env::current_dir().unwrap();
    std::env::set_current_dir(dir).unwrap();
    f();
    std::env::set_current_dir(old_dir).unwrap();
}
