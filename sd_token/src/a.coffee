#!/usr/bin/env coffee

> ./index.js:sdToken
  @w5/escape


< (txt, lora, embed)=>
  sdToken txt,(s)=>
    escaped = false

    auto_a = (m, t)=>
      url = m.get(t) or m.get(t.toLocaleLowerCase())
      if url
        escaped = true
        s = """<a href="#{url}">#{escape s}</a>"""
      return

    if s.startsWith('<')
      li = s.split(':')
      if li.length > 1
        auto_a lora, li[1]
      else
        auto_a embed, li[0].slice(1).replaceAll('>','').trim()
    else
      auto_a embed, s

    if false == escaped
      s = escape(s)
    s
