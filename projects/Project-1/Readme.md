Simple DevOps project:

1) Create EC2 instance on AWS with Terraform
2) Install docker and nginx with ansible
3) Create GitHub Actions pipeline to build and push docker image to ECR, ssh into the server and pull latest image
4) Run the docker containers on EC2
5) Configure appropriate docker container ports
6) Set up nginx to act as a reverse proxy and route requests to containers
7) Enable CloudWatch logs on AWS for monitoring the EC2 instance

This will give you basic experience and app and infrastructure deployment.
