#!/usr/bin/env coffee

> @w5/read
  @w5/write
  @w5/uridir
  path > join

ROOT = uridir(import.meta)

js_fp = join ROOT,'pkg/_.js'
js = read(js_fp)
class_li = []
for line from js.split '\n'
  if line.startsWith 'export class'
    class_li.push(line.slice(13,-1).trim())

js += "const newCls = (cls)=>(...args)=>new cls(...args);"
for i from class_li
  f = i.charAt(0).toLowerCase() + i.slice(1)
  js += """
export const #{f} = newCls(#{i});
"""

write(
  js_fp
  js
)
