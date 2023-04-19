[‼️]: ✏️README.mdt

# @w5/zipint

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/zipint > zip unzip

console.log zip [999,2,3]
console.log unzip zip [999,2,3]
```

output :

```
Uint8Array(4) [ 231, 7, 2, 3 ]
[ 999, 2, 3 ]
```
