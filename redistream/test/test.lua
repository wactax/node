#!/usr/bin/env lua

a = { 1, 2 }
r = {}
table.move(a, 1, 2, #r + 1, r)
print(table.concat(r, ","))
-- local merge = function(...)
--   local result = {}
--   for i, arr in ipairs({ ... }) do
--     for j, val in ipairs(arr) do
--       table.insert(result, val)
--     end
--   end
--   return result
-- end
--
-- local intBin = function(n)
--   local t = {}
--   while n > 0 do
--     local r = math.tointeger(math.fmod(n, 256))
--     table.insert(t, r)
--     n = (n - r) / 256
--   end
--   return t
-- end
--
-- local binPack = function(li)
--   local lenli = {}
--   local packed = {}
--
--   for i = 1, #li do
--     table.insert(lenli, #li[i])
--     table.move(li[i], 1, #li[i], #packed + 1, packed)
--   end
--
--   local lenlilen = intBin(#lenli)
--
--   local r = merge(lenlilen, lenli, packed)
--   table.insert(r, 1, #lenlilen)
--   return r
-- end

-- local li = { { 0, 1, 2, 3 }, { 4, 5 }, { 6, 7, 8, 9, 10 } }
-- local res = binPack(li)
--
-- print(table.concat(res, ", "))
-- print(table.concat(intBin(100000), " ,"))
