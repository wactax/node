#!/usr/bin/env coffee

> @w5/req/reqTxt
  @w5/req/req
console.log await reqTxt 'http://myip.ipip.net'
r = await req('https://image.civitai.com/xG1nkqKTMzGDvpLrqFT7WA/7cab2bee-5662-46f9-de0f-992437662a00/width=0')
console.log r.headers.get('content-type').split('/').pop()
