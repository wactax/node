use base64::{engine::general_purpose::URL_SAFE_NO_PAD, Engine};
use wasm_bindgen::prelude::wasm_bindgen;

use crate::Result;

#[wasm_bindgen]
pub fn vbyteE(vs: &[f64]) -> Vec<u8> {
  vbyte::compress_list(&vs.iter().map(|i| *i as u64).collect::<Vec<_>>())
}

#[wasm_bindgen]
pub fn vbyteD(vs: &[u8]) -> Result<Vec<f64>> {
  match vbyte::decompress_list(vs) {
    Ok(r) => Ok(r.into_iter().map(|i| i as f64).collect()),
    Err(err) => Err(wasm_bindgen::JsError::new(err)),
  }
}

#[wasm_bindgen]
pub fn b64VbyteE(vs: &[f64]) -> String {
  URL_SAFE_NO_PAD.encode(vbyteE(vs))
}

#[wasm_bindgen]
pub fn b64VbyteD(vs: &str) -> Result<Vec<f64>> {
  vbyteD(&URL_SAFE_NO_PAD.decode(vs)?)
}

#[wasm_bindgen]
pub fn z85VbyteE(vs: &[f64]) -> String {
  z85::encode(vbyteE(vs))
}

#[wasm_bindgen]
pub fn z85VbyteD(vs: &str) -> Result<Vec<f64>> {
  vbyteD(&z85::decode(vs)?)
}
