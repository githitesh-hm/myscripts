#!/bin/bash

server="ec2-user@ip-172-31-7-53"

#fuction to check disk space

check_disk_space() {
    server=$1
    echo "connecting to $server..."

    ssh "$server" "df -h"	
 
    if [[ $? -ne 0 ]]; then
       echo "Failed to connect to $server."
	 
    fi	 

}
check_disk_space

