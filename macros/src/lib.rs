extern crate proc_macro;

use proc_macro::TokenStream;
use quote::quote;
use syn::{
    parse::{self},
    parse_macro_input,
    spanned::Spanned,
    ItemFn, LitStr, ReturnType, Type, Visibility,
};

#[proc_macro_attribute]
pub fn patch(attr: TokenStream, input: TokenStream) -> TokenStream {
    let f = parse_macro_input!(input as ItemFn);

    // check the function signature
    let valid_signature = f.sig.constness.is_none()
        && f.vis == Visibility::Inherited
        && f.sig.abi.is_none()
        && f.sig.generics.params.is_empty()
        && f.sig.generics.where_clause.is_none()
        && f.sig.variadic.is_none()
        && match f.sig.output {
            ReturnType::Default => false,
            ReturnType::Type(_, ref ty) => matches!(**ty, Type::Never(_)),
        }
        && f.sig.inputs.len() == 1;

    if !valid_signature {
        return parse::Error::new(
            f.span(),
            "`#[patch]` function must have signature `fn (mut pv: ProgramVector) -> !`",
        )
        .to_compile_error()
        .into();
    }

    let input_type = match &f.sig.inputs[0] {
        syn::FnArg::Typed(pat_type) => &pat_type.ty,
        _ => todo!(),
    };

    let input_type = match input_type.as_ref() {
        Type::Path(type_path) => type_path.path.clone(),
        _ => todo!(),
    };

    let patch_name = parse_macro_input!(attr as LitStr).value();

    let main_fn = &f.sig.ident;

    quote!(
        mod __header {

            use core::mem::MaybeUninit;
            use owl_patch::ffi::program_vector::ProgramVector as FfiProgramVector;
            use owl_patch::ProgramHeader;

            // The Program Vector is how we communicate with the OS. It is initialised by the OS just before runtime.
            // It is assigned to the special .pv section, and its address will be written to the program header block
            #[link_section = ".pv"]
            static mut PROGRAM_VECTOR: MaybeUninit<FfiProgramVector> = MaybeUninit::uninit();

            #[link_section = ".program_header"]
            static HEADER: ProgramHeader<{ #patch_name.len() + 1 }> =
                ProgramHeader::new(
                    const_str::to_byte_array!(concat!(#patch_name, "\0")),
                    &raw const PROGRAM_VECTOR,
                );

            #[no_mangle]
            unsafe extern "Rust" fn __main() -> ! {
                #[allow(static_mut_refs)]
                super::#main_fn(super::#input_type::new(
                    // This is safe as long as nothing ever calls __main() again after the first call in reset_handler()
                    PROGRAM_VECTOR.assume_init_mut(),
                    HEADER.patch_name(),
                ));
            }
        }

        #f
    )
    .into()
}
