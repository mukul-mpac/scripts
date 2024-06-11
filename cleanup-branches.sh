#!/bin/bash

# Branch to keep (in addition to 'main'), default is 'main' if no argument is provided
keep_branch=${1:-main}

# Check out the 'main' branch
git checkout main

# Fetch all branches
git fetch --all --prune

# Delete all remote branches except 'main' and the branch to keep
for branch in $(git branch -r | grep -v '\->' | grep -v "origin/main" | grep -v "origin/$keep_branch"); do
  git push origin --delete ${branch#origin/}
done

# Delete all local branches except 'main' and the branch to keep
for branch in $(git branch | grep -v 'main' | grep -v "$keep_branch" | grep -v '\*'); do
  git branch -D $branch
done
