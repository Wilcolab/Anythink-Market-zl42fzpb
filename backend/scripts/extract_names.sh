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
  email = tolower($4)
  if (email ~ /@amazon.com/) { 
    print $3, $2
  }
}' "$file" > output_names.txt


