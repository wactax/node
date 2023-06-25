[‼️]: ✏️README.mdt

# @w5/vbyte

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/vbyte/vbyteE
  @w5/vbyte/vbyteD

#   @w5/uridir
#   path > join

# ROOT = uridir(import.meta)

li = [
  Number.MAX_SAFE_INTEGER
  127
  128
  256
  1234567890
]

console.log li

b = vbyteE li
console.log b
console.log vbyteD b
  # console.log n, n == vbyteD b
```

output :

```
[ 9007199254740991, 127, 128, 256, 1234567890 ]
Uint8Array(18) [
  255, 255, 255, 255, 255, 255,
  255,  15, 127, 128,   1, 128,
    2, 210, 133, 216, 204,   4
]
[ 9007199254740991, 127, 128, 256, 1234567890 ]
```
