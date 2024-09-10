#!/bin/bash


hostfile=$1
portfile=$2
echo "host,port"
for host in $(cat $hostfile); do
	#taking the last octect of the given IP addresses
	last_set=$(echo $host | awk -F. '{print $4}')
	#checking if my IP is in my "valid" range
	if [[ $host == 10.0.5.* && $last_set -ge 20 && $last_set -le 30 ]]; then
		for port in $(cat $portfile); do
			timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null && echo "The IP $host has the following open port,port $port"
		done
	else
		echo "Invalid IP detected, flagged IP: $host"
	fi
done
