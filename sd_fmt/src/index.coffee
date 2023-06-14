< (p)=>
  if not p
    return ''
  p.replace(/\s+/g,' ').replace(/[, ]+$/g,'').replace(/\s*([,()[\]])\s*/g,'$1').replace(/,+/g,',').replace(/([[(]),/g,'$1').replace(/,([\])])/g,'$1').trim()

