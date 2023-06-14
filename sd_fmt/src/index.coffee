< (p)=>
  if not p
    return ''
  p.replace(/\s+/g,' ').replace(/[, ]+$/g,'').replace(/\s*([,()[\]])\s*/g,'$1').replace(/,+/g,',').replace(/([[(])\s*,/g,'$1').replace(/,\s*([\])])/g,'$1').trim()

