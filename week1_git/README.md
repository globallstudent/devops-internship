# Week 1: VCS (Git)
## Weekly tasks
1. Introduction to Version Control Systems (VCS)
    * Concepts to Learn:
        * What is Version Control?
        * Benefits of using VCS
        * Types of VCS: Centralized vs Distributed
    * Resources
        * [Atlassian](https://www.atlassian.com/git) | "Learn Git", "Beginner" sections
2. Getting Started with Git
    * Concepts to Learn:
        * Installing Git
        * Basic Git commands: ```init```, ```clone```, ```add```, ```commit```, ```status```, ```log```
        * Understanding the working directory, staging area, and repository
    * Resources:
        * [Pro Git Book](https://git-scm.com/book/en/v2) (Chapters 1 and 2)
        * [Atlassian](https://www.atlassian.com/git) | "Getting started" section
        * [Git Tutorial for Beginners - freeCodeCamp](https://www.youtube.com/watch?v=HVsySz-h9r4)
        * [Git and GitHub Tutorial For Beginners](https://www.youtube.com/watch?v=3fUbBnN_H2c&t=248s&pp=ygUKYW1pZ29zIGdpdA%3D%3D)
3. Intermediate Git
    * Concepts to Learn:
        * Branching and Merging
        * Resolving merge conflicts
        * Working with remote repositories
        * Using ```tags```
    * Resources:
        * [Pro Git Book](https://git-scm.com/book/en/v2) (Chapters 3 and 6)
        * [Atlassian](https://www.atlassian.com/git) | "Collaborating workflows" section
4. Advanced Git
    * Concepts to Learn:
        * Rebasing
        * Cherry-picking
        * Stashing
        * Git Hooks
    * Resources:
        * [Pro Git Book](https://git-scm.com/book/en/v2) (Chapters 7 and 9)
        * [Atlassian](https://www.atlassian.com/git) | "Advanced tips" section
        * [Git Hooks Documentation](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks)
5. Introduction to GitLab
    * Concepts to Learn:
        * GitLab overview and installation
        * GitLab workflow
        * Creating and managing repositories
    * Resources:
        * [GitLab Documentation](https://docs.gitlab.com/ee/topics/manage_code.html)


## Homework
1. Install Git on your local machine and configure your Git username and email.
2. Clone this repository (branch main) in your local machine.
3. Create new branch named the same as your first and last name divided by dash (-) followed by ```-production```. For example ```zafar-saidov-production```. Switch to the new branch.
4. Create a new file named ```devops.txt```, add some content to it, and save it. Use Git to add this file to the staging area and commit it with a commit message ```commit-to-production-1```.
5. Create new branch named the same as your first and last name divided by dash (-) followed by ```-staging```. For example ```zafar-saidov-staging```. Switch to the new branch.
6. Update content of file ```devops.txt```, commit changes with a commit message ```commit-to-staging-1```
7. Switch to your production branch (for example ```zafar-saidov-production```) and merge your staging branch (for example ```zafar-saidov-staging```) to current branch. Be sure that merging was in <span style='color:red'><b>fast-forwarding</b></span> method
8. Create new file with random content (not empty) in your production branch. File name must be the same with branch name. Commit your changes with a commit message ```commit-to-production-2```.
9. Repeat previous step for your staging branch. Commit message must be ```commit-to-staging-2```
10. Merge your staging branch to your production branch. Be sure that merging was in <span style='color:red'><b>non fast-forwarding</b></span> method and new commit was created for merging. Replace default commit message to ```merge-1``` in editor which was opened during merging.
11. Simulate a merge conflict by making conflicting changes in your production branch and staging branch, then resolve the conflict. Replace default commit message to ```merge-2```
12. <span style='color:red'><b>EXTRA: </b></span>Switch to your production branch. Create and switch to a new branch called the same as your first and last name divided by dash (-) followed by ```-development```. For example ```zafar-saidov-development```. Create a file named ```file1``` with some content, commit this change with a commit message ```file1```. Repeat this task with files named ```file2``` and ```file3``` respectively with commit messages ```file2``` and ```file3```. Switch to your production branch and get commits with commit messages ```file3``` and ```file1``` from the development branch by cherry pick. Be sure that commits must be picked in given order. Firstly, ```file3```, after that ```file1```.
13. <span style='color:red'><b>EXTRA: </b></span> Switch to your production branch. Create and switch to a new branch called the same as your first and last name divided by dash (-) followed by ```-rebasing```. For example ```zafar-saidov-rebasing```. Create a file named ```rebase1``` with some content, commit this change with a commit message ```rebase1```. Switch to your production branch. Create a file named ```rebase2``` with some content, commit this change with a commit message ```rebase2```. Rebase your rebasing branch to your production branch.
14. Switch to your production branch and push your commits to gitlab (branch: your production branch).
