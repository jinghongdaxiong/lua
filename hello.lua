#!/usr/local/bin/lua

tab1 = { key1 = "val1", key2 = "val2", "val3"}
for k,v in pairs(tab1) do
    print(k .. "-" ..v)
end

tab1.key1 = nil
for k,v in pairs(tab1) do
    print(k .. "-" ..v)
end

--这是单行注释
print("Hello Word!")
--[[
这是多行
注释
--]]
print("www.runoob.com")
print(type("Hello world"))
print(type(10.4*3))
print(type(print))
print(type(type))
print(type(true))
print(type(nil))
print(type(type(X)))