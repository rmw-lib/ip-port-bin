#!/usr/bin/env coffee

import ipaddr from 'ipaddr.js'
import {encode,decode} from '@rmw/zipint'

{fromByteArray, parse} = ipaddr

export ip_port_str = (ip, port)=>
  if ip.indexOf(":")+1
    ip = "[#{ip}]"
  if port
    ip += (":"+port)
  ip

export str_ip_port = (ip_port)=>
  pos = 1+ip_port.indexOf(']')
  if pos
    r = [ip_port[1...pos-1]]
    if pos != ip_port.length
      r.push ip_port[pos+1..]
  else
    r = ip_port.split(':',2)

  if r[1]
    r[1] = parseInt r[1]

  return r

export ip_port_bin = (ip, port)=>
  li = parse(ip).toByteArray()
  buf = Buffer.from(li)
  buflen = buf.length
  t = []
  n = 0
  while n < buflen
    t.push buf.readUInt32BE n
    n+=4
  if port
    t.push port
  t = encode t
  return Buffer.from t

export bin_ip_port = (bin)=>
  li = decode bin
  len = li.length
  if len == 2 or len == 5
    port = li.pop()
    --len
  i = 0
  buf = Buffer.allocUnsafe(len*4)
  while i < len
    buf.writeUInt32BE li[i], i*4
    ++i
  r = [fromByteArray(buf)+'']
  if port
    r.push port
  return r


