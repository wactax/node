[‼️]: ✏️README.mdt

# @w5/caller_line

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/caller_line

test = =>
  throw Error()

do =>
  try
    test()
  catch
    console.log CallerLine()
```

output :

```
file:///Users/z/wac.tax/node/caller_line/test/main.coffee:16:3
```
