#!/bin/bash

process_name="sleep 100s"

start_command="home/ec2-user/myscripts/sleep 100s"

if pgrep -x "process_name"
 then 
  echo "process $process_name is Running.."
else
 echo "process $process_name is not Running.Starting it..."
 $start_command &

if [[ $? -eq 0 ]]
 then echo "$process_name started succesfully"

else
 echo "$process_name not started yet.."
fi
fi

