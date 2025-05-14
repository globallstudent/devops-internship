# Week 2: Cloud (GCP)
## Weekly tasks
1. Introduction to Cloud 
    * Concepts to Learn:
        * What is Cloud?
        * Benefits of using Cloud
        * [Google Cloud Project (GCP)](https://cloud.google.com/docs/overview)
    * Resources
        * [gcloud CLI Overview](https://cloud.google.com/sdk/gcloud)
2. Getting Started with GCP
    * Concepts to Learn:
        * [Networking](https://cloud.google.com/docs/networking?_gl=1*1pwouaf*_up*MQ..&gclid=CjwKCAjw59q2BhBOEiwAKc0ijRORyqUtmzLXeXBf_cUbMVgD5UvH63qT4I3jsDXCyU4Dso34txfyWhoCM6YQAvD_BwE&gclsrc=aw.ds)
        * [Compute Engine (VM instances)](https://cloud.google.com/compute/docs?_gl=1*1hs8stg*_up*MQ..&gclid=CjwKCAjw59q2BhBOEiwAKc0ijRORyqUtmzLXeXBf_cUbMVgD5UvH63qT4I3jsDXCyU4Dso34txfyWhoCM6YQAvD_BwE&gclsrc=aw.ds) 
    * Resources
        * [VPC networks](https://cloud.google.com/vpc/docs/create-modify-vpc-networks)


## Prerequisites
1. Clone the repo and create a branch in the following format `name-surname`. Example: `azizbek-karimov`.
2. Create a GCP account.
3. Install `gcloud` CLI tool to access and manage your GCP resources using following [instruction](https://cloud.google.com/sdk/docs/install)
4. Try to access GCP account via CLI.

## Homework 
1. Create a project in GCP account in the following format: `name-surname`. Example: `azizbek-karimov`.
2. Create a serviceaccount with the full Viewer access to the project. Go to newly created service account and create a JSON formatted key. Download a key as a file. Send the file to telegram bot using [instructions](#file-upload-instructions). 
3. Switch to newly created project and enable Compute Engine API. Use the [documentation](https://cloud.google.com/endpoints/docs/openapi/enable-api) to enable an API. Create a VPC network named `proxima-internship` with the subnet named `proxima-internship`. Choose `us-central1` as a region. Use `10.0.0.0/16` for IPv4 range.
4. Create a VM instance and name it as `week2`. Choose `us-central1` as a region to place an instance. Machine type should be `e2-micro`. Choose `proxima-internship` as Network interface for instance. The OS image for Boot disk must be `Ubuntu 20.04 LTS`. Add you public key as a SSH item.
5. After creating branch in the repo push it to remote.

### File upload instructions
1. Start the @proxima_internship_bot in telegram. It will send you `chat_id`. 
2. Save `chat_id` and share it with your tutor. 
3. After sending the key. Your tutor should authorize you.
4. Then send `/start` message to bot. It will respond with the following option: `Upload GCP Token File`. Choose the option and share you Service Account key file.

## Assessment
``` Assessment will be made based on the completion of the following cases:```

1. Service Account is created and key is shared as a file via Telegram Bot.
2. Project is created after the student name and surname in a `name-surname` format 
3. `proxima-internship` VPC network is created inside `name-surname` project
4. `proxima-internship` subnet inside `proxima-internship` VPC network is created with the `10.0.0.0/16` IP range in `us-central1` region. 
5. `week2` VM instance is created inside `name-surname` project.
6. `machineType` for `week2` VM instace is `e2-micro`.
7. <b>EXTRA: </b>VM instance is created within `proxima-internship` subnet
8. <b>EXTRA: </b>OS image is Ubuntu 20.04 LTS
9. <b>EXTRA: </b>`ssh-key` of a student is added into VM instance
