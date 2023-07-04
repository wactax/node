ALPHABET = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-_'
< =>
  [
    ...crypto.getRandomValues new Uint8Array 21
  ].map(
    (i)=>ALPHABET.charAt(i%64)
  ).join('')
