[‼️]: ✏️README.mdt

# @w5/uintb64

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/uintb64/uintB64
  @w5/uintb64/b64Uint

for n from [
  1,2,3333,255,256,0, 65539, 9876543210
  Number.MAX_SAFE_INTEGER
]
  e = uintB64(n)
  console.log n, e, b64Uint(e)
```

output :

```
1 AQ 1
2 Ag 2
3333 BQ0 3333
255 _w 255
256 AAE 256
0 AA 0
65539 AwAB 65539
9876543210 6hawTAI 9876543210
9007199254740991 ________Hw 9007199254740991
```
