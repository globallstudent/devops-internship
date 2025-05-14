#!/bin/bash

# This script creates separate GitHub repositories for each week and pushes the content to them

# Array of weekly repositories
weeks=("week1_git" "week2_gcp" "week3_terraform" "week4_docker" "week5_ansible")

echo "=== Setting Up Separate GitHub Repositories ==="
echo "This script will help you create separate GitHub repositories for each week"
echo "and push the content to them."
echo ""
echo "For each week, you'll need to:"
echo "1. Create a new public GitHub repository with the same name"
echo "2. Push the content from your local directory to GitHub"
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
  
  # Create a temporary directory for this week
  temp_dir="/tmp/$week"
  mkdir -p "$temp_dir"
  
  # Copy all content from the week directory to the temporary directory
  echo "Copying content for $week..."
  cp -r "$week"/* "$temp_dir"
  
  # Initialize a new Git repository in the temporary directory
  cd "$temp_dir" || exit
  git init
  
  # Add all files
  git add .
  
  # Commit the files
  git commit -m "Initial commit for $week"
  
  # Add the GitHub remote
  git remote add origin "git@github.com:globallstudent/$week.git"
  
  # Push to GitHub
  echo "Pushing $week to GitHub..."
  if git push -u origin main; then
    echo "Successfully pushed $week to GitHub!"
  else
    # Try pushing to master branch if main fails
    if git push -u origin master; then
      echo "Successfully pushed $week to GitHub (master branch)!"
    else
      echo "Failed to push $week to GitHub. Please check your GitHub repository and try again."
      read -p "Press Enter to continue with the next repository..."
    fi
  fi
  
  # Go back to the main directory
  cd "/home/globalstudent/devops-internship" || exit
  
  echo "Completed setup for $week"
  echo ""
done

echo "All weekly repositories have been set up on GitHub."
echo ""
echo "Now updating the README.md to link to these repositories..."

# Update the README.md to link to the separate repositories
cat > README.md << EOF
# DevOps Internship

This repository contains links to all the projects completed during my DevOps internship. Each week's work is organized in a separate GitHub repository.

## Weekly Projects

- [**week1_git**](https://github.com/globallstudent/week1_git): Git basics and workflows
  - Git branching strategies
  - Merge and rebase operations
  - CI/CD configuration

- [**week2_gcp**](https://github.com/globallstudent/week2_gcp): Google Cloud Platform fundamentals
  - Cloud infrastructure setup
  - GCP service configuration
  - Cloud networking

- [**week3_terraform**](https://github.com/globallstudent/week3_terraform): Infrastructure as Code with Terraform
  - Resource provisioning
  - State management
  - Module development

- [**week4_docker**](https://github.com/globallstudent/week4_docker): Containerization with Docker
  - Dockerfile creation
  - Multi-container applications
  - Docker networking and volumes

- [**week5_ansible**](https://github.com/globallstudent/week5_ansible): Configuration management with Ansible
  - Playbook development
  - Role-based configuration
  - Infrastructure automation

## Getting Started

To access any of the weekly projects, simply click on the links above to go to the respective GitHub repository.

Each repository contains its own README and documentation specific to that week's projects and assignments.
EOF

# Commit and push the updated README
git add README.md
git commit -m "Update README to link to separate weekly repositories"
git push origin main

echo ""
echo "Setup complete! Your weekly projects are now accessible as separate GitHub repositories."
echo "The main README has been updated with links to these repositories."
