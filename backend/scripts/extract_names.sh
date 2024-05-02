#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Error: Please provide a file name as an argument."
  exit 1
fi

file="$1"

if [ ! -f "$file" ]; then
  echo "Error: File '$file' does not exist."
  exit 1
fi

awk -F ',' 'BEGIN {OFS=" "} { 
  if ($4 ~ /@amazon.com/) { 
    print $2, $3
  }
}' "$file" > test.txt


