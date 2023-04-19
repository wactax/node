C_STYLE_COMMENT = /\/\*[\s\S]*?\*\/|([^:\/\/])\/\/.*$/gm

cStyleComment = (txt, translate)=>
  li = []

  txt.replace(
    C_STYLE_COMMENT
    (match)=>
      if match.startsWith '/*'
        li.push match[2...-2]
      else
        pos = match.indexOf("//")
        li.push match[pos+2..]
      return ''
  )

  if not li.length
    return txt

  li = (
    await translate(i) for i from li
  )

  txt.replace(
    C_STYLE_COMMENT
    (match, mlc, slc)=>
      if match.startsWith '/*'
        return "/*"+li.shift()+"*/"
      else
        pos = match.indexOf("//")
        return match[...pos+2]+li.shift()
      match
  )

comment = {
  rust:cStyleComment
}
