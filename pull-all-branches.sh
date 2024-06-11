#!/bin/bash

# Store the name of the current branch
original_branch=$(git symbolic-ref --short HEAD)

# Fetch all branches
git fetch --all

# Get a list of all branches
branches=$(git branch -r | grep -v '\->')

# Loop through each branch and pull changes
for branch in $branches; do
  # Get the local branch name by removing the 'origin/' prefix
  local_branch=${branch#origin/}

  # Check if the local branch exists
  if git show-ref --verify --quiet refs/heads/$local_branch; then
    # Checkout the existing local branch
    git checkout $local_branch
  else
    # Create and checkout the local branch tracking the remote branch
    git checkout -b $local_branch --track $branch
  fi

  # Pull the latest changes for the branch
  git pull origin $local_branch
done

# Switch back to the original branch after pulling changes for all branches
git checkout $original_branch
