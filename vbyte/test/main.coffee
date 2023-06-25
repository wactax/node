#!/usr/bin/env coffee

> @w5/vbyte/vbyteE
  @w5/vbyte/vbyteD

#   @w5/uridir
#   path > join

# ROOT = uridir(import.meta)

li = [
  Number.MAX_SAFE_INTEGER
  127
  128
  256
  1234567890
]

console.log li

b = vbyteE li
console.log b
console.log vbyteD b
  # console.log n, n == vbyteD b
