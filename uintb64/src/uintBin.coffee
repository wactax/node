#!/usr/bin/env coffee

export default (n) =>
  buf = new Uint8Array(6)
  # Write as little endian
  i = 0
  while i < buf.length
    buf[i] = n & 0xFF
    n = n >> 8
    i++
  len = buf.length
  while len
    if buf[--len] != 0
      break
  if len < 0
    return new Uint8Array([])
  return new Uint8Array(
    buf.buffer.slice(0, len + 1)
  )

