#!/bin/bash

server_name="httpd"
html_file="/var/www/html/index.html"
deploy_path="/var/www/html" #the directory where html file will be deploy

#FUNCTION TO CHECK SERVER IS RUNNING OR NOT

check_server() {
      if systemctl is-active --quiet "$server_name"; then
         echo "$server_name is Running.."
         return 0
     else
         echo "$server_name is not running.starting the server..."
         sudo systemctl start "$server_name"
	
	#CHECK AGAIN SERVER
  	if systemctl is-active --quiet "$server_name";then
	   echo "$server_name started successfully.."
	   return 0

     	else
 	   echo "Failed to start the server $server_name"
	   exit 1
 	fi
     fi	
}

#FUCTION TO DEPLOY THE HTML FILE
deploy_file() { 
	if [[ -f $html_file ]]
	  then
 	    echo "Deploying $html_file to $deploy_path.."
            sudo cp "$html_file" "$deploy_parth/"
	    echo "deploy Successfull..."
	else
 	    echo "Error:$html_file does not exist.exiting"
            exit 1
        fi
}
check_server
deploy_file
