#!/usr/bin/env coffee

> ./binUint.js
  @w5/urlb64/b64d.js

export default (s) =>
  r = b64d s
  [r[0], binUint r.slice(1)]
