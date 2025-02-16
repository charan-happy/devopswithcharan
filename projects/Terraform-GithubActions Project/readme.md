DevOps project to practice Terraform & GitHub Actions:

1) Create AWS IAM user for Terraform
2) Configure Terraform and AWS credentials locally
3) Create Terraform configuration to deploy AWS RDS
4) Configure AWS S3 and DynamoDB for Terraform remote state
5) Prepare GitHub repository with Terraform code
6) Store RDS credentials in GitHub secrets
7) Store AWS credentials in GitHub secrets
8) Configure AWS access from GitHub Actions
9) Run Terraform: validate, init, plan and apply in GitHub Actions
10) Read database credentials from GitHub secrets
11) Pass database credentials to Terraform with variables

Advanced:
1) Use AWS IAM Role instead of IAM user
2) Run Terraform: validate, init and plan on a PR
3) Dynamically create RDS credentials in Terraform instead of hardcoding them in GitHub secrets
4) Store dynamic credentials in AWS SecretsManager
5) Use Terraform modules to deploy resources

This project covers basics and advanced parts of deploying AWS infrastructure with Terraform.
