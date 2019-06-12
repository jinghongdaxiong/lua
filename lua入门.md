# Lua 基本语法

## 第一个 Lua 程序

### 交互式编程

Lua提供了交互式编程模式.我们可以在命令行中输入程序并立即查看效果.
Lua交互式编程模式可以通过lua -i或lua来启用:

    $ lua -i
    $ Lua 5.3.0  Copyright (C) 1994-2015 Lua.org,PUC-Rio
    >

在命令行中，输入以下命令:

    > print("Hello World！")

接着我们按下回车键，输出结果如下：

    > print("Hello World！")
    Hello World！
    >

### 脚本式编程

我们可以将 Lua 程序代码保持到一个以 lua 结尾的文件，并执行，该模式称为脚本式编程，如我们将如下代码存储在名为 hello.lua 的脚本文件中：

    print("Hello World！")
    print("www.runoob.com")
使用 lua 名执行以上脚本，输出结果为：

    $ lua hello.lua
    Hello World！
    www.runoob.com
我们也可以将代码修改为如下形式来执行脚本（在开头添加：#!/usr/local/bin/lua）：

    #!/usr/local/bin/lua

    print("Hello World！")
    print("www.runoob.com")
以上代码中，我们指定了 Lua 的解释器 /usr/local/bin directory。加上 # 号标记解释器会忽略它。接下来我们为脚本添加可执行权限，并执行：

    ./hello.lua
    Hello World！
    www.runoob.com

## 注释
### 单行注释
两个减号是单行注释:

    --
### 多行注释
    --[[
    多行注释
    多行注释
    --]]
## 标示符
Lua 标示符用于定义一个变量，函数获取其他用户定义的项。标示符以一个字母 A 到 Z 或 a 到 z 或下划线 _ 开头后加上0个或多个字母，下划线，数字（0到9）。

最好不要使用下划线加大写字母的标示符，因为Lua的保留字也是这样的。

Lua 不允许使用特殊字符如 @, $, 和 % 来定义标示符。 Lua 是一个区分大小写的编程语言。因此在 Lua 中 Runoob 与 runoob 是两个不同的标示符。以下列出了一些正确的标示符：

    mohd         zara      abc     move_name    a_123
    myname50     _temp     j       a23b9        retVal

## 关键词
以下列出了 Lua 的保留关键字。保留关键字不能作为常量或变量或其他用户自定义标示符：

    and	break	do	else
    elseif	end	false	for
    function	if	in	local
    nil	not	or	repeat
    return	then	true	until
    while
一般约定，以下划线开头连接一串大写字母的名字（比如 _VERSION）被保留用于 Lua 内部全局变量。

## 全局变量
在默认情况下，变量总是认为是全局的。

全局变量不需要声明，给一个变量赋值后即创建了这个全局变量，访问一个没有初始化的全局变量也不会出错，只不过得到的结果是：nil。

    > print(b)
    nil
    > b=10
    > print(b)
    10
    >
如果你想删除一个全局变量，只需要将变量赋值为nil。

    b = nil
    print(b)      --> nil
这样变量b就好像从没被使用过一样。换句话说, 当且仅当一个变量不等于nil时，这个变量即存在。

# Lua 数据类型
Lua 是动态类型语言，变量不要类型定义,只需要为变量赋值。 值可以存储在变量中，作为参数传递或结果返回。

Lua 中有 8 个基本类型分别为：nil、boolean、number、string、userdata、function、thread 和 table。

| 数据类型 | 描述|
| :-- | :-- |
| nil | 这个最简单，只有值nil属于该类，表示一个无效值（在条件表达式中相当于false）。 |
| boolean | 包含两个值：false和true。|
| number | 表示双精度类型的实浮点数 |
| string | 字符串由一对双引号或单引号来表示 |
| function | 由 C 或 Lua 编写的函数 |
| userdata | 表示任意存储在变量中的C数据结构 |
| thread | 表示执行的独立线路，用于执行协同程序 |
| table | Lua 中的表（table）其实是一个"关联数组"（associative arrays），数组的索引可以是数字、字符串或表类型。在 Lua 里，table 的创建是通过"构造表达式"来完成，最简单构造表达式是{}，用来创建一个空表。|

我们可以使用 type 函数测试给定变量或者值的类型：

    print(type("Hello world"))      --> string
    print(type(10.4*3))             --> number
    print(type(print))              --> function
    print(type(type))               --> function
    print(type(true))               --> boolean
    print(type(nil))                --> nil
    print(type(type(X)))            --> string

## nil（空）
nil 类型表示一种没有任何有效值，它只有一个值 -- nil，例如打印一个没有赋值的变量，便会输出一个 nil 值：

    > print(type(a))
    nil
    >
对于全局变量和 table，nil 还有一个"删除"作用，给全局变量或者 table 表里的变量赋一个 nil 值，等同于把它们删掉，执行下面代码就知：

    tab1 = { key1 = "val1", key2 = "val2", "val3"}
    for k,v in pairs(tab1) do
        print(k .. "-" ..v)
    end

    tab1.key1 = nil
    for k, v in pairs(tab1) do
        print(k .. " - " .. v)
    end
### nil 作比较时应该加上双引号 "：
    > type(X)
    nil
    > type(X)==nil
    false
    > type(X)=="nil"
    true
    >
type(X)==nil 结果为 false 的原因是因为 type(type(X))==string。

## boolean（布尔）
boolean 类型只有两个可选值：true（真） 和 false（假），Lua 把 false 和 nil 看作是"假"，其他的都为"真":

    print(type(true))
    print(type(false))
    print(type(nil))

    if false or nil then
        print("至少有一个是 true")
    else
        print("false 和 nil 都为 false!")
    end
以上代码执行结果如下：

    $ lua test.lua
    boolean
    boolean
    nil
    false 和 nil 都为 false!

## number（数字）
Lua 默认只有一种 number 类型 -- double（双精度）类型（默认类型可以修改 luaconf.h 里的定义），以下几种写法都被看作是 number 类型：

    print(type(2))
    print(type(2.2))
    print(type(0.2))
    print(type(2e+1))
    print(type(0.2e-1))
    print(type(7.8263692594256e-06))
以上代码执行结果：

    number
    number
    number
    number
    number
    number
## string（字符串）
字符串由一对双引号或单引号来表示。

    string1 = "this is string1"
    string2 = 'this is string2'
也可以用 2 个方括号 "[[]]" 来表示"一块"字符串。

    html = [[
    <html>
    <head></head>
    <body>
        <a href="http://www.runoob.com/">菜鸟教程</a>
    </body>
    </html>
    ]]
    print(html)
以下代码执行结果为：

    <html>
    <head></head>
    <body>
        <a href="http://www.runoob.com/">菜鸟教程</a>
    </body>
    </html>
在对一个数字字符串上进行算术操作时，Lua 会尝试将这个数字字符串转成一个数字:

    > print("2" + 6)
    8.0
    > print("2" + "6")
    8.0
    > print("2 + 6")
    2 + 6
    > print("-2e2" * "6")
    -1200.0
    > print("error" + 1)
    stdin:1: attempt to perform arithmetic on a string value
    stack traceback:
            stdin:1: in main chunk
            [C]: in ?
    >

以上代码中"error" + 1执行报错了，字符串连接使用的是 .. ，如：

    > print("a" .. 'b')
    ab
    > print(157 .. 428)
    157428
    >
用#来计算字符串的长度,放在字符串前面如下

    > len = "www.xiaohe.com"
    > print(#len)
    14
    >

## table(表)
在lua中table的创建是通过构造表达式来完成,最简单的构造
表达式是{},用来创建一个空表.也可以在表里添加一些数据,直接
初始化表:

    --创建一个空table
    local tab1 = {}

    直接初始化表
    local tab2 = {"apple","pear","orange","grape"}

### lua中的表(table)其实是一个关联数组associactive array,数组的索引可以是数字或者字符串

    --table_test.lua 脚本文件
    a = {}
    a["key"] = "value"
    key = 10
    a[key] = 22
    a[key] = a[key] + 11
    for k, v in pairs(a) do
        print(k.. ":" --v)
    end
脚本的执行结果

    lua table_test.lua
    10:33
    key:value

### 不同于其他把数组0作为数组的初始索引,在lua中表的初始索引一般以1开始
    --table_test2.lua
    local tbl = {"apple","pear","orange","grape"}
    for k, v in pairs(tbl) do
        print("key",key)
    end

脚本执行结果为：

    $ lua table_test2.lua
    Key    1
    Key    2
    Key    3
    Key    4
### table不会固定长度大小,有新数据添加时,table长度会自动增长,没初始的table都是nil

    a3 = {1,2}
    print(#a3)
    for i = 1,10 do
        a3[i] = i
    end
    print(#a3)
    print(a3[11])

## function(函数)

### 在lua中,函数是被看做为第一类值(First-Class Value),函数可以存在变量里


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
### function可以以匿名函数(anonymous function)的方式通过参数传递

    function testFun(tab,fun)
        for k,v in pairs(tab) do
            print(fun(k,v))
        end























