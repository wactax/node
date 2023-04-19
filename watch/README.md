[‼️]: ✏️README.mdt

# @w5/watch

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/uridir
  @w5/watch > watchOnce
  path > join

ROOT = uridir import.meta

await watchOnce(
  join(ROOT,'.watch')
  ROOT
  (fp)=> # ignore
    not fp.endsWith '.coffee'
  (fp)=> # change
    console.log 'change', fp
    return
  (fp)=> # rm
    console.log 'rm ',fp
    return
)
```

output :

```
change main.coffee
```
