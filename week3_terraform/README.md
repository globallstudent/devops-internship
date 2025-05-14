# Week 3: Terraform
## Weekly tasks
1. Introduction to Terraform 
    * Concepts to Learn:
        * [Terraform](https://developer.hashicorp.com/terraform?product_intent=terraform)
        * [Terraform Explained in 15 minutes](https://youtu.be/l5k1ai_GBDE?si=-W9ZrdTCg07ke-0D)
2. Getting Started with Terraform Google Provider
    * Concepts to Learn:
        * [Networking](https://cloud.google.com/docs/networking?_gl=1*1pwouaf*_up*MQ..&gclid=CjwKCAjw59q2BhBOEiwAKc0ijRORyqUtmzLXeXBf_cUbMVgD5UvH63qT4I3jsDXCyU4Dso34txfyWhoCM6YQAvD_BwE&gclsrc=aw.ds)
        * [Compute Engine (VM instances)](https://cloud.google.com/compute/docs?_gl=1*1hs8stg*_up*MQ..&gclid=CjwKCAjw59q2BhBOEiwAKc0ijRORyqUtmzLXeXBf_cUbMVgD5UvH63qT4I3jsDXCyU4Dso34txfyWhoCM6YQAvD_BwE&gclsrc=aw.ds) 
    * Resources
        * [Subnetwork](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork)
        * [Network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network)
        * [Compute Address](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address)
        * [Compute Instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance)

## Prerequisites
1. Create project following `name-surname` format. In case if you didn't delete it from week2, you can still use it. Update permissions of the Service Account provided from week2 and add `Compute Admin` and `Project IAM Admin` roles. This is needed to create resources via Terraform. Keep Viewer access. Enable `Cloud Resource Manager API` in your project.  
2. Clone the repo and create a branch in `name-surname` format as it was made in week2. The branches from week2 and week3 should be identical as well as the project name. 
3. Initialize [terraform Google provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs) by using provider.tf file. Do not modify anything in this file. Just make sure not to delete this file, as it initializes the Google project with the Serice Account you have provided. 

## Homework 
1. Create a compute network named `week3-network` using Terraform. Terraform Resource should be named `week3-network` as well.
Example: 
   ```
   resource "google_compute_network" "week3-network" {
     name                    = "week3-network"
     ...
   }
   ```
2. Create a compute subnetwork named `week3-subnetwork`. 
   1. Set `week3-network` as a network.
   2. Use `us-central1` as a region. 
   3. IP range cidr must be `10.0.0.0/24`. 

    Terraform Resource should be named `week3-subnetwork` as well. Example:
   ```
   resource "google_compute_subnetwork" "week3-subnetwork" {
     name          = "week3-subnetwork"
     ...
   }
   ```
3. Create a compute firewall named `week3-firewall`. 
   1. Set `week3-network` as a network.
   2. Allow ports `80`, `443` and `22` to `0.0.0.0/0` source range.

   Terraform Resources should be named `week3-firewall` as well. Example:
   ```
   resource "google_compute_firewall" "week3-firewall" {
     name    = "week3-firewall"
     ...
   }
   ```
4. Create an External compute address named `week3-1-address`. 
   1. Set `week3-network` as a network.
   2. Set `us-central1` as a region.

   Terraform Resources should be named `week3-1-address` as well. Example: 
   ```
   resource "google_compute_address" "week3-1-address" {
     name   = "week3-1-address"
     ...
   }
   ```
5. Create a compute instance named `week3-1`. 
   1. Assign public IP created in task 4. 
   2. Add a public ssh-key provided inside [internship.pub](./internship.pub) file. Use `name-surname` user for ssh-key. Example:
   ```
   azizbek-karimov:ssh-rsa AAAAB3NzaC1yc2EAAAA...
   ```
   3. Choose `ubuntu-os-cloud/ubuntu-2204-lts` as image to boot from. 
   4. Machine type must be `e2-small`. 
   
   Terraform Resources should be named `week3-1` as well. Example: 
   ```
   resource "google_compute_instance" "week3-1" {
     name         = "week3-1"
     ...
   }
   ```
### Extra
1. Create a compute router named `week3-2-router`.
   1. Set `week3-network` as a network.
   2. Set `us-central1` as a region.

   Terraform Resources should be named `week3-2-router` as well. Example: 
   ```
   resource "google_compute_router" "week3-2-router" {
     name         = "week3-2-router"
     ...
   }
   ```   
2. Create an External compute address named `week3-2-address`. 
   
   Terraform Resources should be named `week3-2-address` as well. Example: 
   ```
   resource "google_compute_address" "week3-2-address" {
     name   = "week3-2-address"
     ...
   }
   ```   
3. Create a compute router nat named `week3-nat`.
   1. Set `week3-2-router` as a router. Set `week3-2-address` as a nat_ips.

   Terraform Resources should be named `week3-nat` as well. Example: 
   ```
   resource "google_compute_router_nat" "week3-nat" {
     name         = "week3-nat"
     ...
   }
   ```   
4. Create a compute instance named `week3-2`. There should not be any public IP assigned to the instance
   1. Choose `ubuntu-os-cloud/ubuntu-2204-lts` as image to boot from. 
   2. Machine type must be `e2-small`. 

   Terraform Resources should be named `week3-2` as well. Example: 
   ```
   resource "google_compute_instance" "week3-2" {
     name         = "week3-2"
     ...
   }
   ```
5. Create IAP SSH permissions for your instance named `tunnel-accessor`.
   - Set the `project` as your `name-surname`. Set `roles/iap.tunnelResourceAccessor`.
   - Member should be set as the Service Account you have created for the project. 

   Terraform Resources should be named `tunnel-accessor` as well. Example: 
   ```
   resource "google_project_iam_member" "tunnel-accessor" {
     ...
   }
   ```

# Caution
- Before Pushing your changes, run `terraform destroy` command on your local machine. 
- Do not push terraform related files, so the new state will be created. 
- Push `.tf` files under your `name-surname` branch. 