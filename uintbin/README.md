[‼️]: ✏️README.mdt

# @w5/uintbin

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/uintbin/uintBin
  @w5/uintbin/binUint
  @w5/uintbin/b64Uint
  @w5/uintbin/uintB64

for n from [1,2,123,3333,0]
  bin = uintBin n
  console.log n, bin, binUint bin

for t from ['AQ','Ag','BQ0','_w','AAE','AA','FEgD']
  bin = Buffer.from t,'base64url'
  n = b64Uint(t)
  console.log t, uintB64(n), n, binUint bin
```

output :

```
1 <Buffer 01> 1
2 <Buffer 02> 2
123 <Buffer 7b> 123
3333 <Buffer 05 0d> 3333
0 <Buffer 00> 0
AQ AQ 1 1
Ag Ag 2 2
BQ0 BQ0 3333 3333
_w _w 255 255
AAE AAE 256 256
AA AA 0 0
FEgD FEgD 215060 215060
```
