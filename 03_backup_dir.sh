#!/bin/bash

source_dir="/home/ec2-user/myscripts/"
backup_dir="/home/ec2-user/myscripts/backup"

timestamp=$(date +%Y%m%d_%H%m%s)

#BACKUP FILE NAME

backup_file="$backup_dir/backup_$timestamp.tar.gz"

cd "$backup_dir"

#COMPRESSED BACKUP

tar -czf "$backup_file" -c "$source_dir"

if [[ $? -eq 0 ]]
 then
  echo "backup succesfull:$backup_file"
else
  echo "Backup failed"
fi

