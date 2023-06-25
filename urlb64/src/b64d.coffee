#!/usr/bin/env coffee

> ./char.js

lookup = new Uint8Array(256)
i = 0
while i < char.length
  lookup[char.charCodeAt(i)] = i
  i++

export default (base64string) =>
  `var i`
  bufferLength = base64string.length * 0.75
  len = base64string.length
  i = undefined
  p = 0
  encoded1 = undefined
  encoded2 = undefined
  encoded3 = undefined
  encoded4 = undefined
  bytes = new Uint8Array(bufferLength)
  i = 0
  while i < len
    encoded1 = lookup[base64string.charCodeAt(i)]
    encoded2 = lookup[base64string.charCodeAt(i + 1)]
    encoded3 = lookup[base64string.charCodeAt(i + 2)]
    encoded4 = lookup[base64string.charCodeAt(i + 3)]
    bytes[p++] = encoded1 << 2 | encoded2 >> 4
    bytes[p++] = (encoded2 & 15) << 4 | encoded3 >> 2
    bytes[p++] = (encoded3 & 3) << 6 | encoded4 & 63
    i += 4
  bytes.buffer


