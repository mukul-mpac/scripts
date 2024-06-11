#!/bin/bash

# Check if commit message is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <commit-message>"
  exit 1
fi

# Get the commit message from the first argument
commit_message=$1

# Get the current branch name
branch_name=$(git symbolic-ref --short HEAD)

# Extract the issue description from the branch name by removing the prefix
issue_description=$(echo $branch_name | cut -d'/' -f2)

# Perform git add
git add .

# Perform git commit with the provided message and issue description
git commit -m "$commit_message" -m "ISSUE: $issue_description"

# Perform git push to the current branch
git push origin $branch_name
