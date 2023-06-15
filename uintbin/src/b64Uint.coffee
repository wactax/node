#!/usr/bin/env coffee

> ./binUint.js
  ./base64url.js

< (s)=>
  binUint Buffer.from(s,base64url)



