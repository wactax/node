[‼️]: ✏️README.mdt

# @w5/tran

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

import {tranText} from '@w5/tran'

for await i from tranText(
  ['测试']
  'en'
  'zh'
)
  console.log i
```

output :

```
test
```
