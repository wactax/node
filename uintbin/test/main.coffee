#!/usr/bin/env coffee

> @w5/uintbin/uintBin
  @w5/uintbin/binUint
  @w5/uintbin/b64Uint

for n from [1,2,123,3333,0]
  bin = uintBin n
  console.log n, bin, binUint bin

for t from ['AQ','Ag','BQ0','_w','AAE','AA','FEgD']
  bin = Buffer.from t,'base64url'
  console.log t, b64Uint(t), binUint bin
