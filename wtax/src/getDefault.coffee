Map::getDefault = (key, init) ->
  r = @get key
  if r == undefined
    r = init()
    @set key,r
  r

