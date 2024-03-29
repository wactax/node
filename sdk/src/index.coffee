> msgpackr > unpack

dump = (args)=>
  {length} = args
  if length
    if length == 1
      [a0] = args
      if not Array.isArray a0
        args = a0
    # 不用二进制的 messagepack 的原因是，post 二进制数据需要 form 头，反而更大了
    return JSON.stringify args
  ''

< (Throw)=>
  + sdkUrl

  default_headers = {
    'Content-Type':''
  }

  call = (url, o)=>
    {headers} = o
    if headers
      for [k,v] from Object.entries default_headers
        if k not of headers
          headers[k]=v
    else
      o.headers = default_headers
    try
      r = await fetch(sdkUrl+url,o)
    catch err
      return await Throw err, call, url, o

    if not [200,304].includes(r?.status)
      return await Throw r, call, url, o

    bin = await r.arrayBuffer()
    if bin.byteLength
      return unpack new Uint8Array(bin)
    #, { moreTypes:true int64AsNumber:true }
    return

  init = (url,lang)=>
    sdkUrl = url
    confLang lang
    return

  confLang = (lang)=>
    default_headers['Accept-Language'] = lang or ''
    return

  + opt

  proxy = (prefix)=>
    new Proxy(
      =>
      get:(_,key)=>
        p = prefix
        if p
          p += '.'
        proxy p+key

      set: (_, key, val)=>
        if not opt
          opt = {}
        opt[key] = val
        true

      apply:(_,self,args)=>
        o = {
          credentials: 'include'
          method: 'POST'
        }
        if opt
          Object.assign o, opt
          opt = undefined
        if args.length
          o.body = dump args
        call prefix, o
    )

  [
    proxy('')
    init
    confLang
  ]

