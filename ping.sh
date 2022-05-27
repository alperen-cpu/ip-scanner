#!/bin/bash

is_alive_ping()
{
  ping -c 1 $1 > /dev/null
  [ $? -eq 0 ] && echo $i,Up
  [ $? -eq 1 ] && echo $i,Down
}

for i in 32.33.34.{160..190}
do
is_alive_ping $i & disown
done
