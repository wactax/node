[‼️]: ✏️README.mdt

# @w5/fsline

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

import fsline from '../src/index'

do =>
  n = 0
  for await line from fsline(`import.meta.url.slice(7)`)
    console.log ++n, line
```

output :

```
1 #!/usr/bin/env coffee
2 
3 import fsline from '../src/index'
4 
5 do =>
6   n = 0
7   for await line from fsline(`import.meta.url.slice(7)`)
8     console.log ++n, line
```
