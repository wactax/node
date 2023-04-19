> ./index.js:render

String.prototype.render = (args...) ->
  d = args[0]
  if d instanceof Object
    r = render(this, ...Object.keys(d)) ...Object.values(d)
  else
    r = @replace(
      /\${(\d+)}/g
      (_, n)=> args[n]
    )
  r
