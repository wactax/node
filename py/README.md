[‼️]: ✏️README.mdt

# @w5/py

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/py
  @w5/uridir
  path > join dirname

ROOT = dirname uridir import.meta

{now} = await py join ROOT, 'test.py'

console.log await now()
```

output :

```
123
```
