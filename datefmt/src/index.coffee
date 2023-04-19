pad = (i)=>
  (i+'').padStart(2,'0')

< (date) =>
  year = date.getFullYear()
  month = date.getMonth() + 1
  day = date.getDate()
  "#{year}-#{pad month}-#{pad day}"

