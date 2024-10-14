extern crate proc_macro;

use std::ffi::CString;

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
        return sig_error(&f);
    }

    let input_type = match &f.sig.inputs[0] {
        syn::FnArg::Typed(pat_type) => &pat_type.ty,
        _ => return sig_error(&f),
    };

    let input_type = match input_type.as_ref() {
        Type::Path(type_path) => type_path.path.clone(),
        _ => return sig_error(&f),
    };

    let patch_name = CString::new(parse_macro_input!(attr as LitStr).value()).unwrap();
    let name_len = patch_name.as_bytes_with_nul().len();

    let main_fn = &f.sig.ident;

    quote!(
        #[cfg(target_os = "none")]
        mod __header {

            use owl_patch::ProgramHeader;
            use owl_patch::program_vector::PROGRAM_VECTOR;

            #[cfg_attr(target_os = "none", link_section = ".program_header")]
            static HEADER: ProgramHeader<{ #name_len }> =
                ProgramHeader::new(
                    #patch_name,
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

fn sig_error(f: &ItemFn) -> TokenStream {
    parse::Error::new(
        f.span(),
        "`#[patch]` function must have signature `fn (ProgramVector) -> !`",
    )
    .to_compile_error()
    .into()
}
