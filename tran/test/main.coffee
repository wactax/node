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
