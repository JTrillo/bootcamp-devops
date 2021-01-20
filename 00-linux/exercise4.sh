#!/bin/bash

# First of all we must check the number of arguments
if [ $# == 1 ]; then
  KEYWORD=$1
else
  echo "Error: invalid number of arguments."
  exit 1
fi

# Download web content in a file
curl -s https://www.marca.com/ --output output.txt

# Get the first line where the keyword appears
grep -n $KEYWORD output.txt  | head -1 | cut -d':' -f 1