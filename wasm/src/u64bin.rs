use base64::{engine::general_purpose::URL_SAFE_NO_PAD, Engine};
use wasm_bindgen::prelude::wasm_bindgen;

#[wasm_bindgen]
pub fn u64Bin(n: f64) -> Box<[u8]> {
  let n = n as u64;
  let n = n.to_le_bytes();
  let mut i = 8;
  while i > 0 {
    let p = i - 1;
    if n[p] != 0 {
      break;
    }
    i = p;
  }
  Box::from(&n[..i])
}

#[wasm_bindgen]
pub fn u64B64(n: f64) -> String {
  URL_SAFE_NO_PAD.encode(&u64Bin(n))
}

#[wasm_bindgen]
pub fn binU64(bin: &[u8]) -> f64 {
  let bin = bin.as_ref();
  let mut b = [0u8; 8];
  b[..bin.len()].copy_from_slice(bin);
  u64::from_le_bytes(b) as _
}
