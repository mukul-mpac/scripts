#!/bin/bash

# Check if at least one argument is provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 branch_to_keep [another_branch_to_keep ...]"
  exit 1
fi

# Store all branches to keep including 'main'
branches_to_keep=("main" "$@")

# Check out the 'main' branch
git checkout main

# Fetch all branches and prune deleted branches
git fetch --all --prune

# Construct a grep pattern to exclude the branches to keep
grep_pattern=$(printf "|%s" "${branches_to_keep[@]}")
grep_pattern="origin/(${grep_pattern:1})"

# Delete all local branches except 'main' and the branches to keep
for branch in $(git branch | grep -vE "^\*|(${branches_to_keep[*]})"); do
  git branch -D $branch
done

# Switch back to the original branch after pulling changes for all branches
git checkout main
git pull origin main