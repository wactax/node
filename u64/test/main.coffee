#!/usr/bin/env coffee

> @w5/u64/encode
#   @w5/uridir
#   path > join

# ROOT = uridir(import.meta)

[bin,n] = encode 1234567890

console.log bin.slice(0,n)
