#!/usr/bin/env coffee

> @w5/vbyte/vbyteD.js
  ./base64url.js

< (s)=>
  vbyteD Buffer.from(s, base64url)
