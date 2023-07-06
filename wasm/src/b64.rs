use base64::{engine::general_purpose::URL_SAFE_NO_PAD, Engine};
use wasm_bindgen::prelude::wasm_bindgen;

#[wasm_bindgen]
pub fn b64E(bin: &[u8]) -> String {
  URL_SAFE_NO_PAD.encode(bin)
}

#[wasm_bindgen]
pub fn b64D(bin: &str) -> Result<Vec<u8>, wasm_bindgen::JsError> {
  Ok(URL_SAFE_NO_PAD.decode(bin)?)
}
