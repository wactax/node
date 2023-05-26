#!/usr/bin/env coffee

< (n)=>
  buf = Buffer.allocUnsafe(6)
  buf.writeUIntLE(n, 0, 6)
  n = buf.length
  while n
    if buf[--n]!=0
      break
  if n == 0
    return Buffer.from []
  buf.slice(0,n+1)
