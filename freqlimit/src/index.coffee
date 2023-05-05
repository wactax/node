> @w5/sleep

< (limit_pre_sec, duration=1e3)=>
  n = 0
  pre = new Date
  ()=>
    now = new Date
    diff = now - pre
    to_end = duration - diff
    if to_end < 0
      n = 0
      pre = now
    else
      if ++n > limit_pre_sec
        await sleep(to_end)
    return

