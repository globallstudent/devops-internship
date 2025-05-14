#!/bin/bash

# This script will help create GitHub repositories for each week and update the submodule configuration

# Array of weekly repositories
weeks=("week1_git" "week2_gcp" "week3_terraform" "week4_docker" "week5_ansible")

echo "This script will guide you through creating GitHub repositories for each week"
echo "Please follow these steps:"

for week in "${weeks[@]}"; do
  echo ""
  echo "===== Setting up $week ====="
  echo "1. Go to https://github.com/new in your browser"
  echo "2. Create a new repository named '$week'"
  echo "3. Make sure it's public"
  echo "4. Do NOT initialize with README, .gitignore, or license"
  echo "5. Click 'Create repository'"
  echo "6. Once created, press Enter to continue with the next step"
  read -p "Press Enter when you've created the $week repository on GitHub..."
  
  # Navigate to the submodule directory
  cd "$week" || exit
  
  # Add GitHub as a remote
  echo "Adding GitHub remote for $week..."
  git remote add github "git@github.com:globallstudent/$week.git"
  
  # Push to GitHub
  echo "Pushing $week to GitHub..."
  git push -u github --all
  git push -u github --tags
  
  # Go back to the parent directory
  cd ..
  
  echo "$week has been pushed to GitHub!"
done

# Update .gitmodules to point to GitHub repositories
echo ""
echo "Updating .gitmodules to point to GitHub repositories..."
cat > .gitmodules << EOF
# Git submodules for devops-internship
[submodule "week1_git"]
	path = week1_git
	url = https://github.com/globallstudent/week1_git.git
[submodule "week2_gcp"]
	path = week2_gcp
	url = https://github.com/globallstudent/week2_gcp.git
[submodule "week3_terraform"]
	path = week3_terraform
	url = https://github.com/globallstudent/week3_terraform.git
[submodule "week4_docker"]
	path = week4_docker
	url = https://github.com/globallstudent/week4_docker.git
[submodule "week5_ansible"]
	path = week5_ansible
	url = https://github.com/globallstudent/week5_ansible.git
EOF

# Commit and push the updated .gitmodules file
git add .gitmodules
git commit -m "Update submodule URLs to point to GitHub repositories"
git push origin main

echo ""
echo "All repositories have been mirrored to GitHub and the submodule configuration has been updated!"
echo "Your submodules should now be clickable on GitHub."
