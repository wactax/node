#!/usr/bin/env coffee

> ./uintBin.js
  @w5/urlb64/b64e.js
  @w5/u8 > u8merge U8

export default (cid, n) =>
  if not Array.isArray(cid)
    cid = U8 [cid]
  b64e u8merge cid, uintBin(n)
