use std::collections::BTreeSet;

use wasm_bindgen::prelude::*;

#[wasm_bindgen]
pub struct BinSet {
  set: BTreeSet<Box<[u8]>>,
}

#[wasm_bindgen]
impl BinSet {
  #[wasm_bindgen(constructor)]
  pub fn new() -> Self {
    Self {
      set: BTreeSet::new(),
    }
  }

  pub fn add(&mut self, val: Box<[u8]>) -> bool {
    self.set.insert(val)
  }

  pub fn has(&self, val: Box<[u8]>) -> bool {
    self.set.get(&val).is_some()
  }

  pub fn delete(&mut self, val: Box<[u8]>) -> bool {
    self.set.remove(&val)
  }

  #[wasm_bindgen(getter)]
  pub fn size(&self) -> usize {
    self.set.len()
  }

  pub fn dump(&self) -> Vec<u8> {
    let mut li = Vec::new();
    for i in &self.set {
      li.extend(&i[..]);
    }
    li
  }

  pub fn load(li: Box<[u8]>, n: usize) -> Self {
    let mut set = BTreeSet::new();
    let len = li.len();
    if len > 0 {
      let mut pos = 0;
      let mut next = pos + n;
      while next < len {
        set.insert(Box::from(&li[pos..next]));
        pos = next;
        next += n;
      }
      if pos != len {
        set.insert(Box::from(&li[pos..]));
      }
    }
    Self { set }
  }
}
/*
#[wasm_bindgen]
pub fn hash128(input: &[u8]) -> Box<[u8]> {
xxh3_128(&input).to_le_bytes().into()
}

#[allow(non_snake_case)]
#[wasm_bindgen]
pub fn hash128Len(input: &[u8]) -> Box<[u8]> {
[
&xxh3_128(&input).to_le_bytes()[..],
&(input.len() as u32).to_le_bytes()[..],
]
.concat()
.into()
}

#[wasm_bindgen]
pub fn hash(input: &[u8]) -> u64 {
xxh3_64(&input)
}
#[wasm_bindgen]
pub fn encode_bin(input: &[u8]) -> Vec<u8> {
rmw_utf8::encode(input)
}

#[wasm_bindgen]
pub fn encode(input: String) -> Vec<u8> {
rmw_utf8::encode(input.as_bytes())
}

#[wasm_bindgen]
pub fn decode(input: &[u8]) -> String {
rmw_utf8::decode(input)
}
*/
