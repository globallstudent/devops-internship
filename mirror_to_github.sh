#!/bin/bash

# Array of weekly repositories
weeks=("week1_git" "week2_gcp" "week3_terraform" "week4_docker" "week5_ansible")

# Loop through each repository
for week in "${weeks[@]}"; do
  echo "Processing $week..."
  
  # Navigate to the submodule directory
  cd "$week" || exit
  
  # Add GitHub as a remote (if it doesn't exist)
  if ! git remote | grep -q "github"; then
    echo "Adding GitHub remote for $week..."
    git remote add github "git@github.com:globallstudent/$week.git"
  fi
  
  # Push to GitHub
  echo "Pushing $week to GitHub..."
  git push -u github --all
  git push -u github --tags
  
  # Go back to the parent directory
  cd ..
done

echo "All repositories mirrored to GitHub!"
