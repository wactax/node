#!/usr/bin/env coffee

import {tranText} from '@w5/tran'

for await i from tranText(
  ['测试']
  'en'
  'zh'
)
  console.log i
