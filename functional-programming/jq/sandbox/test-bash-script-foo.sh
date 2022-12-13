#!/bin/bash

content=$(curl -sS "curl 'https://cnft.tools/lists/all' | jq '.[]'")
echo "$content"
