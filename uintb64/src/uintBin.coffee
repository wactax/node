#!/usr/bin/env coffee

export default (n) =>
  buf = new Uint8Array(8)
  # Write as little endian
  n = BigInt(n)
  i = 0
  while i < buf.length
    buf[i++] = Number(n & 255n)
    n = n >> 8n
    if n == 0n
      break
  return new Uint8Array buf.buffer.slice(0,i)
