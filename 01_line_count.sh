#!/bin/bash

filename=$1

if [[ ! -f "$filename" ]]
 then 
   echo "file not found:$filename"
fi
 
line_count=$(wc -l > "$filename")

echo "The file '$filename' contains $line_count lines"



