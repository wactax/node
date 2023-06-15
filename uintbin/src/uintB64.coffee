#!/usr/bin/env coffee

> ./uintBin.js
  ./base64url.js

< (n)=>
  uintBin(n).toString(base64url)



