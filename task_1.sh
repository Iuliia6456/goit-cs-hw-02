#!/bin/bash

websites=("https://google.com/" "https://twitter.com/" "https://twit.com/")

logfile="website_status.log"

> "$logfile"

for site in "${websites[@]}"
do
    if curl -s -L --head --request GET -w "%{http_code}\n" "$site" | grep "200" > /dev/null
    then
        echo "$site is up" >> "$logfile"
    else
        echo "$site is down" >> "$logfile"
    fi
done

echo "Logs saved to $logfile"