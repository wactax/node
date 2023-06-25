#!/usr/bin/env coffee

> @w5/uintb64/uintB64
  @w5/uintb64/b64Uint
  @w5/uintb64/cidB64

for n from [
  1,2,3333,255,256,0, 65539, 9876543210
  Number.MAX_SAFE_INTEGER
]
  e = uintB64(n)
  # console.log n, e, b64Uint(e)
  console.log n, cidB64(2,n)
