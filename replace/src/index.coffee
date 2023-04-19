  < (html, begin, end, func)=>
    p = html.indexOf begin
    if p < 0
      return
    p+=(begin.length)
    e = html.indexOf end,p
    if e < 0
      return
    html[...p]+func(html[p...e])+html[e..]
