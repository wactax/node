#!/usr/bin/env coffee

> @w5/walk > walkRel
  @w5/write
  path > resolve basename join
  ./render.js
  chalk

{ gray } = chalk

< default main = (dir)=>
  for await i from walkRel(
    dir
    (i)=>
      name = basename(i)
      name == 'node_modules' or  name.startsWith('.')
  )
    if i.endsWith('.mdt')
      fp = join dir, i
      console.log gray fp + ' → ' + i[..-2]
      write(
        fp[..-2]
        "[‼️]: ✏️#{i}\n\n"+await render fp
      )
  return

