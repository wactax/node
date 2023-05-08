[‼️]: ✏️README.mdt

# @w5/utf8

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

import utf8e from '@w5/utf8/utf8e'
import utf8d from '@w5/utf8/utf8d'
import autoe from '@w5/utf8/autoe'

console.log utf8d utf8e '测试'

console.log autoe '车'
console.log autoe Buffer.from [1,2,3]
```

output :

```
测试
```
