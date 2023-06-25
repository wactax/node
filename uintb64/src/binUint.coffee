#!/usr/bin/env coffee

export default (b) =>
  n = 0n
  offset = 0n
  for i from b
    n += (BigInt(i)<<offset)
    offset += 8n
  Number(n)
