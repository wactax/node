use wasm_bindgen::prelude::wasm_bindgen;

#[wasm_bindgen]
pub fn vbyteE(vs: &[f64]) -> Vec<u8> {
  vbyte::compress_list(&vs.into_iter().map(|i| *i as u64).collect::<Vec<_>>())
}
