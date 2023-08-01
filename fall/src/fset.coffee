< (s, args...)=>
  for i from s
    try
      s(...args)
    catch err
      console.error(err)
  return
