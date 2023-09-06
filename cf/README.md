[‼️]: ✏️README.mdt

# @w5/cf

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/cf
  @w5/cf/Zone

for i from await cf.GET()
  {name,id} = i
  console.log name
  {
    argo
    settings
  } = Zone(id)
  await settings.ssl 'strict'
  break
```

output :

```
use https_proxy http://127.0.0.1:7890
5ok.pw
settings ssl strict
```
