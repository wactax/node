[‼️]: ✏️README.mdt

# @w5/uintb64

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/uintb64/uintB64

for n from [1,2,3333,255,256,0]
  console.log n, uintB64 n
```

output :

```
1 AQ
2 Ag
3333 BQ0
255 _w
256 AAE
0 AA
```
