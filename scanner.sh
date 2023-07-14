#!/bin/bash
# This script checks the status of a range of hosts using the ping command.
# The timeout for the ping command is 1 second.
# The child processes created by the is_alive_ping function are disowned.

echo "Starting.."

function is_alive_ping() {
  local ip=$1
  ping -c 1 -W 1 "$ip" > /dev/null
  if [ $? -eq 0 ]; then
    echo "$ip,Up"
  else
    echo "$ip,Down"
  fi
}

# 192.168.1.10
for i in {2..10}; do
  is_alive_ping "1.1.1.$i" &
done

wait