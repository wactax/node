[‼️]: ✏️README.mdt

# @w5/pair

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

import pair from '@w5/pair'
import group from '@w5/pair/group.js'

console.log pair '1|2|3|4|5|6'.split('|')
console.log group 3,'1|2|3|4|5|6'.split('|')
```

output :

```
[ [ '1', '2' ], [ '3', '4' ], [ '5', '6' ] ]
[ [ '1', '2', '3' ], [ '4', '5', '6' ] ]
```
