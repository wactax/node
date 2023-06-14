#!/usr/bin/env coffee

> @w5/sd_fmt

prompt = ''' a    b,  < lora  :   xxx : 1.3 > c,  ,(  (, x ,  ) )  , [ , xxx ,  , , ]' '''
console.log JSON.stringify(prompt)
console.log JSON.stringify SdFmt prompt
