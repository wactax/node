[‼️]: ✏️README.mdt

# @w5/uintbin

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/uintbin/uintBin
  @w5/uintbin/binUint

for n from [1,2,3333,0]
  bin = uintBin n
  console.log n, bin, binUint bin
```

output :

```
1 <Buffer > 0
2 <Buffer > 0
3333 <Buffer 05 0d> 3333
0 <Buffer > 0
```
