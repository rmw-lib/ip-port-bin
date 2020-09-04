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
