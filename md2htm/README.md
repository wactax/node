[‼️]: ✏️README.mdt

# @w5/md2htm

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

import md2htm from '@w5/md2htm'

console.log await md2htm '''# hi
[a](./&>)
'''
```

output :

```
<h1>hi</h1>
<p><a href="./&amp;%3E">a</a></p>
```
