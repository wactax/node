[‼️]: ✏️README.mdt

# @w5/iter2file

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

import iter2file from '@w5/iter2file'

iter2file(
  'out.txt'
  ->
    n = 0
    while ++n < 5
      yield n+'\n'
)
```

output :

```
1
2
3
4
```
