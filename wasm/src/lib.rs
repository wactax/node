#![allow(non_snake_case)]

pub mod b64;
pub mod bin_set;
pub mod vbyte;

pub type Result<T> = std::result::Result<T, wasm_bindgen::JsError>;
