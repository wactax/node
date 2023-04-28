
< (li) =>
  result = 0
  for bit, index in li
    result |= bit << index
  result
