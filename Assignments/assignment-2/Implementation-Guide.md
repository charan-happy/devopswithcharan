Infrastructure as Code with Terraform and Ansible
This guide will help you automate the provisioning and configuration of a cloud infrastructure using Terraform and Ansible. The infrastructure will be provisioned on AWS and will include a VPC with public and private subnets, an EC2 instance, and an S3 bucket.

Prerequisites
AWS CLI installed and configured with appropriate permissions
Terraform installed
Ansible installed
Step 1: Setup with Terraform
Terraform Configuration

Create a directory for your Terraform files:

sh
Copy code
mkdir terraform-aws-setup
cd terraform-aws-setup
Provider Configuration

Create a main.tf file with the following content:

hcl
Copy code
provider "aws" {
  region = "us-east-1"
}
VPC and Networking Components

Add the VPC, subnets, and security groups to main.tf:

hcl
Copy code
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "private-subnet"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "web-sg" {
  vpc_id = aws_vpc.main.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "web-sg"
  }
}
EC2 Instance

Add the EC2 instance to main.tf:

hcl
Copy code
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0" # Update with the desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  security_groups = [aws_security_group.web-sg.name]

  tags = {
    Name = "web-server"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.web.public_ip} > ip_address.txt"
  }
}
S3 Bucket

Add the S3 bucket to main.tf:

hcl
Copy code
resource "aws_s3_bucket" "app_data" {
  bucket = "my-app-data-bucket-${random_id.bucket_id.hex}"
  acl    = "private"
  tags = {
    Name = "app-data-bucket"
  }
}

resource "random_id" "bucket_id" {
  byte_length = 4
}
Initialize and Apply Terraform Configuration

Run the following commands to initialize and apply the configuration:

sh
Copy code
terraform init
terraform apply
Step 2: Configuration with Ansible
Ansible Inventory

Create an inventory file hosts with the IP address of your EC2 instance:

ini
Copy code
[web]
<EC2_INSTANCE_PUBLIC_IP>
Ansible Playbook

Create a playbook setup.yml to install necessary software and configure the instance:

yaml
Copy code
---
- hosts: web
  become: yes
  tasks:
    - name: Update and upgrade apt packages
      apt:
        update_cache: yes
        upgrade: dist

    - name: Install Nginx
      apt:
        name: nginx
        state: present

    - name: Start Nginx service
      service:
        name: nginx
        state: started
        enabled: yes

    - name: Create a simple index.html
      copy:
        dest: /var/www/html/index.html
        content: |
          <html>
          <head>
            <title>Welcome</title>
          </head>
          <body>
            <h1>Hello from Ansible!</h1>
          </body>
          </html>
Run the Ansible Playbook

Execute the playbook to configure the EC2 instance:

sh
Copy code
ansible-playbook -i hosts setup.yml
Step 3: Documentation
Setup Process

Terraform: Create and configure main.tf with provider, VPC, subnets, security groups, EC2 instance, and S3 bucket. Run terraform init and terraform apply to provision the infrastructure.
Ansible: Create an inventory file with the EC2 instance's IP address. Create a playbook to install and configure necessary software. Run ansible-playbook to configure the instance.
Execution Commands

sh
Copy code
# Terraform commands
terraform init
terraform apply

# Ansible commands
ansible-playbook -i hosts setup.yml
Step 4: Screenshots and Logs
Terraform Output
Screenshot showing the successful Terraform apply output, including the provisioned resources.
Ansible Output
Screenshot of the Ansible playbook execution.
Running Instance
Screenshot of the EC2 instance's public IP address in the browser displaying the "Hello from Ansible!" message.
By following this guide, you will have a fully automated process to provision and configure your AWS infrastructure using Terraform and Ansible.





