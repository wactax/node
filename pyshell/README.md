[‼️]: ✏️README.mdt

# @w5/pyshell

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/pyshell
  @w5/uridir
  path > dirname join

ROOT = dirname uridir(import.meta)

py = pyshell join(ROOT,'test.py')

console.log await py 123

process.exit()
```

output :

```
123
```
