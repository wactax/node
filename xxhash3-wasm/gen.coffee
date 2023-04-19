#!/usr/bin/env coffee

> ./pkg/_.cjs:pkg
  fs > writeFileSync
  @w5/uridir
  path > join

ROOT = uridir import.meta

txt = []
li = []

for i of pkg
  if not i.startsWith('_')
    li.push "#{i} as _#{i}"
    txt.push "export const #{i} = wrap(_#{i})"

txt.unshift """import {#{li.join(',')}} from './_.cjs'

const encoder = new TextEncoder(),
  encode = encoder.encode.bind(encoder),
  wrap = (func)=>{
    return (txt)=>{
      if (typeof txt  === 'string' || txt instanceof String){
        txt = encode(txt);
      }
      return func(txt)
    }
  }
"""

writeFileSync(
  join ROOT,'pkg/index.js'
  txt.join('\n')
)

