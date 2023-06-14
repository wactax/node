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
      auto_a lora, s.split(':')[1]
    else if not s.includes(' ')
      auto_a embed, s

    if false == escaped
      s = escape(s)
    s
