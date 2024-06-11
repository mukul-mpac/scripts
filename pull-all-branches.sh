#!/bin/bash

# Store the name of the current branch
original_branch=$(git symbolic-ref --short HEAD)

# Fetch updates from the remote repository
git fetch --all

# Get a list of all local branches
local_branches=$(git branch --format="%(refname:short)")

# Loop through each local branch and pull changes
for branch in $local_branches; do
  # Checkout the local branch
  git checkout $branch

  # Pull the latest changes for the branch
  git pull origin $branch
done

# Switch back to the original branch after pulling changes for all branches
git checkout $original_branch
