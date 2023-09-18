_load = (txt)=>
  + r

  padding_li = []
  for line,pos in txt
    line = line.trimEnd()
    {length} = line
    line = line.trimStart()
    padding = length - line.length
    console.log pos
  r

< load = (txt)=>
  li = []
  for line from txt.replaceAll('\r\n','\n').replaceAll('\n','\n').split('\n')
    if line.trimStart().startsWith '#'
      continue
    li.push line
  _load(li)

    # if line.startsWith '- '
    #   line = line.slice(2).trimStart()
    #   if li
    #     li.push line
    #   else
    #     li = [line]
    #     if r == undefined
    #       r = li
    # else
    #   p = line.indexOf ':'
    #   if ~ p
    #     key = line.slice(0,p).trimEnd()
    #     val = line.slice(dkey+1).trimStart()
    #     if val
    #       if map
    #         map[key] = val
    #       else
    #         r

      # dkey = line.slice(0,-1).trimEnd()

