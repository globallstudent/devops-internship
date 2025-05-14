#!/bin/bash

# This script will help you set up GitHub repositories for each week using SSH URLs

# Array of weekly repositories
weeks=("week1_git" "week2_gcp" "week3_terraform" "week4_docker" "week5_ansible")

echo "=== GitHub Repository Setup (SSH) ==="
echo "This script will guide you through creating GitHub repositories for each week"
echo "and updating the submodule configuration using SSH URLs."
echo ""
echo "For each week, you'll need to:"
echo "1. Create a new public GitHub repository with the same name"
echo "2. Push the content from your local repository to GitHub"
echo ""
echo "Let's get started!"
echo ""

for week in "${weeks[@]}"; do
  echo "=== Setting up $week ==="
  
  echo "Please create a new repository on GitHub:"
  echo "1. Go to https://github.com/new"
  echo "2. Repository name: $week"
  echo "3. Make it Public"
  echo "4. Do NOT initialize with README, .gitignore, or license"
  echo "5. Click 'Create repository'"
  read -p "Press Enter when you've created the repository (or if it already exists)..."
  
  echo "Pushing $week to GitHub..."
  
  # Navigate to the submodule directory
  cd "$week" || { echo "Failed to enter $week directory"; continue; }
  
  # Check if GitHub remote already exists
  if git remote | grep -q "github"; then
    echo "GitHub remote already exists, updating it..."
    git remote set-url github "git@github.com:globallstudent/$week.git"
  else
    echo "Adding GitHub remote..."
    git remote add github "git@github.com:globallstudent/$week.git"
  fi
  
  # Push to GitHub
  echo "Pushing to GitHub..."
  if git push -u github --all; then
    echo "Successfully pushed $week to GitHub!"
  else
    echo "Failed to push $week to GitHub. Please check your GitHub repository and try again."
    read -p "Press Enter to continue with the next repository..."
  fi
  
  # Push tags
  git push github --tags
  
  # Go back to the parent directory
  cd ..
  
  echo "Completed setup for $week"
  echo ""
done

echo "All repositories have been pushed to GitHub."
echo ""
echo "Now updating the .gitmodules file to point to GitHub repositories..."

# Update .gitmodules to point to GitHub repositories with SSH URLs
cat > .gitmodules << EOF
# Git submodules for devops-internship
[submodule "week1_git"]
	path = week1_git
	url = git@github.com:globallstudent/week1_git.git
[submodule "week2_gcp"]
	path = week2_gcp
	url = git@github.com:globallstudent/week2_gcp.git
[submodule "week3_terraform"]
	path = week3_terraform
	url = git@github.com:globallstudent/week3_terraform.git
[submodule "week4_docker"]
	path = week4_docker
	url = git@github.com:globallstudent/week4_docker.git
[submodule "week5_ansible"]
	path = week5_ansible
	url = git@github.com:globallstudent/week5_ansible.git
EOF

# Commit and push the updated .gitmodules file
git add .gitmodules
git commit -m "Update submodule URLs to point to GitHub repositories using SSH"
git push origin main

echo ""
echo "Setup complete! Your submodules should now be accessible on GitHub."
echo "You can now click on the submodules in your GitHub repository and they should work correctly."
