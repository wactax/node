#!/usr/bin/env coffee

> @w5/uintbin/cidB64
  @w5/uintbin/b64Cid
# > @w5/uintbin/uintBin
  # @w5/uintbin/binUint
  # @w5/uintbin/b64Uint
  # @w5/uintbin/uintB64

for n from [1,2,123,3333,0, Number.MAX_SAFE_INTEGER]
  # bin = uintBin n
  # console.log n, bin, binUint bin
  t = cidB64(2,n)
  console.log n, t, b64Cid(t)
# for t from ['AQ','Ag','BQ0','_w','AAE','AA','FEgD']
  # bin = Buffer.from t,'base64url'
  # n = b64Uint(t)
  # console.log t, uintB64(n), n, binUint bin
