# wasm-set

wasm wrapper for rust [blake3](https://docs.rs/blake3/latest/blake3/)

use :
[→ test.coffee](test.coffee)

```coffee
#!/usr/bin/env coffee

> ./pkg/_ > Blake3 blake3Hash

hash = new Blake3

hash.update new Uint8Array(1)
hash.update new Uint8Array(2)

console.log hash.finalize()

console.log blake3Hash(new Uint8Array(3))
```


out :
[→ out.txt](out.txt)

```txt
set.add(new Uint8Array([1])) = true
set.has([1]) = true
set.size = Uint8Array(1) [ 1 ]
set.dump() = 1
BinSet.load(set.dump(),1).size = 1
set.delete([1]) = true
set.size = 0
set.has([1]) = false
set.delete([1]) = false
set.has([2]) = false
```

