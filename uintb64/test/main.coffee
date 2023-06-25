#!/usr/bin/env coffee

> @w5/uintb64/uintB64
  @w5/uintb64/b64Uint

for n from [1,2,3333,255,256,0]
  e = uintB64(n)
  console.log n, e, b64Uint(e)
