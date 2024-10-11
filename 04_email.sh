#!/bin/bash

limit=80

Email="hiteshmore0706@gmail.com"

#GET DISK USAGE PERCENTAGE

usage=$(df / | grep total: |awk '{print 4}')

if [[ "$usage" -gt "$limit" ]]
 then
    subject="Disk usage Alert:$(usage)%"
    body="Warning:disk usage has excceeded : ${limit}%"
    echo "$body" | mail -s "$subject" "$Email"
fi

