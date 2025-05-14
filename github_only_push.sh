#!/bin/bash

# This script helps you push changes only to GitHub without triggering GitLab pipelines

# Check if there are any changes to commit
if [ -z "$(git status --porcelain)" ]; then
  echo "No changes to commit. Working directory is clean."
  exit 0
fi

# Ask for a commit message
echo "Enter a commit message for your changes:"
read -r commit_message

# If no commit message is provided, use a default one
if [ -z "$commit_message" ]; then
  commit_message="Update content on GitHub"
fi

# Add all changes
git add .

# Commit the changes
git commit -m "$commit_message"

# Push only to GitHub
git push origin main

echo "Changes have been pushed to GitHub only."
echo "Your GitLab pipelines will not be triggered."
