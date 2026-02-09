#!/bin/bash
#look up uuid from uid 1 to 100

BASE_URL="http://ip/api.php"

for uid in {1..100}; do
  echo "Fetching UID: $uid"
  curl -s "$BASE_URL/$uid"
  echo -e "\n----------------------"
done
