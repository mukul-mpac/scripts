#!/bin/bash

# Check if commit message is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <directory-name>"
  exit 1
fi

directory_name=$1

echo "Creating a symbolic link to the directory: $directory_name"

# Create a symbolic link to the specified directory
ln -s ~/Desktop/mpac-commercial/$directory_name .

echo "------ Finished ------"
