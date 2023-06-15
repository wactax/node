[‼️]: ✏️README.mdt

# @w5/cid

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

import * as CID from '@w5/cid'

for [k,v] from Object.entries CID
  console.log k,v
```

output :

```
CID_IMG 2
CID_USER 1
```
