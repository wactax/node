[‼️]: ✏️README.mdt

# @w5/req

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/req:@ > reqTxt

console.log await reqTxt 'http://myip.ipip.net'
r = await req('https://image.civitai.com/xG1nkqKTMzGDvpLrqFT7WA/7cab2bee-5662-46f9-de0f-992437662a00/width=0')
console.log r.headers.get('content-type').split('/').pop()
```

output :

```
当前 IP：222.249.139.70  来自于：中国 北京 北京  电信

png
```
