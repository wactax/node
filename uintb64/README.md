[‼️]: ✏️README.mdt

# @w5/uintb64

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/uintb64/uintB64
  @w5/uintb64/b64Uint
  @w5/uintb64/cidB64
  @w5/uintb64/b64Cid

for n from [
  1,2,3333,255,256,0, 65539, 9876543210
  Number.MAX_SAFE_INTEGER
]
  # e = uintB64(n)
  # console.log n, e, b64Uint(e)
  t = cidB64(2,n)
  console.log n, t, b64Cid(t)
```

output :

```
1 AgE [ 2, 1 ]
2 AgI [ 2, 2 ]
3333 AoUa [ 2, 3333 ]
255 Av8B [ 2, 255 ]
256 AoAC [ 2, 256 ]
0 AgA [ 2, 0 ]
65539 AoOABA [ 2, 65539 ]
9876543210 AuqtwOUk [ 2, 9876543210 ]
9007199254740991 Av________8P [ 2, 9007199254740991 ]
```
