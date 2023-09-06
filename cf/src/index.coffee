#!/usr/bin/env coffee
> @w5/req/proxy
  @w5/req/reqTxt

{CLOUDFLARE_KEY,CLOUDFLARE_EMAIL} = process.env

export default new Proxy(
  {}
  get:(_, method)=>
    (url, body)=>
      api_url = "https://api.cloudflare.com/client/v4/zones"
      if Array.isArray url
        url = url.join '/'
      if url
        if url.charAt(0) != '?'
          url = '/'+url
        api_url += url
      data = {
        method
        headers: {
          'X-Auth-Email': CLOUDFLARE_EMAIL
          'X-Auth-Key': CLOUDFLARE_KEY
          'Content-Type': 'application/json'
        }
      }
      if body
        data.body = JSON.stringify(body)
      text = await reqTxt(
        api_url
        data
      )
      try
        r = JSON.parse(text)
        if r.success
          return r.result
      throw new Error(text)
      return
)

