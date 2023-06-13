> @w5/pair

LI = pair [
  '&', 'amp',
  '<', 'lt',
  '>', 'gt',
  '"', 'quot',
  "'", '#39'
]

< (txt)=>
  for [t,h] from LI
    txt = txt.replaceAll(t,'&'+h+';')
  txt
