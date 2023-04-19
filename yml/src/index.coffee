> js-yaml:yaml
  @w5/read
  @w5/write

{load:loads,dump:dumps} = yaml

< loads = loads
< dumps = dumps

< load = (fp)=>
  loads read fp

< dump = (fp, o)=>
  write fp, dumps(o)

