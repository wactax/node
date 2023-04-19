[‼️]: ✏️README.mdt

# @w5/verincr

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/verincr

[
  '0.0.1'
  '0.0.9'
  '10.10.9'
  '0.9.9'
  '0.9.99'
  '0.99.99'
].forEach (i)=>
  console.log i, verincr i
  return
```

output :

```
0.0.1 0.0.2
0.0.9 0.0.10
10.10.9 10.10.10
0.9.9 0.9.10
0.9.99 0.10.0
0.99.99 1.0.0
```
