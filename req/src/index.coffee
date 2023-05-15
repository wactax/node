> @w5/retry

TIMEOUT = 20000

< defaultTimeout = (ms)=>
  TIMEOUT = ms
  return

< req = (url, option)=>
  ctrl = new AbortController()

  opt = {
    signal: ctrl.signal
    ...option
  }
  if option
    {timeout} = option

  timer = setTimeout(
    =>
      ctrl.abort()
      return
    timeout or TIMEOUT
  )

  try
    r = await fetch(url, opt)
    if r.status != 200
      throw r
  finally
    clearTimeout(timer)

  return r

< reqTxt = retry (url,option)=>
  (await req(url,option)).text()

< reqJson = retry (url,option)=>
  (await req(url,option)).json()

< reqBin = retry (url,option)=>
  new Uint8Array(
    await (await req(url,option)).arrayBuffer()
  )

export default retry req
