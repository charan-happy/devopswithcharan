Contents:

Introduction to Terraform

Providers, Resources 

Modules

Statefile, State Management, Remote Backend

Provisioners

Workspaces

Secrets Management with vault.


**Before IAC :**

- Slow deployment
- Expensive and limited Automation
- Human Errors
- Wasted Resources and inconsistency Provision, configure , update & delete the infrastructure via code is called as **Infrastructure as code (IAC)**

![image](https://github.com/Charan-happy/Learn_Devops_tools/assets/89054489/5386a069-1e13-4aaa-be25-d8f7566e66c1)


**Types of IAC tools :**

**1. Configuration Management EX : Ansible, chef, puppet and salt stack
2. Server Templating   EX : Docker, Vagrant , Puppet
3. Provisioning Tools   EX : Terraform, cloud Formation**

**Configuration Management Tools :**

- Designed to install & Manage software
- Maintains standard structure
- Version control
- Idempotent

**Server Templating Tools :**

- Pre-installed software & Dependencies
- Virtual Machine/docker image
- Immutable Infrastructure

**Provisioning Tools :**

- Deploy Immutable infrastructure resources
- Servers, databases, network components etc
- Multiple Providers

<image>

**Why Terraform ?**

- Cloud/provider Agnostic
- Free & opensource
- TF uses hashi corp configuration language (**HCL)** with "**.tf"** extension
- Terraform works in 3 phases.
    - 1.init
    - 2. plan
    - 3. Apply
- Every object managed by terraform is called **Resource. EX:** file, s3 service etc
- Terraform records the state of the infrastructure.
- **State** is the blueprint of the infrastructure deployed by terraform
- TF can read the attributes of existing infrastructure components by configuring data sources which can be later used for configuring other resources within terraform.
- TF can import other resources outside of the tf & take it up under its control.

$ terraform version --> to see terraform version in our present system

**HCL  Basics :**

<block> <parameter> {

Key1 = value1

Key2 = value2

}

# local.tf

```
 resource "local-file" "pet" {

filename = "/root/pet.txt"

content = "I love pets"

}
```

Here "resource" -> Block Name

"local-file" -> local-provider/resource type

"pet" -> Resource Name

**Resource :**

**```````````````**

- **>** The object that terraform manages.
- > A resource can be anything like database server, cloud instance, physical server on premises etc
- > TF manages the resources lifecycle from it's provisioning to configuration to decomissioning.

**State :** state is the blueprint of the infrastructure deployed by terraform.

**Terraform workflow :**

**1. Write configuration file
2. Run terraform init command
3. Review the execution plan using "terraform plan" command
4. Apply changes using "terraform apply" command**

**$** terraform show --> To see the details of the resources that we have created.

$ terraform destroy -> To delete the resources completely

$ terraform apply -> To update the resources.

**Terraform providers :**

**Providers** help terraform to manage third party applications through API.

Terraform provides 100s of providers.

There are 3 tiers of providers.

1. Official [ Owned & managed by terraform ]
2. Partner [ owned & maintained by third party company ]
3. Community [ owned & maintained by a group of individuals ]

**Plugins** are downloaded into hidden directory of working directory.

EX : ls /root/terraform-local-file/.terraform/plugins

Providers=plugins

**Configuration Directory :**

| File Name | Purpose |
| --- | --- |
| Main.tf | Main configuration file contains resource definition |
| Variables.tf | Contains variable declaration |
| Outputs.tf | Contains outputs from resources |
| Provider.tf | Contains provider definition |

```
**Input variables ;**

**# variables.tf**

variable "filename" {
default = "/root/pets.txt"
}

variable "content" {
default = "love pets"
}

variable "prefix" {
default = "Mrs"
}

variable "separator" {
default = "Mrs"
}

variable "length" {
default = "1"
}

# main.tf

resource "local_file" "pet" {
filename = var.filename
content = var.content
}

resource "random_pet" "my-pet" {
prefix = var.prefix
separator = var.separator
length = var.length
}
```

# variables.tf

```
variable "filename" {

default = "/root/pets.txt"

}

variable "content" {

default = "love pets"

}

variable "prefix" {

default = "Mrs"

}

variable "separator" {

default = "Mrs"

}

variable "length" {

default = "1"

}
```

# main.tf

```
resource "local_file" "pet" {

filename = var.filename

content = var.content

}

resource "random_pet" "my-pet" {

prefix = var.prefix

separator = var.separator

length = var.length

}
```

**Basic Variable Types :**

| Type | Example |
| --- | --- |
| String | "/root/pets.txt" |
| Number | 1 |
| Bool | True/False |
| Any | Default value |
| List | ["mat", "chat"] |
| Map | Pet1=cat
Pet2=dog |
| Object | Complex data structure |
| Tuple | Complex data structure |

**Set** is similar to **list**

****The difference between a set and list is that a set cannot have duplicate elements.

**Tuple** is similar to **list** and consists of sequence of elements.

The difference between tuple & list is that list uses elements of same variable type such as string or number.

- -> if we haven't given default values in **variable.tf** file and run "**terraform apply"** command then it will prompt us to give the values in interactive mode.

**Command line flags :**

**$   terraform apply -var "filename=/root/pets.txt" -var "content = we love pets!"**

**Environmental variables :**

**$ export TF_VAR_filename="/root/pets.txt"**

**$ export TF_VAR_content="we love pets!"**

**Variable Definition Files :**

# terraform.tfvars

filename = "/root/pets.txt"

content="we love pets!"

prefix="Mrs"

separator=","

length="2"

The different name formats of variable definition files in terraform are terraform.tfvars, terraform.tfvars.json, *.auto.tfvars,*.auto.tfvars.json

**Variable definition precedence :**

- **var or -var-file [command line flags]**
- **.auto.tfvars (alphabetical orders)**

**Terraform.tfvars**

**Environmental variables.**

**What is the difference between variable.tf and variables.tfvars files in terraform ?**

- **>** variable.tf is the place where you declare variables and variable.tfvars where you assign values to those variables.

**Resource Dependencies :**

**1. Implicit Dependency : terraform defines itself
2. Explicit Dependency : Using "depends_on" keyword**

**Resource Attribute Reference :**

**$ {resource-name.resource-type.id}  --> interpolation sequence :** To convert result to string

**Output variables :**

These variables can be used to store the values of an expression  in terraform.

Output "<variable-name>" {

Value ="<variable-value>"

}

$ terraform output --> To see the value of output variable

**Where do we use output variables ?**

**1. To quickly display details about the provisioning resources in the terraform
2. To feed output variables to other configuration management tools like Ansible, shell scripting etc**

**Terraform state :**

**>** Terraform state file is with ".tfstate" extension

> it is json datastructure

**Purpose of state :**

- **>** State file is the blueprint for all the resources created by terraform
- -> It tracks resource's meta data details like dependencies
- -> Performance
- -> Collaboration

$ terraform plan --refresh=false --> to skip the default behavior of refreshing Terraform state before checking for configuration changes.

- > state is a non-optional feature in terraform.

**Mutable vs Immutable Infrastructure :**

**In-place upgrade :**

Something that we can change is called **mutable.**

Something that we cannot change is called  **Immutable infrastructure.**

**The underlying infrastructure is same but the software configuration on these servers has changed as part of update.** This is an example for mutable infrastructure.

- Failure in upgrade may be due to number of issues like
    - Network issues impacting the software repository
    - File system full
    - Different versions of operating system

**Lifecycle rules :**

By default in terraform if we wanted to create a new configuration file for the older one. Old file got deleted first, then only new file generated.

What if we wanted to keep both files or we wanted to destroy old file only after new file created. These can be achieved with the help of lifecycle rules in terraform.

```
lifecycle {

prevent-destory = true

}
```

These rule will not applicable if you use $ terraform destroy command.

- > These rule only useful in preventing from changes that are made to the configuration & subsequent apply

```
lifecycle {

ignore-changes = all

}

lifecycle {

ignore-changes {

tags, ami etc.

}

}
```
**EX :**

# main.tf

```
resource "local_file" "pet" {

filename = "/root/pets.txt"

content = "I love pets"

file_permission = "0700"

lifecycle {

create_before_destroy = true

}

}
```
**Lifecycle rules**

| Order | Option | Description |
| --- | --- | --- |
| 1 | Create_before_destory | Create resource first & then destroy older |
| 2 | Prevent_destroy | Prevents destroy of a resource |
| 3 | Ignore-changes | Ignore changes to resource attributes ( specific/all ) |

**Data sources :**

| Resource | Data source |
| --- | --- |
| Keyword : resource | Keyword : data |
| Creates, updates, destroys infrastructure | Only Reads infrastructure |
| Also called as "managed resource" | Also called as "Data Resource" |

**Datasource** can only read resource data and use that information within terraform

**Meta argument :**

- It can be used in any resource block to change the behaviour of resources.

**Meta argument types :**

**1. Depends_on
2. Lifecycle
3. Count
4. For-each and many more**

**Count :** one of the easiest ways to create multiple instances is to make use of "count" meta argument.

**Count & length function**

# main.tf

```
resource "local_file" "animal" {

filename = var.filename[count.index]

count = length(var.filename)

}
```
# variable.tf

```
variable "filename" {

default = [

"/root/pets.txt"

"/root/dogs.txt"

"/root/cats.txt"

"/root/ducks.txt"

"/root/cows.txt"

]

}
```
**For each :**

# main.tf

```
resource "local_file" "pet" {

filename = each.value

for_each = toset(var.filename)

}

output "pets" {

value = local_file.pet

}
```

# variable.tf

```
variable "filename" {

type = list(string)

default = [

"/root/dogs.txt"

"/root/cats.txt"

]

}
```
**Note :** when we use "for each" as a meta argument instead of "count" then we can see the values are converted into map & an ordered list

**Version constraints :**

```
terraform {

required_providers {

local = {

source = "hashicorp/local"

version = ">1.2.0, <2.0.0,! =1.4.0"

}

}

}

resource "local_file" "pet" {

filename = "/root/pet.txt"

content = "we love animals"

}
```
Version ="~>1.2" --> specific version or any incremental version

# Heredoc syntax

[command] << DELIMETER

Line1

Line2

Line3

DELIMETER

**AWS IAM with Terraform :**

# main.tf

```
resource "aws_iam_user" "admin-user" {

name = "charan"

tags = {

Description = "Systems Associate"

}

}
```
# To add credentials

.aws/config/credentials

- ----------------------

[default]

aws_access_key_id=xxx

aws_secret_access_key = xxx

# To add credentials as environmental variables

$ export aws_access_key_id=xxx

$ export aws_secret_access_key=xxx

$ export aws_region=xxx

**IAM Policies with terraform & attach to user :**

# main.tf

```
resource "aws_iam_user" "admin_user" {

name = "charan"

tags = {

Description = "Systems Associate"

}

}

resource "aws_iam_policy" "admin_user" {

name = "Adminusers"

policy = <<EOF

<json file>

EOF

}
```
# To attach policy to the user

```
resource "aws_iam_user_policy_attachment" "charan_admin_access" {

user = aws_iam_user.admin_user.name

policy_arn = aws_iam_policy.admin_user.arn

}

policy=file("admin-policy.json")

# admin_policy.json

{

"version" : "2012-10-17",

"statement" : [

{

"effect": "allow",

"action": "*",

"resource": "*".

}

]

}
```
**S3 with terraform :**

# main.tf

```
resource "aws_s3_bucket" "finance" {

bucket = "finance-21092020"

tags = {

Description = "Finance & payroll"

}

}

resource "aws_s3_bucket_object" "finance-2020" {

content = "/root/finance/finance-2020.doc"

key = "finance-2020.doc"

bucket = "aws_s3_bucket.finance.id"

}

data "aws_iam_group" "finance_data" {

group_name = "finance_analysts"

}

resource "aws_s3_bucket_policy" "finance_policy" {

bucket = aws_s3_bucket.finance.id

policy = <<EOF

<bucket-policy>

EOF

}
```
**DynamoDB with Terraform :**

# main.tf

```
resource "aws_dynamodb_table" "cars" {       create table

name = "cars"

hash_key = "VIN"

billing_mode = "pay-per-request"

attribute {

name = "VIN"

type = "s"

}

}

resource "aws_dynamodb_table_item" "car_items" {

table_name = aws_dynamodb_table.cars.name

hash_key = aws_dynamodb_table.cars.name              create/add table items

item = <<EOF

<items in json format>

<<EOF

}
```
**Remote state :**

**What is remote state and remote locking ?**

Remote state also allows teams to share infrastructure resources in a read-only way without relying on any additional configuration store.

**Benefits of terraform state :**

- Mapping configuration to real-world
- Tracking metadata
- Performance
- Collaboration

After applying **terraform apply** command we will get **state file locally** in our system & that too in a **configuration** directory.

**State lock :**

The process of blocking the one operation while two or more operations are running on a same terraform configuration file is called **state locking**  to avoid corruption of state file.

- -> Terraform state file is stored in a remote state backend like S3, Terraform Cloud, Google Cloud, hashicorp consul
- -> When remote backend is configured, terraform will automatically load and upload state file. From a shared location whenever it is required.

**Remote backend uses :**

- Automatically load & Upload state file
- Many backends support state locking
- Security

**Remote backend with S3 :**

# main.tf

```
resource "local_file" "pet" {

filename = "/root/pets.txt"

content = "we love animals"

}
```

# terraform.tf

```
terraform {

backend "s3" {

bucket = "charan-terraform-state-bucket01"

key = "finance/terraform.tfstate"

region = "us-west-1"

dynamodb-table = "state-locking"

}

}
```
**AWS EC2 with terraform**

# main.tf

```
resource "aws_instance" "webserver" {

ami = "ami-ae89djf03"

instance_type = "t2.micro"

tags = {

name = "webserver"

Description = "an nginx webserver on ubuntu"

}

user-data = << EOF

#!/bin/bash

sudo apt update

sudo apt install nginx -y

systemctl enable nginx

systemctl start nginx

EOF

key_name = aws_key_pair.web.id

vpc_security_group_ids = [aws-vpc_security_group.ssh-access.id]

}

resource "aws_key_pair" "weeb" {

public_key = file("/root/.ssh/web.pub")

}

resource "aws_security_group" "ssh-access" {

name = "ssh-access"

description = "allow ssh access from the internet"

ingress {

from_port = 22

to_port = 22

protocol = "tcp"

cidr_blocks = ["0.0.0.0/0"]

}

}

output "publicip" {

value = aws_instance.webserver.public_ip

}

# provider.tf

provider "aws" {

region = "us-west-1"

}
```
**Provisioners:**

Provisioners provide us a way to carryout tasks such as running commands, scripts on remote resources or running locally on the machine where terraform is installed.

1. Remote exec
2. Local exec
3. Destroy time provisioner
4. Failure behaviour

**1. Remote exec**

```
resource "aws_instance" "web-server" {

ami = "ami-09r78930953"

instance_type = "t2.micro"

provisioner "remote-exec" {

inline = [ "sudo apt update",

"sudo apt install nginx -y",

"sudo systemctl enable nginx",

"sudo systemctl start nginx"

]

connection {

type = "ssh"

host = self.public_ip

user = ubuntu

private_key = file("/root/.ssh/web")

key-name = aws_key_pair.web.id

vpc_security_group_ids = [aws_security_group.ssh-access.id]

}

}

}

resource "aws_key_pair" "web" {

<< code hidden>>

}

resource "aws_security_group" "ssh-access" {

<<code hidden>>

}
```
**1. Local exec**

Used to run the tasks on the local machine where we are running terraform binary but not on resources created by terraform.

# main.tf

```
resource "aws_instance" "webserver" {

ami = "ami-00iut87870"

instance_type = "t2.micro"

provisioner "local-exec" {

command = "echo ${aws_instance.webserver.public-ip} >> /tmp/ips.txt"

}

}
```
# cat /tmp/ips.txt

**1. Destroy time provisioner**

# main.tf

```
resource "aws_instance" "webserver" {

ami = "ami-00iut87870"

instance_type = "t2.micro"

provisioner "local-exec" {

command = "echo instance ${aws_instance.webserver.public-ip} created ! > /tmp/intance_state.txt"

}

provisioner "local-exec" {

when = destroy

command = "echo instance ${aws_instance.webserver.public-ip}destroyed ! > /tmp/instance_state.txt"

}

}
```
# cat /tmp/instance_state.txt

**1. Failure behaviour**

# main.tf

```
resource "aws_instance" "webserver" {

ami = "ami-00iut87870"

instance_type = "t2.micro"

provisioner "local-exec" {

on_failure = continue/fail

command = "echo instance ${aws_instance.webserver.public-ip} created ! > /tmp/intance_state.txt"

}

provisioner "local-exec" {

when = destroy

command = "echo instance ${aws_instance.webserver.public-ip}destroyed ! > /tmp/instance_state.txt"

}

}
```
**Provisioner behaviour :**

- **->** With terraform exec & local-exec, we saw run tasks when resource is created. This is default behaviour and we known this as "**creation time provisioner"**
- **->** we can also make the provisioners run before resource is destroyed . This is called as "**Destroy time Provisioner"**
- **->** causing terraform apply to fail if the task specified init is failed for any reason. This is called as "**Failure behaviour"**

**Considerations with provisioners are** local-exec and remote-exec

**Disadvantages :**

**No provisioner information in plan**

**Network connectivity and Authentication**

**To overcome the above issues, terraform recommends make use of native provisioners as resources.**

| Provider | Resource | Option |
| --- | --- | --- |
| AWS | Aws_instance | User_data |
| Azure | Azure_virtual_machine | Custom_data |
| Gcp | Google_compute_engine | Meta_data |
| Vmware vSphere | Vsphere_virtual_machine | User_data.txt |

**Terraform taint :**

**Terraform taint** command informs terraform that a particular object has become degraded or damaged. Terraform represents it by marking the object as "**tainted"** in the terraform state and terraform will propose to replace it in the next plan you create.

Why is terraform tainted?

Terraform automatically marks an object as "tainted" if an error occurs during a multi-step "create" action, because Terraform can't be sure that the object was left in a fully-functional state.

**Terraform untaint** allows you to remove that tainted condition from the resource

$ terraform taint aws_instance.webserver or <resource_instance> --> To mark the resource as tainted

$ terraform untaint <resource-instance> --> To undo a taint

**Debugging :**

**Loglevels**

**INFO**

**WARNING**

**ERROR**

**DEBUG TRACE**

**# export TF_LOG=<log_level>**

**$ export TF_LOG=TRACE**

**$ export TF_LOG_PATH=/tmp/terraform.log --> To store logs persisting in a file**

**$ export TF_LOG_PATH --> To disable logging**

**Terraform Import :**

- **->** Terraform import can be used to import the resources created outside of terraform to a state file.

Terraform import command can only import one resource at a time. It cannot simultaneously import an entire collection of resources, like AWS VPC

**# terraform import <resource-type> .<resource-name> <attribute>**

Once import done then we can update **main.tf** file.

# main.tf

```
resource "aws_instance" "webserver-2" {

#(resource arguments)

}
```
Problems with multiple configuration files :

Complex configuration files

Duplicate code

Increased risk

Limits reusability

**Terraform Modules :**

**Any** configuration directory containing a set of configuration files is called **Modules.**

**$** mkdir /root/terraform-projects/development

# main.tf

```
module "dev-webserver" {

source = "../aws-instance"

}
```
<image >

**Creating and using a module :**

**$ mkdir /root/terraform-projects/ukpayroll-app**

**Main.tf   provider.tf**

# main.tf

```
module "uk-payroll" {

source = "../modules/payroll-app"

app-region = "us-west-2"

ami = "ami-079j3878"

}
```
# provider.tf

```
provider "aws" {

region = "us-west-2"

}
```
**Using modules from terraform registry**

**$ terraform get --> To download module from the registry**

**Advantages :**

- Simpler configuration files
- Lower risk
- Re-usability
- Standardized configuration

**Terraform Functions and Conditional Expressions :**

**Functions :**

**1. Numeric functions
2. String functions
3. Collection functions
4. Type conversion functions**

**$ terraform console --> To get console mode in terraform**

**1. It is used to transform and manipulate numbers**

**EX: max(-1,2,-10,200,-250) # 200**

**$ max(var.num…) # 250**

**1. String functions are used to transform/manipulate the data.**

**$ split(",","ami-xyz, ami, ami-efg")**

**["ami-xyz","ami-Abac","ami-efg"]**

**$ split(",",var.ami)**

**["ami-xyz","ami-abc","ami-efg"]**

**$ lower(var.ami) --> to convert to lowercase**

**$ upper(var.ami) --> to convert to uppercase**

**$ title(var.ami) --> To convert to title case**

**$ substr(var.ami,0,7)**

**$ substr(var.ami,8,7)**

**$ join(",",["ami-xyz","ami-abc","ami-efg"])**

**# ami-xyz, ami-abc,ami-efg**

**$ join(",",var.ami) # ami-xyz, ami-abc, ami-efg**

**1.Numeric functions :**

# variable.tf

```
variable "num" {

type = set(number)

default = [ 250,10,11,5 ]

description = "A set of numbers"

}
```
**2.String functions :**

# variables.tf

```
variable "ami" {

type = string

default = "ami-xyz, ami-abc, ami-efg"

description = "a string containing ami ids"

}
```
**3.collection functions :**

# variables.tf

```
variable "ami" {

type = list

default = ["ami-xyz, ami-abc, ami-efg"]

description = "a list of numbers"

}
```
$ length(var.ami) #3

$ index(var.ami, "ami-abc") #1

$ element(var.ami,2) #ami-efg

$ contains(var.ami,"ami-abc")#true

$ contains(var.ami,"ami-xyz") #false

**1. Map functions :**

# variables.tf

```
variable "ami" {

type = map

default = {"us-east-1"="ami-xyz", "us-central-1"="ami-abc", "ap-south-1"="ami-efg"}

description = "a map of AMI Id's for specific regions"

}
```
**$ Keys(var.ami) [**

**"ap-south-1",**

**"ap-central-1",**

**"us-east-1"**

**]**

**$ values(var.ami) [**

**"ami-abc",**

**"ami-efg",**

**"ami-xyz"**

**]**

**$ lookup(var.ami, "ca-central-1") # ami-efg --> to get specific key in a map**

**Conditional Expressions :**

# Generate password in bash script

# script.sh

if [ $ length -lt 8 ]

then

length = 8;

echo $ length;

else

echo $ length;

fi

# main.tf

```
resource "random_password" "password-generation" {

length = var.length <8 ? 8: var.length

# condition ? trueval :false val

}

output "password" {

value = random_password.password-generation.result

}
```
# variables.tf

```
variable "length" {

type = number

description = "the length of the password"

}
```
$ terraform apply -var=length=5

**Terraform workspaces :**

- **>** with workspaces we can use the same configuration directory to create multiple infrastructure environment

$ terraform workspace new <workspace name > --> To create & switch to the new workspace

$ terraform workspace list  ---> To list out the workspaces created

$ terraform.workspace -->To get workspace that we are in currently.

$ terraform workspace select project A --> To switch to project A

- -> Terraform stores state files of workspace in **terraform.tfstate.d**

**Local values :**

- Terraform local values or "locals' assign a name to an expression or value using locals simplifies your terraform configuration. Since, you can reference the local multiple times, you reduce duplication in your code.
- Locals are only available **within the configuration file** in which they are defined. This means you cannot reference a local defined in one file form another file
- If you need to share values **across multiple files, you will need to use terraform variables or modules instead.**
- Locals cannot be used as **outputs**

**Dynamic blocks & splat expressions :**

- Terraform dynamic blocks are a way to dynamically generate terraform configuration code based on the values of variables or maps.
- Dynamic blocks enable you to generate terraform resources based on input values and make your configurations more flexible, reusable & easier to manage

# main.tf

```
resource "aws_instance" "web" {

ami = "ami-9uuljkfj88yiou"

instance_type = "t2.micro"

tags = locals.common-tags

}

resource "aws_instance" "db" {

ami = "ami-907ijfdh8698"

instance_type = "m5.large"

tags = local.common-tags

}

locals {

common_tags {

department  = "finance"

}

}
```
**Splat expressions :**

**A splat expression** provides a more concise way to express common operation that could otherwise be performed with a far expression. If var.list is a list of objects that all have an attribute id, then a list of ids could be produced with the following for expression :

[for 0 in var.list:0.id]

**Terraform cloud :**

- **->** It is a SAAS environment that help teams to use terraform together.

**Benefits :**

- Shared state
- Consistent & Reliable environment
- UI Interface
- Secret Management
- Access Controls
- Private Registry
- Policy Controls

**Terraform cloud plans**

**1. Free plan
2. 
    1. Remote state
    2. Remote operations
    3. Private Module Registry
    4. Community Support
3. Teams Plan
4. 
    1. Free plan + Team Management
5. Teams & Governance
6. 
    1. Teams plan +
    2. Team Management
    3. Policy as code(sentline !)
    4. Policy enforcement
    5. Cloud SLA & Support
7. Business
8. 
    1. SSO
    2. Custom concurrency
    3. Self hosted options
    4. Premium support**

**Vital points for VPC :**

- **----------------------------**
- **An** instance created in one VPC can never communicate with an instance in another vpc using their private Ip address.
- Every AZ has it's own public & Private subnet
- All the public subnets will be connected to an internet gateway, this instance will have public IP's as well
- Instances launched in the private subnets will not be having public IP & will not be accessible from internet.
- However, instances from vpc-main-public can reach vpc-main-private because they all are in same vpc provided firewall is configured.

**Terraform commands :**

| Command | Description |
| --- | --- |
| Terraform validate | To check syntax |
| Terraform fmt | To improve
  readability of terraform configuration file |
| Terraform show | To show the
  current state of the resource |
| Terraform show --json | To print output in
  json format |
| Terraform providers | To see all the
  list of providers used in terraform configuration directory |
| Terraform providers mirror
  /root/terraform/new-local-file | To copy provider
  plugins needed for the current configuration to another directory |
| Terraform output | To print all the
  output variables in configuration directory |
| Terraform refresh | To sync terraform
  with real world infrastructure |
| Terraform graph | To see output in
  graph format |
| $ apt install graphviz -y | To install graph
  visualization software |
| Terraform graph | dot -Tsvg > graph.svg | To see data in
  graphical/understandable format |

**Terraform apply failed inspite of terraform validate
working what is the reason for it ?**

- This is because the validate command only
carries out a genaral verification of the configuration. It validated the
resource block and argument syntax but not the values the arguments expect for
a specific resource.

**Terraform state command**

**Syntax :**

**Terraform state <sub command> [options] [args]**

| Command | Description |
| --- | --- |
| Terraform state list | To list all the resources in terraform state file |
| Terraform state show [option] [address]
 
EX : terraform state show aws_s3_bucket.finance-2020922 | To get complete attributes of the s3 bucket named in the command |
| Terraform state mv [options] source destination
 
EX : terraform state mv aws_dynamodb_table.state-locking aws_dynamodb_table.state-locking-db | To move state file named "state-locking" to "state-locking-db" |
| Terraform state pull [optional] source destination
 
Terraform state pull | To see & download the remote state file. |
| Terraform state pull | jq 'resources[] | select(.name  == "state-locking-db"|.instances[].attributes.hash-key' | To filter the required data |
| Terraform state rm address
 
EX: terraform state rm aws_s3_bucket.finance-2020922 | To delete items from the terraform state file |

**NOTE :**  After removing state file with the above command, we also need to remove from the configuration file as well.

It is not removed from the real-world infrastructure. But only removed from the terraform management
