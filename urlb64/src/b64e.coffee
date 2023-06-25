> ./char.js

export default (arraybuffer) =>
  + i
  bytes = new Uint8Array(arraybuffer)
  i = undefined
  len = bytes.length
  base64url = ''
  i = 0
  while i < len
    base64url += char[bytes[i] >> 2]
    base64url += char[(bytes[i] & 3) << 4 | bytes[i + 1] >> 4]
    base64url += char[(bytes[i + 1] & 15) << 2 | bytes[i + 2] >> 6]
    base64url += char[bytes[i + 2] & 63]
    i += 3
  if len % 3 == 2
    base64url = base64url.substring(0, base64url.length - 1)
  else if len % 3 == 1
    base64url = base64url.substring(0, base64url.length - 2)
  base64url

