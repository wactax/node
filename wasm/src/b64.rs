use anyhow::Result;
use base64::{engine::general_purpose::URL_SAFE_NO_PAD, Engine};

pub fn b64E(bin: &[u8]) -> String {
  URL_SAFE_NO_PAD.encode(bin)
}

pub fn b64D(bin: &str) -> Result<Vec<u8>> {
  Ok(URL_SAFE_NO_PAD.decode(bin)?)
}
