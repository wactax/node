[‼️]: ✏️README.mdt

# @w5/tran

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

import {tranTxt} from '@w5/tran'

LI = "zh-TW en ja th ko hi uk ar tr vi pl nl pt it es de fr ru".split(' ')

for to_lang from LI
  for await i from tranTxt(
    [
      '测试 #'
    ]
    to_lang
    'zh'
  )
    console.log JSON.stringify(i)+', // '+to_lang
```

output :

```
use https_proxy http://127.0.0.1:7890
"測試 #", // zh-TW
"test #", // en
"テスト ＃", // ja
"ทดสอบ #", // th
"시험 #", // ko
"परीक्षा #", // hi
"тест #", // uk
"امتحان #", // ar
"Ölçek #", // tr
"Bài kiểm tra #", // vi
"test #", // pl
"test #", // nl
"teste #", // pt
"test #", // it
"prueba #", // es
"prüfen #", // de
"test #", // fr
"тест #", // ru
```
