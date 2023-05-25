TIMEOUT = 20000

< defaultTimeout = (ms)=>
  TIMEOUT = ms
  return

export default (url, option)=>
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
