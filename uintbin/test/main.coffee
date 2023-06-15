#!/usr/bin/env coffee

> @w5/uintbin/uintBin
  @w5/uintbin/binUint
  @w5/uintbin/b64Uint
  @w5/uintbin/uintB64

for n from [1,2,123,3333,0]
  bin = uintBin n
  console.log n, bin, binUint bin

for t from ['AQ','Ag','BQ0','_w','AAE','AA','FEgD']
  bin = Buffer.from t,'base64url'
  n = b64Uint(t)
  console.log t, uintB64(n), n, binUint bin
