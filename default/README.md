[‼️]: ✏️README.mdt

# @w5/default

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

import '@w5/default'

m = new Map()
m.default(1,=>[]).push(7)
m.default(1,=>[]).push(8)
m.default(2,=>[]).push(9)

console.log m
```

output :

```
Map(2) { 1 => [ 7, 8 ], 2 => [ 9 ] }
```
