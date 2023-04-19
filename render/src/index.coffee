< (str, args...)=>
  new Function(
    ...args
    "return `#{str}`"
  )

