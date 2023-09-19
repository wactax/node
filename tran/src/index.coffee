#!/usr/bin/env coffee

> ./google.js > tranHtm:_tranHtm tranTxt:_tranTxt
  @w5/j2f

wrap = (func)=>
  (q_li, to_lang, from_lang)=>
    if from_lang == 'zh' and to_lang == 'zh-TW'
      return q_li.map (i)=>j2f(i)
    return func(q_li, to_lang, from_lang)

export tranHtm = wrap _tranHtm

export tranTxt = wrap _tranTxt
