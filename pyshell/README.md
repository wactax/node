[‼️]: ✏️README.mdt

# @w5/pyshell

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/pyshell
#   @w5/uridir
#   path > join

# ROOT = uridir(import.meta)

console.log await pyshell 123
```

output :

```
123
```