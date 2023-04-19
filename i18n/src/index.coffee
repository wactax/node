#!/usr/bin/env coffee

> @w5/lang
  ./yml.js > translateYmlDir
  @w5/walk
  @w5/yml/Yml.js
  fs > existsSync
  get_default:
  path > dirname join basename
  @w5/trmd
  chalk

{
  gray
  yellowBright
} = chalk

< default main = (
  now
  hook={
    yml:(dir, default_lang)=>
    md:(root, file, lang)=>
  }
)=>
  to_from = new Map
  from_to = new Map

  loop
    dir = dirname now
    if existsSync join now, 'i18n.yml'
      {i18n:conf} = Yml(now)
      for [k,v] from Object.entries(conf)
        if v
          for i from v.split ' '
            to_from.set i, k
            from_to.get_default(k,[]).push i
        else
          to_from.set undefined, k
      break
    if dir == now
      return
    now = dir

  default_lang = to_from.get()
  to_from.delete()

  li = from_to.get 'zh'
  if li
    li.push 'zh-TW'
  to_lang = new Set()
  for li from from_to.values()
    for i from li
      to_lang.add i

  now_len = now.length

  default_src = to_from.get(default_lang) or default_lang

  for await fp from walk(
    now
    (d)=>
      b = basename d
      b.startsWith('.') or b == 'node_modules'
  )
    rfp = fp[now_len..]
    dir = dirname(fp)

    if fp[dir.length+1..] == default_src+'.yml'
      pos = rfp.indexOf('/i18n/')
      if pos < 0
        pos = rfp.indexOf('.i18n/')

      if pos >= 0
        pos += 6
        console.log yellowBright "\n❯ #{dir} translate begin"
        await translateYmlDir dir, to_from, default_lang
        await hook.yml dir, default_lang
        console.log gray "❯ #{dir} translated\n"
    else if fp.endsWith('.md')
      lang_fp = '/'+default_src+'/'
      pos = rfp.indexOf lang_fp
      if ~ pos
        workdir = now + rfp.slice(0, pos+1)
        file = rfp.slice(pos+lang_fp.length)
        lang_set = new Set(lang.map((i)=>i[0]))

        mdfp = (lang)=>
          join(workdir, lang, file)

        tran = (src, to_li)=>
          for i from to_li
            lang_set.delete i

          await trmd(
            mdfp src
            mdfp
            src
            to_li
          )
          return

        if default_src != default_lang
          lang_set.delete default_src
          await tran(
            default_src
            from_to.get default_src
          )

        for [f,t] from from_to.entries()
          if f == default_src
            continue
          await tran f, t
        await tran default_lang, [...lang_set]
        hook.md(
          workdir
          file
          lang
        )

  return

