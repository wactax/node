#!/usr/bin/env coffee

> ./pkg/_ > Blake3 blake3Hash blake3HashN

hash = new Blake3

hash.update new Uint8Array(1)
hash.update new Uint8Array(2)

console.log hash.finalize()

console.log blake3Hash(new Uint8Array(3))
console.log blake3HashN(new Uint8Array(3),16)
