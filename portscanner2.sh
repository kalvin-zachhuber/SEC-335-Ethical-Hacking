#!/bin/bash


prefix=$1
portfile=$2
first=1
end=254
echo "ip,port"
	# re constructing my IP
	for last_octet in $(seq $first $end); do
		fullip="${prefix}${last_octet}"


		if timeout .1 bash -c "echo >/dev/tcp/$fullip/$portfile" 2>/dev/null; then
		    echo "The IP $fullip has the following open port,port $portfile"
		else
		     #echo "The IP $fullip has no open DNS port"
		     #Un Comment line above to see failed IPS	
			continue
		fi
	done
