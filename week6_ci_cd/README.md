# Week 6: CI/CD (GitLab-CI)
## Weekly tasks
1. Introduction to CI/CD Processes 
    * Concepts to Learn:
        * [RedHat Docs](https://www.redhat.com/en/topics/devops/what-is-ci-cd)
        * [CI vs CD vs CD](https://circleci.com/ci-cd/)
        * [GitLab CI/CD for Absolute Beginners](https://youtu.be/qP8kir2GUgo?si=fi_Vc99VAG5WCEeG)
        * [GitLab-CI Get Started](https://docs.gitlab.com/ee/ci/)
        

## Overall
During this week, you will be tasked with writing a CI/CD pipeline to configure infrastructure, build Docker image, and update it. Please note, this week will differ from previous weeks in that automatic task checking will not be active. Each student will be required to personally demonstrate their completed work.

## Prerequisites
1. Create Virtual Machine, copy public key to your user's authorized_keys file which later will be used to connect later during CI/CD.
2. You have to prepare ansible role to install docker and nginx on your machine. Proxing should be done by proxy_pass to port 8080.

## Homework 
### Git repository
1. Clone this repository to your local machine.
2. Create and switch to the new git branch named as ```<your first name>-<your last name>```. For example ```zafar-saidov```

### Ansible
1. Create directories in this project's root path: ```playbooks```, ```roles```, ```inventory```
2. Create a file ```ansible.cfg``` in this project's root path. Write the following ansible configurations as a ```defaults``` configuration:
    * default host list (inventory): ```/builds/zafarsaidov/week6_cicd/inventory```
    * default roles path: ```/builds/zafarsaidov/week6_cicd/roles```
    * interpreter python: ```/usr/bin/python3```
    * default strategy: ```linear```
    * Host key verification: ```False```
3. Add new host to a hosts file ```inventory/hosts```:
    * name: ```app-server```
    * ansible connection type: ```ssh```
    * private key file path: ```/scripts/id_rsa```
    * Configure other necessary host variables (user, ip, ssh port, sudo password) so that runner can connect for running ansible tasks 
    * Copy id-rsa.pub file content and add this key to server user as a public key (~/.ssh/authorized_keys). User must be the same as ansible user for app-server host.
4. Create ansible roles and playbooks for:
    * Installing docker 
    * Running docker container from image which you need to build and push in next steps.

### CI/CD
1. CI/CD pipeline must has 3 stages: install, build, deploy. 
2. All jobs must be triggered only on your branch: `name-surname`.
3. All jobs must use runner with tag `internship`.
4. In first stage's job you need to run playbooks in order to install docker and run container. This job must be triggered manually. The following variable must be set in this job: ANSIBLE_CONFIG=/builds/zafarsaidov/week6_cicd/ansible.cfg
5. Develop a CI job to build and push the provided frontend application image to the container registry. This job must be triggered automatically after pushing to your branch. Before write Dockerfile as optimized as possible.
    * Build and push latest and numbered image tag
    * Remove cache and image after successful push. 
6. Implement a CD job to update the image version (tag) of the frontend application deployed to your server. This job must be triggered automatically after build job successfully completed. There is a private key inside the runner image for accessing your server in path `/scripts/id_rsa`. 
7. Loginning process to the docker registry should be done by `before_script` construction.

## Important!
    Use REGISTRY, REGISTRY_PASSWORD variables for loginning, building and pushing to container registry.
    Upload a file named after `name-surname.txt`, where the `user`, `ip_address` of the server will be included into this file.

## Caution
- On each push pipeline should be automatically triggered only for Building image and Deploying new to server.