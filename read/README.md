[‼️]: ✏️README.mdt

# @w5/read

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/read
  path > join dirname

{pathname} = new URL(import.meta.url)

dir = dirname dirname pathname

console.log await read join(dir,'dev.sh')
```

output :

```
#!/usr/bin/env bash

DIR=$(realpath ${0%/*})
cd $DIR

exec dev $@
```
