#!/bin/bash
echo starting...
is_alive_ping()
{
  ping -c 1 $1 > /dev/null
  [ $? -eq 0 ] && echo $i,Up
  [ $? -eq 1 ] && echo $i,Down
}

for i in 12.13.14.{160..190} #example 192.168.1.{10..20}
do
is_alive_ping $i & disown
done
