#!/usr/bin/env coffee

import {tranTxt,tranHtm} from '@w5/tran'

LI = "zh-TW en ja th ko hi uk ar tr vi pl nl pt it es de fr ru".split(' ')

for await i from tranHtm(
  [
    "这是正文 **测试**"
    "[1]: https://www.baidu.com"
  ]
  'en'
  'zh'
)
  console.log JSON.stringify(i)
