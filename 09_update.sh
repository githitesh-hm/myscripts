#!/bin/bash

logfile="/var/log/system_update.log"

echo "Starting the systemupdate"

#CHECK FOR UPDATES

if sudo apt-get update >> "$logfile"; then
  echo "package list update succesfully."
else 
  echo "Failed to update package list"
  exit 1
fi

#UPGRADE PACKAGE

if sudo apt-get upgrade -y >> "$logfile"; then
 echo "package upgrade successfully."
else
 echo "Failed to upgrade package"
fi

 
