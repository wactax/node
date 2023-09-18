[‼️]: ✏️README.mdt

# @w5/tran

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

import {tranTxt} from '@w5/tran'

LI = "ja th ko hi uk ar tr vi pl nl pt it es de fr ru".split(' ')

for to_lang from LI
  for await i from tranTxt(
    [
      'a image of #'
    ]
    to_lang
    'en'
  )
    console.log JSON.stringify(i)+', // '+to_lang
```

output :

```
./out.txt
```
