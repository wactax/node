> @w5/datefmt
  fs > statSync

< (fp)=>
  {mtime} = statSync fp
  datefmt mtime
