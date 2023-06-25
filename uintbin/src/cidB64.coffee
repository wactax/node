#!/usr/bin/env coffee

> @w5/vbyte/vbyteE.js
  ./base64url.js

< (cid, n)=>
  Buffer.from(
    vbyteE [
      cid
      n
    ]
  ).toString base64url

