# Week 4: Docker
## Weekly tasks
1. Introduction to Docker 
    * Concepts to Learn:
        * [Docker Docs](https://docs.docker.com/)
        * [Docker compose Docs](https://docs.docker.com/compose/)
        * [Docker Crash Course for Absolute Beginners](https://youtu.be/pg19Z8LL06w?si=TAve162Q5pLZZnN0)
        * [Ultimate Docker Compose Tutorial](https://youtu.be/SXwC9fSwct8?si=a4TsO34R3ObTT8uZ)
        * [Networking](https://youtu.be/fBRgw5dyBd4?si=lXdkxBzxYOPMIlMM)
        

## Prerequisites
1. Create project following `name-surname` format. In case if you didn't delete it from week2, you can still use it. Update permissions of the Service Account provided from week2 and add `Compute Admin` and `Project IAM Admin` roles. This is needed to create resources via Terraform. Keep Viewer access. Enable `Cloud Resource Manager API` in your project.  
2. Clone the repo and create a branch in `name-surname` format as it was made in week2. The branches from week2 and week3 should be identical as well as the project name. 
3. Initialize [terraform Google provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs) by using provider.tf file. Do not modify anything in this file. Just make sure not to delete this file, as it initializes the Google project with the Serice Account you have provided. 

## Terraform
1. Create a compute network named `week4-network` using Terraform. Terraform Resource should be named `week4-network` as well. 
2. Create a compute subnetwork named `week4-subnetwork`. 
   1. Set `week4-network` as a network.
   2. Use `us-central1` as a region. 
   3. IP range cidr must be `10.0.0.0/24`. 
3. Create a compute firewall named `week4-firewall`. 
   1. Set `week4-network` as a network.
   2. Allow ports `80`, `443` and`22` to `0.0.0.0/0` source range.
4. Create an External compute address named `week4-1-address`. 
   1. Set `week4-network` as a network.
   2. Set `us-central1` as a region.
5. Create a compute instance named `week4-1`. 
   1. Assign public IP created in task 4. 
   2. Add a public ssh-key provided inside [internship.pub](./internship.pub) file. Use `name-surname` user for ssh-key. Example:
   ```
   azizbek-karimov:ssh-rsa AAAAB3NzaC1yc2EAAAA...
   ```

   3. Choose `ubuntu-os-cloud/ubuntu-2204-lts` as image to boot from. 
   4. Machine type must be `e2-small`. 

## HomeWORK
### Docker
1. Install docker and docker-compose-plugin on server `week4`. Add your user to `docker` group. 
2. Create docker network
    1. Set `week4` as a name.
    2. Set `bridge` as driver.
    3. Set `172.20.0.0/16` as subnet.
    4. Set `172.20.0.1` as gateway.
3. Write `Dockerfile` on server to build image nginx. It is important to build nginx image not to use already existed. 
    1. Use Ubuntu as base image
    2. As nginx default page image has to return "DevOps Internship" message as nginx's default web page.
    3. Run newly created image on server as `week4-nginx` named container with 8080:80 binded port.
    4. Push newly created image to remote image registry as `REGISTRY/name-surname:week4-nginx`.    
4. Pull gitlab repository to server `week4` and write dockerfile for tictactoe project.
    1. Build and push image to `REGISTRY/name-surname:week4-tictactoe`.
    2. Run newly created image as `week4-tictactoe` named container 
    3. Attach `week4-tictactoe` container to `week4` network.
    EXTRA: Image should be optimized as possible (as less image size as possible).
5. Work with docker compose folder. You have to write dockerfile for `application` folder it is python application runs on port `5000`. Dockerfile for `database` is already provided no need to edit anything there. Declare `week4` network as external in `docker-compose.yml`.
    database service name: `postgres`
    application service name: `application`
    1. Write docker compose file and run it as `week4`.
       1. Application started
       2. Database started
    2. Service: application
       1. Should be networks: `default`, `week4`
    3. Service: database
       1. Should be in networks: `week4`
    4. Bind `application` to port `5000`.

<details>
<summary>Registry creds</summary>
    
    login: [USERNAME]
    password: [REDACTED]
</details>

#### Important!
    Be carefull with environmental variables. 
    Default values you can find in application/main.py 
    

# Caution
- Before Pushing your changes, no need to run `terraform destroy` command on your local machine. Infrastructure will be used to check this task.
- Do not forget to push all Dockerfiles and docker-compose.yml to your branch.