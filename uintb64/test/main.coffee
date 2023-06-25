#!/usr/bin/env coffee

> @w5/uintb64/uintB64

for n from [1,2,3333,255,256,0]
  console.log n, uintB64(n)
