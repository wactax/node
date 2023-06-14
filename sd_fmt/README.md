[‼️]: ✏️README.mdt

# @w5/sd_fmt

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/sd_fmt

prompt = ''' a    b,  < lora  :   xxx : 1.3 > c,  ,(  (, x ,  ) )  , [ , xxx ,  , , ]' '''
console.log JSON.stringify(prompt)
console.log JSON.stringify SdFmt prompt
```

output :

```
" a    b,  < lora  :   xxx : 1.3 > c,  ,(  (, x ,  ) )  , [ , xxx ,  , , ]' "
"a b,<lora:xxx:1.3>c,((x)),[xxx]'"
```
