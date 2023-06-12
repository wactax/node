#!/usr/bin/env coffee

> @w5/uintbin/uintBin
  @w5/uintbin/binUint

for n from [1,2,123,3333,0]
  bin = uintBin n
  console.log n, bin, binUint bin

for t from ['AQ','Ag','BQ0','AA']
  bin = Buffer.from t,'base64url'
  console.log t, binUint bin
