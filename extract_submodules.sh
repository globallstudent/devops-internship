#!/bin/bash

# This script extracts content from submodules and adds it to the main repository

# Array of weekly repositories
weeks=("week1_git" "week2_gcp" "week3_terraform" "week4_docker" "week5_ansible")

for week in "${weeks[@]}"; do
  echo "Extracting content for $week..."
  
  # Create the directory if it doesn't exist
  mkdir -p "$week"
  
  # Get the latest commit from the submodule
  cd ".git/modules/$week" || exit
  COMMIT=$(git rev-parse HEAD)
  echo "Latest commit for $week: $COMMIT"
  
  # Extract the content at that commit
  git archive --format=tar "$COMMIT" | tar -x -C "../../../$week"
  
  # Go back to the main directory
  cd "../../../" || exit
  
  echo "Content extracted for $week"
done

# Add all the extracted content to the main repository
git add week*
git status

echo "All submodule content has been extracted and added to the staging area."
echo "Review the changes and then commit with:"
echo "git commit -m \"Add all weekly content directly to the repository\""
echo "git push origin main"
