已有 lua 函数 binPack

function u32Le(num)
  local b4 = num % 256; num = (num - b4) / 256;
  local b3 = num % 256; num = (num - b3) / 256;
  local b2 = num % 256; num = (num - b2) / 256;
  local b1 = num % 256; num = (num - b1) / 256;
  return string.char(b1, b2, b3, b4)
end

local binPack = function(li)
  local lenli = {}
  local packed = {}

  for i = 1, #li do
    table.insert(lenli, #li[i])
    table.move(li[i], 1, #li[i], #packed + 1, packed)
  end

  return table.concat({ u32Le(#lenli), lenli, packed })
end

写一个函数，可以吧

参数 li 是一个数组的数组

首先生成

len_li = [ li 中每个数组的长度 ]

len_li_len = 4 个字节无符号整数小端编码 len_li 的 长度

merge = 合并 li 中的所有元素

最后把 len_li_len , len_li 和 merge 合并到一个数组返回
