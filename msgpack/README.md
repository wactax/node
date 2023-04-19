[‼️]: ✏️README.mdt

# @w5/msgpack

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

import {pack,unpack} from '@w5/msgpack'


console.log pack 1
console.log unpack pack 1
```

output :

```
<Buffer 01>
1
```
