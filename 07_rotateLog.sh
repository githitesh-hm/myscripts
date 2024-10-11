#!/bin/bash

log_dir="/var/log/my_service"
log_file="/var/log/my_service/my_service.log"
max_logs=7

#FUNCTION TO ROTATE LOG

rotate_logs() {
       echo "Rotating logs for $log_file in $log_dir"
  
 	#CHECK IF LOG DIER IS EXIST OR NOT
 	  if [[ ! -d  "$log_dir" ]];then
	      echo "log directory $log_dir does not exist."
	      exit 1
	  fi
 	
	#check lof file
	  if [[ ! -f "$log_dir/$log_file" ]];then
		echo "log file $log_file does not exists."
		exit 1	
         fi	
 
 	#ROTATE THE LOG
         timestamp=$(date +"%Y%m%d_%H%m%s")
	 mv "$log_dir/$log-file" "$log_dir/$log_file.$timestamp"
	touch "$log_dir/$log_file"

       #COMPRESS THE LOG
	cd "$log_dir" || exit
	ls -t | grep "log_file." |tail -n +$(max_logs + 1) 
     
 	echo "Log rotation is completed.old logs are co,pressed and retain"
                                          
}
rotate_logs
