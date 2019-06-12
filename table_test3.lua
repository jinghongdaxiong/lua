#!/usr/local/bin/lua
-- table 不会固定长度大小，有新数据添加时 table 长度会自动增长，没初始的 table 都是 nil。


a3 = {1,2}
print(#a3)
for i = 1,10 do
    a3[i] = i
end
print(#a3)
print(a3[11])
