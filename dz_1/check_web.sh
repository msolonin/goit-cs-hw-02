#!/bin/bash

WEB_SITES=("https://www.google.com" "https://www.facebook.com" "https://twitter.com" )
FILE_NAME="website_status.log"

for web_site in "${WEB_SITES[@]}"
do
  if curl -s -L --head --request GET "$web_site" | grep "HTTP" | grep "200" > /dev/null
  then
    echo "$web_site is up" >> $FILE_NAME
  else
    echo "$web_site is down" >> $FILE_NAME
  fi
done

echo "Results in $FILE_NAME"
