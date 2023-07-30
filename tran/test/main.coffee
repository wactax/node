#!/usr/bin/env coffee

import {tranText} from '@w5/tran'

LI = "JA TH KO HI UK AR TR VI PL NL PT IT ES DE FR RU".split(' ')

for to_lang from LI
  for await i from tranText(
    [
      'a image of #'
    ]
    to_lang
    'en'
  )
    console.log JSON.stringify(i)+', # '+to_lang
