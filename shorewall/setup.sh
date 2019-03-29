#!/bin/bash

#Gets all interfaces currently available into the 'interfaces' variable
mapfile -t interfaces < <(ip a | sed -rn 's/[1-9]:\s+(\w+)(.*)/\1/p')
interfaces+=('default')

#Query user to select the interface destinted to be the net interface
PS3='Select the interface for the WAN: '
select option in "${interfaces[@]}";
do
	if [[ $option == "default" ]]; then
		echo "Using default settings."
		break
	fi
	echo -e "#ZONE		INTERFACE		BROADCAST\nnet	$option" > shorewall/interfaces
	echo "Added $option as the WAN interface"
	break
done
