<!-- 本文件由 ./readme.make.md 自动生成，请不要直接修改此文件 -->

# @rmw/ip-port-bin

##  安装

```
yarn add @rmw/ip-port-bin
```

或者

```
npm install @rmw/ip-port-bin
```

## 使用

```
#!/usr/bin/env coffee

import {ip_port_str, str_ip_port, ip_port_bin, bin_ip_port} from '../src/index'

do =>
  for ip_port in [
    "[2001:0db8::0001]:422"
    "[2001:0db8::0001]"
    "[2000:0000:0000:0000:0001:2345:6789:abcd]:61232"
    "127.0.0.1:80"
    "245.14.12.232"
  ]
    [ip, port] = str_ip_port ip_port
    bin = ip_port_bin(ip, port)
    console.log ip , port or '', "=",  ip_port_str ...bin_ip_port(bin)
    console.log ip_port.length, ">", bin.length+"\n"

```

## 输出

```
2001:0db8::0001 422 = [2001:db8::1]:422
21 > 10

2001:0db8::0001  = [2001:db8::1]
17 > 8

2000:0000:0000:0000:0001:2345:6789:abcd 61232 = [2000::1:2345:6789:abcd]:61232
47 > 17

127.0.0.1 80 = 127.0.0.1:80
12 > 6

245.14.12.232  = 245.14.12.232
13 > 5


```

## 关于

本项目隶属于**人民网络([rmw.link](//rmw.link))** 代码计划。

![人民网络](https://raw.githubusercontent.com/rmw-link/logo/master/rmw.red.bg.svg)
