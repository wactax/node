#!/usr/bin/env coffee

> @w5/req/proxy
  @w5/req/reqJson

OPTION = {
  ...proxy
}

_tran = (url, q_li, to_lang, from_lang)=>
  url += "&tl=#{to_lang}"
  if from_lang
      url+="&sl=#{from_lang}"
  reqJson(
    url
    {
      headers: {
        "content-type": "application/x-www-form-urlencoded",
      },
      body: q_li.map((i) => "q=" + encodeURIComponent(i)).join("&"),
      method: "POST",
      ...OPTION
    },
  )

LIMIT = 2000

tran = (url, q_li, to_lang, from_lang)->
  if not q_li.length
    return []

  li = []
  for i from q_li
    li.push i.length
  li.push LIMIT

  pre = 0
  c = li[0]

  t = []

  t_tran = =>
    _tran(url, t, to_lang, from_lang)

  for i,pos in q_li
    t.push i
    next = li[pos+1]
    c += next
    if c > LIMIT
      c = next
      yield from await t_tran()
      t = []

  return


API = "https://translate.google.com/translate_a/t?client=gtx&sr=1&v=1.0"

export tranHtm = tran.bind tran,API + '&format=html'

export tranTxt = tran.bind tran,API


