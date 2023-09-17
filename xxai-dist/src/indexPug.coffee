#!/usr/bin/env coffee

> ./env.js > ROOT DIST
  ./distDb.js > dbExist
  @w5/blake3 > blake3Hash
  @w5/cf
  @w5/coffee_plus:hack
  @w5/ossput:put
  @w5/read
  @w5/req/reqTxt.js
  @w5/sleep
  @w5/utf8/utf8e.js
  @w5/write
  coffeescript
  esbuild
  html-minifier-terser > minify
  knex
  path > join
  pug


SH = join ROOT,'sh'

hack coffeescript
{
  CDN
  CLOUDFLARE_KEY
  SITE
  OSSPUT_BUCKET
} = process.env

export default =>
  js = coffeescript.compile(
    read(
      join SH,'index.coffee'
    ).replace(
      'CDN=\'\''
      'CDN=\''+CDN+'\''
    )
    bare:true
  )

  {code:js} = await esbuild.transform(js, {
    minify: true
  })

  js = js.trim().replace(',document.write',';document.write').replace(/;$/,'')

  htm = pug.renderFile(
    join SH,'index.pug'
  )

  htm = await minify htm,{
    collapseWhitespace: true
    html5: true
    minifyCSS: true
    minifyJS: true
    removeAttributeQuotes: true
    removeComments: true
    removeRedundantAttributes: true
    removeScriptTypeAttributes: true
    removeStyleLinkTypeAttributes: true
    useShortDoctype: true
  }
  htm = htm.replace(
    '<script type=module></script>'
    '<script type=module>'+js+'</script>'
  )

  prehtm_fp = join DIST, 'index.htm'
  prehtm = read prehtm_fp

  if not prehtm.includes 'document.write'
    end = prehtm.lastIndexOf '></script>'
    begin = prehtm.lastIndexOf('/',end)+1
    v = prehtm.slice(begin, end)
    fp = 'v'
    hash = blake3Hash utf8e v
    add = await dbExist fp, hash
    if add
      if OSSPUT_BUCKET
        await put(
          fp
          =>
            v
          'text/js'
        )
      if CLOUDFLARE_KEY
        cdn = 'https:'+CDN
        {hostname} = new URL(cdn)
        [{id}] = await cf.GET('?name='+hostname)
        url = cdn+fp
        n = 0
        headers = {}
        if SITE
          headers.Origin = "https://"+SITE
        loop
          console.log "清理cloudflare缓存 ， 第 #{++n} 次"
          # Why after purge_cache , the data keep old when with origin https://community.cloudflare.com/t/why-after-purge-cache-the-data-keep-old-when-with-origin/553911/4
          await cf.POST id+'/purge_cache', files: [
            url
            {
              url
              headers
            }
          ]
          t = await reqTxt url
          if t == v
            console.log "清理完成 #{url} → #{v}"
            break
          await sleep 1e3
      await add()

  write(
    prehtm_fp
    htm
  )
  return
