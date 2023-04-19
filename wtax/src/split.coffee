< rsplit = (str, split)=>
  p = str.lastIndexOf(split)
  if p >= 0
    suffix = str[p+1..]
    str = str[..p-1]
  else
    suffix = ''
  return [str, suffix]

< split = (str, split)=>
  p = str.indexOf(split)
  if p >= 0
    suffix = str[p+1..]
    str = str[..p-1]
  else
    suffix = ''
  return [str, suffix]

export default split
