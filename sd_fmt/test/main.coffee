#!/usr/bin/env coffee

> @w5/sd_fmt

prompt = ''' a    b,  c,  ,(  x   )  , [ xxx ]' '''
console.log JSON.stringify(prompt)
console.log JSON.stringify SdFmt prompt
