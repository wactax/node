use wasm_bindgen::prelude::wasm_bindgen;

use crate::Result;

#[wasm_bindgen]
pub fn z85E(bin: &[u8]) -> String {
  z85::encode(bin)
}

#[wasm_bindgen]
pub fn z85D(bin: &str) -> Result<Vec<u8>> {
  Ok(z85::decode(bin)?)
}
