> ./ms.js

+ NOW

_now = =>
  NOW = ms()
  return

_now()

setInterval(_now,1e3)

dateInt = (n)=>
  =>
    parseInt NOW/n

< Second = => NOW
< Minute = dateInt 60
< Hour = dateInt 3600
< Day = dateInt 86400
