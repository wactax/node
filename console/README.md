[‼️]: ✏️README.mdt

# @w5/console

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee
import Console from '@w5/console'

do =>
  console = Console()
  console.log "您好"
  console.dir {a:b:[1,2,3]}
  console.dir {a:b:[1,2,3]}, {colors:false}
  console.trace()
  console.error "test"
```

output :

```
console/test/main.coffee:7 › 您好
console/lib/index.js:47 › { a: { b: [ 1, 2, 3 ] } }
console/lib/index.js:47 › { a: { b: [ 1, 2, 3 ] } }
```
