#!/usr/bin/env coffee


URL = process.env.QDRANT_HTTP + '/'

HEADERS = new Headers()
HEADERS.append("Content-Type", "application/json")
HEADERS.append("api-key", process.env.QDRANT__SERVICE__API_KEY)

func_proxy = (li, method)=>
  new Proxy(
    (body)=>
      url = URL + li.join('/')
      data = {
        method
        headers: HEADERS
        redirect: 'follow'
      }
      if body
        data.body = JSON.stringify body
      text = await (await fetch(
        url
        data
      )).text()
      try
        {status} = r = JSON.parse text
        if status == 'ok'
          return r.result
      throw new Error(text)
      return
    get:(_,suffix)=>
      func_proxy([...li, suffix], method)
  )

export default new Proxy(
  {}
  get:(_,method)=>
    func_proxy([], method)
)

