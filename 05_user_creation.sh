#!/bin/bash
#CHECK FILE IS PROVIDED OR NOT

if [[ $# -ne 1 ]]
 then
  echo "File is not provided"
  exit 1
fi

user_file=$1

#CHECK FILE IS EXIST OR NOT

if [[ ! -f "$user_file" ]]
 then
  echo "file $user_file not found"
  exit 1
fi

#READ FILE LINE BY LINE

while IFS= read -r username
do
   if [[ -z "$username" ]]
  then
    continue
  fi
 
 if id "$username"
  then
   echo "user $username already exists . skipping"
 else
  sudo useradd "$username"
   if [[ $? -eq 0 ]]; then
    echo "user $username Created succesfully.."
  else
    echo "failed to create user $username"
  fi
 fi
done < "$user_file"


