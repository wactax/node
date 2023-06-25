#!/usr/bin/env coffee

> ./uintBin.js
  ./base64url.js

< (cid, n)=>
  Buffer.concat([
    Buffer.from([cid])
    uintBin(n)
  ]).toString base64url

