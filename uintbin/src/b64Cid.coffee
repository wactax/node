#!/usr/bin/env coffee

> ./binUint.js
  ./base64url.js

< (s)=>
  b = Buffer.from(s, base64url)
  [
    b[0]
    binUint b.slice(1)
  ]

