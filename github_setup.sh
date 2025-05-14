#!/bin/bash

# This script will help you set up GitHub repositories for each week and update the submodule configuration

# Function to check if a GitHub repository exists
check_repo_exists() {
  local repo_name=$1
  local status_code=$(curl -s -o /dev/null -w "%{http_code}" "https://github.com/globallstudent/$repo_name")
  if [ "$status_code" -eq 200 ]; then
    return 0  # Repository exists
  else
    return 1  # Repository doesn't exist
  fi
}

# Array of weekly repositories
weeks=("week1_git" "week2_gcp" "week3_terraform" "week4_docker" "week5_ansible")

echo "=== GitHub Repository Setup ==="
echo "This script will guide you through creating GitHub repositories for each week"
echo "and updating the submodule configuration."
echo ""
echo "For each week, you'll need to:"
echo "1. Create a new public GitHub repository with the same name"
echo "2. Push the content from your local repository to GitHub"
echo ""
echo "Let's get started!"
echo ""

for week in "${weeks[@]}"; do
  echo "=== Setting up $week ==="
  
  if check_repo_exists "$week"; then
    echo "Repository $week already exists on GitHub."
  else
    echo "Please create a new repository on GitHub:"
    echo "1. Go to https://github.com/new"
    echo "2. Repository name: $week"
    echo "3. Make it Public"
    echo "4. Do NOT initialize with README, .gitignore, or license"
    echo "5. Click 'Create repository'"
    read -p "Press Enter when you've created the repository..."
  fi
  
  echo "Pushing $week to GitHub..."
  
  # Navigate to the submodule directory
  cd "$week" || { echo "Failed to enter $week directory"; continue; }
  
  # Check if GitHub remote already exists
  if git remote | grep -q "github"; then
    echo "GitHub remote already exists, updating it..."
    git remote set-url github "https://github.com/globallstudent/$week.git"
  else
    echo "Adding GitHub remote..."
    git remote add github "https://github.com/globallstudent/$week.git"
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

# Update .gitmodules to point to GitHub repositories
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
echo "Setup complete! Your submodules should now be accessible on GitHub."
echo "You can now click on the submodules in your GitHub repository and they should work correctly."
