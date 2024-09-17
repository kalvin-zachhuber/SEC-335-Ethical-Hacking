#!/bin/bash


prefix=$1
dns=$2
first=1
end=254
	# re constructing my IP
	for last_octet in $(seq $first $end); do
	    fullip="${prefix}${last_octet}"
            
            # filtering the output with /dev/null

	    output=$(nslookup $fullip $dns 2>/dev/null)

	    #checking exit status, if 0, than the lookup was succesful and will be displayed

	    if [ $? -eq 0 ]; then
	        echo "$output"
	    fi


		
	done 
