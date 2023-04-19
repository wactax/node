< (md)=>
  md.replace(
    /\[([^\]]+)\]\(([^)]+)\)/g
    (_,text,link)=>
      """#{text}(#{link})"""
  )
