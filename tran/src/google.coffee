#!/usr/bin/env coffee

> @w5/req/proxy.js
  @w5/req/reqJson.js

OPTION = {
  ...proxy
}

_tran = (url, q_li, to_lang, from_lang)=>
  url += "&tl=#{to_lang}"
  if from_lang
      url+="&sl=#{from_lang}"

  console.log q_li
  body = q_li.map((i) => "q=" + encodeURIComponent(i)).join("&")
  console.log url, OPTION, body
  reqJson(
    url
    {
      headers: {
        "content-type": "application/x-www-form-urlencoded",
      },
      body,
      method: "POST",
      ...OPTION
    },
  )

LIMIT = 2000 # 字符长度限制

tran = (url, q_li, to_lang, from_lang)->
  if not q_li.length
    return []

  # 字符串长度列表
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


API = "https://translate.google.com/translate_a/t?client=gtx"

export tranHtm = tran.bind tran,API + '&format=html'

export tranTxt = tran.bind tran,API


