#!/usr/bin/env coffee

< (n) =>
  buf = new Uint8Array(8)
  # Write as little endian
  n = BigInt(n)
  i = 0
  while i < buf.length
    buf[i++] = Number(n & 255n)
    n = n >> 8n
    if n == 0n
      break
  return [buf,i]
