CODE = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_'

lookup = []
revLookup = []
Arr = if typeof Uint8Array != 'undefined' then Uint8Array else Array
i = 0
len = CODE.length
while i < len
  lookup[i] = CODE[i]
  revLookup[CODE.charCodeAt(i)] = i
  ++i

# Support decoding URL-safe base64 strings, as Node.js does See: https://en.wikipedia.org/wiki/Base64#URL_applications
revLookup['-'.charCodeAt(0)] = 62
revLookup['_'.charCodeAt(0)] = 63

tripletToBase64 = (num) ->
  lookup[num >> 18 & 0x3F] + lookup[num >> 12 & 0x3F] + lookup[num >> 6 & 0x3F] + lookup[num & 0x3F]

encodeChunk = (uint8, start, end) ->
  tmp = undefined
  output = []
  i = start
  while i < end
    tmp = (uint8[i] << 16 & 0xFF0000) + (uint8[i + 1] << 8 & 0xFF00) + (uint8[i + 2] & 0xFF)
    output.push tripletToBase64(tmp)
    i += 3
  output.join ''

export default (uint8) ->
  tmp = undefined
  len = uint8.length
  extraBytes = len % 3
  # if we have 1 byte left, pad 2 bytes
  parts = []
  maxChunkLength = 16383
  # must be multiple of 3
  # go through the array every three bytes, we'll deal with trailing stuff later
  i = 0
  len2 = len - extraBytes
  while i < len2
    parts.push encodeChunk(uint8, i, if i + maxChunkLength > len2 then len2 else i + maxChunkLength)
    i += maxChunkLength
  # pad the end with zeros, but make sure to not forget the extra bytes
  if extraBytes == 1
    tmp = uint8[len - 1]
    parts.push lookup[tmp >> 2] + lookup[tmp << 4 & 0x3F] # + '=='
  else if extraBytes == 2
    tmp = (uint8[len - 2] << 8) + uint8[len - 1]
    parts.push lookup[tmp >> 10] + lookup[tmp >> 4 & 0x3F] + lookup[tmp << 2 & 0x3F] # + '='
  parts.join ''


