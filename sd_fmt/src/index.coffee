< (p)=>
  p.replace(/\s+/g,' ').replace(/[, ]+$/g,'').replace(/\s*([,()[\]])\s*/g,'$1').replace(/,+/g,',').trim()

