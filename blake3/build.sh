#!/usr/bin/env bash

DIR=$(realpath $0) && DIR=${DIR%/*}
cd $DIR
set -ex

cargo build --target wasm32-unknown-unknown --release
rust_wasm=./target/wasm32-unknown-unknown/release/_.wasm
wasm-bindgen $rust_wasm --out-dir pkg --target nodejs --weak-refs

if ! [ -x "$(command -v wasm-opt)" ]; then
  cargo install wasm-opt
fi

wasm-opt -O3 -o ./pkg/__bg.wasm ./pkg/__bg.wasm
bunx cep --ext mjs -c stream.coffee -o pkg
bunx cep --ext mjs -c file.coffee -o pkg
