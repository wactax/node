[‼️]: ✏️README.mdt

# @w5/urlb64

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/urlb64/b64e.js
  @w5/urlb64/b64d.js
# ROOT = uridir(import.meta)

b64 = b64e new Uint8Array([255,6,5,4,3,2,1,0,1,2,3,4,5,6])

console.log b64
console.log b64d b64
```

output :

```
_wYFBAMCAQABAgMEBQY
Uint8Array(14) [
  255, 6, 5, 4, 3, 2,
    1, 0, 1, 2, 3, 4,
    5, 6
]
```
