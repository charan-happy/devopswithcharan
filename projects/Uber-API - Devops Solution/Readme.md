# DevOps Scenario
The scenario that you're currently facing is you work in an organization that is very monolithic. There is a ton of bare metal, virtualization, manual deployments of applications, and old school practices based on the current teams knowledge of IT.

You're brought in to the company and team to make things more modern so the organization can not only succeed, but stay ahead of their competition. Management now understands the needs and complexity that comes with staying ahead of their competition and they know that they need to. Otherwise, the organization will fall...

# DevOps Solution
The solution is to deploy the Uber API for the sign-up page. Currently this solution is sitting on a bunch of baremetal, but it's time to sprinkle a little DevOps on it.

<image has to upload>

As a DevOps Engineer, you're more or less (most likely) not writing the app, but instead, deploying it. That's why you're not writing your own app in this tutorial.



credits : Michael Levan

# Technology Details
You will be using the following technologies and platforms to set up a DevOps environment.

## AWS
AWS will be used to host the application, cloud infrastructure, and any other services we may need to ensure the Uber app is deployed properly.

## GitHub
To store the application and infrastructure/automation code

## Python
Python will be used for the Uber app (it is written in Python) and some automation efforts that aren't in Terraform.

## Terraform
Create an S3 bucket to store Terraform State files
Create an AWS ECR repository with Terraform
Create an EKS cluster

## Docker
Create a Docker image
Store the Docker image in AWS ECR

## Kubernetes
To run the Docker image that's created for the containerized Uber app. Kubernetes, in this case, EKS, will be used to orchestrate the container.

## CI/CD
Use GitHub Actions to create an EKS cluster
Automated testing
Testing Terraform code with Checkov

## Labs
## Prerequisites
**VPC** - When running EKS, it requires specific networking. Because all environments will most likely be different, there's a CloudFormation template for this exact purpose.
Create EKS VPC

### AWS:
Configure credentials to access AWS at a programmatic level

**Terraform** - The purpose of the Terraform section is to create all of the AWS cloud services you'll need from an environment/infrastructure perspective to run the Uber application.

Create S3 Bucket To Store TFSTATE Files<br>
Create an Elastic Container Registry<br>
Create An EKS Cluster IAM Role, And Policy For EKS<br>
Create An EKS Cluster

**Docker** - The purpose of the Docker section is to create a Docker image from the app that the organization is running on-prem (the uber app), containerize it, and store the container inside of a container repository.

For the container repo, you'll use AWS ECR.
Create The Docker Image
Log Into AWS ECR Repository

**Kubernetes** - The purpose of the Kubernetes section is to connect to EKS locally and to write the Kubernetes manifest to deploy the Python Uber app.

Connect To EKS From The Terminal

Create A Kubernetes Manifest

Automated Testing - The purpose of the Automation Testing section is to ensure that all of the Terraform code is performing as it should be from a policy, security, and static code analysis perspective.

Install And Run Checkov

CICD - The purpose of this section is to automatically create an EKS cluster with CICD using GitHub Actions

Create a GitHub Actions CICD pipeline
