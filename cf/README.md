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
```

output :

```
use https_proxy http://127.0.0.1:7890
5ok.pw
settings ssl strict
i-01.eu.org
settings ssl strict
law0.cf
settings ssl strict
law0.gq
settings ssl strict
ok0.pw
settings ssl strict
rmw0.tk
settings ssl strict
rmw.link
settings ssl strict
u-01.eu.org
settings ssl strict
user0.cf
settings ssl strict
user0.gq
settings ssl strict
xxai.art
settings ssl strict
xxai.eu.org
settings ssl strict
```
