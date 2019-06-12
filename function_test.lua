#!/usr/local/bin/lua
--在 Lua 中，函数是被看作是"第一类值（First-Class Value）"，函数可以存在变量里:

-- 阶乘函数
function factorial1(n)
    if n == 0 then
        return 1
    else 
        return n * factorial1(n-1)
    end
end
print(factorial1(5))
factorial2 = factorial1
print(factorial2(5))
