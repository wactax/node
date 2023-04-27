< (li)=>
  li.sort => Math.random() - 0.5
  gen = ->
    loop
      for i from li
        yield i
    return
  iter = gen()
  ->
    iter.next().value
