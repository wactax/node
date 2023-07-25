#![allow(non_snake_case)]

pub mod b64;
pub mod bin_map;
pub mod bin_set;
pub mod u64bin;
pub mod vbyte;
pub mod z85;

pub type Result<T> = std::result::Result<T, wasm_bindgen::JsError>;
