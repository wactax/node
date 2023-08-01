< (s, args...)=>
  for f from s
    try
      f(...args)
    catch err
      console.error(err)
  return
