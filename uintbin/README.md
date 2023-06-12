[‼️]: ✏️README.mdt

# @w5/uintbin

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/uintbin/uintBin
  @w5/uintbin/binUint

for n from [1,2,123,3333,0]
  bin = uintBin n
  console.log n, bin, binUint bin
```

output :

```
1 <Buffer 01> 1
2 <Buffer 02> 2
123 <Buffer 7b> 123
3333 <Buffer 05 0d> 3333
0 <Buffer 00> 0
```
