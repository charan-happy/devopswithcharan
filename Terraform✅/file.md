1. Introduction to terraform
2. Installation
3. First Terraform Project
4. Resources
5. Providers
6. Datasources
7. Outputs
8. Locals
9. Templates & files
10. Project layout
11. Modules
12. Plan
13. State
14. Workspace
15. Provisioners


- Terraform is an industry leading infrastructure as code tool that allows you to define your system in
code and then run it to make what your infrastructure look exactly how you have defined. Terraform
allows you to configure pretty much anything from any cloud including Azure, AWS, GCP to any
other component or service like Postgres, Kong or DNSimple to name but a few. The list really is
almost endless

- Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. It
takes your infrastructure you have defined in code and makes it real!

  #### Issues with configuring infrastructure manually

1. Repetition over environments
2. Manual work may lead to Erros
3. More Time consumption
4. hardtimes in Destroying infra at a time

- Terraform uses a language called HCL (hashicorp configuration language ) to write code. HCL as you
will see is a very simple, easy to read syntax that is completely understandable even to someone
looking at it for the first time. This makes it straight forward to read through the code that defines
the environment and work out what it is going to do.

- Terraform has a solution if you already have infrastructure and you want to start using Terraform
to manage it. You can do this by **importing** your infrastructure into Terraform. This is great as allows you to move your infrastructure from being manually setup to being defined in code

  ### why not just use cloudformation ?
  - Even though CloudFormation is from AWs There are so many benefits in using terraform . Which are as follows:
    1. Execution speed is high in terrarorm when compared to cloudformation
    2. Cloud formation uses JSON or YAML for configuration. Which is also having drawbacks (like json no support of comments and yaml comments supported but indentation is main concern of it )
       But Terraform uses HCL, which has a clean concise syntax. It is very easy to read, allows comments
(both inline and block) and is not fussy about spacing, newlines or indentation. you can easily split your project up into
multiple files as you see fit. To make the code easier to read and understand when coming to the project.

    3. Terraform is global tool not just for particular vendor (like AWS)

  ### What about chef, puppet don't they solve problems like terraform ?
  - Chef and Puppet are configuration management tools. They are designed to configure and manage
software that is running on a machine (infrastructure) that already exists. Whereas Terraform sits at
the abstraction layer above that and is designed to setup all of the infrastructure that make up your
system such as load balancers, servers, DNS records etc.

## Installation

- Visit the official Terraform download page and download the latest version for your target platform.
Unzip the download to extract the Terraform binary. Terraform runs as a single binary so all you
need to do is move the binary so that it is in a folder that is in your path. The follow varies slightly
by platform :

**Mac OS/Linux**

1. Open up a Terminal
2. Change into the downloads directory, normally by running cd ∼/Downloads
3. Move the Terraform binary into /usr/local/bin by running mv ∼/Downloads/terraform
/usr/local/bin/
4. Test the installation by running terraform version, if installation is successful then you should
see such as Terraform v0.12.7

**Windows**

1. Move the unzipped Terraform binary into your desired folder such as c:\Terraform
2. Search for View advanced system settings
3. In then window that appears click environment variables
4. In the system variables section at the bottom find the path variable, left click it to select it and
then click edit
5. In the edit system variable window scroll to the end of the variable value box, ensure that it
ends in a ; then enter the path where you moved the Terraform binary into e.g. c:\Terraform
1. Click ok to close all of the windows you have opened
1. Open up a Command prompt by pressing the windows key, typing cmd and pressing enter.
2. Test the installation by running terraform version, if installation is successful then you should
see such as Terraform v0.12.7

**Setting up your free AWS Account**

Due to the fact Amazon change these pages quite a bit, I’m just going to talk through the general
process of what you need to do.
1. Head over to https://aws.amazon.com
2. Click on the create Free Tier Account link
3. Fill in your details
4. You will need to register a payment card. This is so that if you go over your free tier Amazon
charge you. Do not worry about this if you follow the examples in this book nothing should
cost any money. Just remember to delete the infrastructure once you have finished with it.
Luckily Terraform can do this for you!
5. I recommend that you turn on 2FA for your newly created AWS log in

**Setup an AWS user for use with Terraform**
We now need to create an AWS user that we can use with Terraform. For the purposes of this book
we are going to create an account which has administrator permissions. This is not recommended
for a production setup. I cover best practices for AWS configuration later in the book.
1. Log into your AWS account and you have access and go to the IAM section, you can do this
by searching for IAM in the search box on the main AWS page and then clicking on the link
2. Select Users from the left hand menu
3. Select Add User at the top
4. Type in any username you like
5. For access type select Programmatic access only
6. Click Next
7. On the set permissions screen select ‘
Attach existing policies directly‘
1. Tick AdministratorAccess which should be the top of the list
2. Click Next
3. Click Next again, now you should see a summary of the user you are about to create
4. Click the Create User button and the user should be created
5. Store the Access Key Id and Secret Access Key somewhere safe as this is the only time you will
see them

**Setup an AWS Credentials file**

The last thing we need to do is create an AWS Credentials file. This is so that Terraform can get the
programmatic credentials for the AWS user we created above.
You need to create a file and with the following text, replacing the two placeholders with the access
key id and secret access key you got from AWS when you created your admin user.
1 [default]
2 aws_access_key_id = <access_key_id_here>
3 aws_secret_access_key = <secret_access_key_here>
Lastly save the file to the path given in the table below based on your OS:
OS Credentials file path
Windows %UserProfile%/.aws/credentials
Mac OS/Linux ∼/.aws/credentials

## Your first terraform project

```.tf
provider "aws" {
region = "us-east-1"
}
resource "aws_s3_bucket" "first_bucket" {
bucket = "Nagacharan-first_bucket"
}
```

- To configure the provider we use the keyword provider then follow it with the name of the provider
in quotes in this case "aws". We start the provider block by opening a curly brace {. We can now
specify any parameters we want to configure the provider. To pass a parameter you simply put the
name of the parameter followed by an equals sign then the value you want to give the parameter in
quotes, in our example we are setting the region this provider will use to be eu-west-1. This is the
region where the AWS Terraform provider will create all of the infrastructure we define. We then
end the provider block with a closing curly brace }.

- The next block we have defined is a resource. A resource in Terraform represents a thing in the
real world. In this case an S3 bucket. To define a resource you start a resource block by using the
keyword resource. You then follow it with the resource you want to create in quotes. We want to
create an S3 bucket so we are using the S3 resource "aws_s3_bucket". If you are following along in
IntelliJ and typing in the code you might have noticed that IntelliJ gave you a full list of possible
resources once you started typing. You can see the full list on the AWS provider page if you are
interested: https://www.terraform.io/docs/providers/aws/index.html. After we have specified the
type of resource we want to create we then put another space and then the identifier you want
to give that resource in quotes, in our example "first_bucket". We then open the block in the
same way that we did for the provider block with an opening curly brace {. Next we can give any
parameters the resource takes values. We are only setting the name of the bucket. You then end the
resource block with a closing }

### Creating your first infrastructure with Terraform

The first thing you have to do with a new Terraform project is initialise Terraform for that project.
To do this go to your Terminal and cd into the folder where your project is, if you followed this guide
exactly then cd into the folder named MyFirstTerraformProject. Now run the following command:

`terraform init`

You will see some output on the screen as Terraform initialises, then you should see the message
Terraform has been successfully initialized!. Once you have initialised Terraform you are
now ready to create the infrastructure by running:

`terraform apply`

After you run the apply you will see quite a lot of output from Terraform. You will notice that the
apply has paused and is awaiting a response from you.

Lets pause for a second and look at what is happening here. By default when you run terraform
apply Terraform will look at the code you have written and then compare it to the infrastructure
that you currently have (in this case in AWS). Once Terraform has done this it calculates a plan.
The plan is what Terraform is going to do to get the real infrastructure from where it is now to
how you have specified you want it to be in code. From looking at the plan we can see Terraform
is saying if you do this it will create an S3 bucket. You have told Terraform you want an S3 bucket
and Terraform went to AWS to check and realised that there is not an S3 bucket in AWS with that
name, so it knows that the plan it needs to do is create the bucket.

The great thing about this plan is that Terraform presents it to us and then pauses and lets us decide
whether we want to go ahead. You can imagine how useful this is if you accidentally make a change
that is going to destroy your database! To get Terraform to make these changes and create the S3
bucket type yes and press enter.

Once the apply has finished you should see the message Apply complete! Resources: 1 added,
0 changed, 0 destroyed.. This is Terraform telling you that it successfully created the S3 bucket
for you. Log onto the aws console (website), go to the S3 section and you will see the bucket that
Terraform created. Delete the bucket from the AWS console. Now go back to the terminal and run
terraform apply again. You will notice that Terraform has worked out the S3 bucket is not there
anymore so it needs to create it again. At no point did you tell Terraform the bucket was gone,
Terraform worked it out. Confirm the apply (by typing yes) so the S3 bucket exists again. Now run
terraform apply again when the bucket is there. You will see Terraform output Apply complete!
Resources: 0 added, 0 changed, 0 destroyed.. Terraform realises that the state of the world is
exactly how you want it to be, so Terraform is saying “nothing to do here!”.
To finish up lets destroy the infrastructure we created, don’t worry Terraform can take care of that
for us. Simply run the command terraform destroy. Terraform will present a plan to you of what it
is going to destroy and then pause so you can confirm. Type yes and press enter. When the destroy
finishes you will see a message Destroy complete! Resources: 1 destroyed.. This is telling you
Terraform has successfully destroyed everything. Log into the AWS console and go to S3 and you
will see that the bucket is now gone.

That concludes our first experience with Terraform. I hope that you can start to see the power that
Terraform provides and how simple it is to use. Feel free to play around with this project and try
changing the properties like the name of the S3 bucket and see what happens. That is a great way
to learn. Just remember to run terraform destroy when you are finished to ensure that you are not
left with any infrastructure running in AWS.

## Resources

-  Resources are the fundamental components of Terraform configurations. They represent individual infrastructure objects or services that you want to manage, such as virtual networks, compute instances, or DNS records. Each resource block defines the desired state of a specific infrastructure element. 

-  you can create resources that represent things from multiple vendors (for example
multiple clouds) in a single project.

- - If we look back at our S3 bucket resource the last word on the line in quotes was "first_bucket".
This is the identifier for that S3 bucket within your Terraform project. The identifier is what we use
inside our project to refer to an instance of a resource. You can create multiple instances of the same
resource for example you could create many S3 buckets. The identifier gives you a way to reference
each one.
The key name value pairs that make up the body of the resource are the properties for the resource.
Some properties on the resource are mandatory and some are optional. For an AWS S3 bucket the
only mandatory property is the name of the bucket. We could have set more properties on the bucket
for example :

```.tf
1 resource "aws_s3_bucket" "first_bucket" {
2 bucket = "kevholditch-first-bucket"
3 acl = "private"
4
5 versioning {
6 enabled = true
7 mfa_delete = false
8 }
9 }
```

Lets take a look at another resource type so we can examine the other data types that resources can
take in their properties:

```.tf
1 resource "aws_security_group" "my_security_group" {
2 name = "allow_tls"
3 ingress {
4 protocol = "tcp"
5 from_port = 443
6 to_port = 443
7 cidr_blocks = ["10.0.0.0/16", "11.0.0.0/16"]
8 }
9 }
```

In the resource above we have the two other types of data resources can take numbers and lists. The
port properties (from_port and to_port) are numbers, these are set by just providing the value with
no quotes. cidr_blocks is a list type, it takes a list of CIDR blocks to restrict for this security group
to. You can see that a list is given in the same way a JSON array of strings is created where you
surround it in square braces.


**🧩 Terraform Interpolation Explained**: In Terraform, interpolation is the process of replacing placeholders within a string with their corresponding values. These placeholders are enclosed in ${} and can represent variables, expressions, or other Terraform constructs. 

🪄 Interpolation in Action: Consider the following example:

```.tf
resource "aws_instance" "example" {
  ami           = "${var.aws_ami}"
  instance_type = "${var.instance_type}"
}
```
Here, the values of the variables aws_ami and instance_type will be substituted into the ami and instance_type attributes of the aws_instance resource. 

🧱 Interpolation Syntax: Terraform supports various interpolation syntaxes, including:

${variable_name}: Inserts the value of a variable.
${expression}: Evaluates a Terraform expression.
${object.attribute}: Accesses an attribute of an object.
${function_call(arguments)}: Calls a Terraform function. 

Using the output from one resource as the argument to another resource is called `Interpolation`

Consider the following project (which can be found in same repository in the folder resources_-
example_02). If you do not want to copy from the example repository then create a new folder, create
a single file in the folder called main.tf and place the following code:

```.tf
1 provider "aws" {
2 region = "us-east-1"
3 }
4
5 resource "aws_vpc" "my_vpc" {
6 cidr_block = "10.0.0.0/16"
7 }
8
9 resource "aws_security_group" "my_security_group" {
10 vpc_id = aws_vpc.my_vpc.id
11 name = "Example security group"
12 }
13
14 resource "aws_security_group_rule" "tls_in" {
15 protocol = "TCP"
16 security_group_id = aws_security_group.my_security_group.id
17 from_port = 443
18 to_port = 443
19 type = "ingress"
20 cidr_blocks = ["0.0.0.0/0"]
21 }
```

- This project creates an AWS VPC with CIDR block 10.0.0.0/16. Then it defines a security group
(aws_security_group). In the definition of the security group notice that the value of vpc_id is set
to aws_vpc.my_vpc.id. The value of aws_vpc.my_vpc.id is not known before we run the project as
AWS will randomly assign it when we create the VPC. By referencing the VPC we created it allows
us to use this value even though we do not know what it will be until we run the project.

The format of using an output attribute from a resource is <resource_type>.<resource_identifier>.<attribute_-
name>. In the VPC id example we are getting the output from an aws_vpc resource type, with
the identifier name my_vpc and we want to get the id attribute value. So hence we end up with
aws_vpc.my_vpc.id. It is worth noting here that this syntax was greatly simplified in Terraform
version 0.12. Which is the syntax all of the examples in this book will be using.

Next in our project we define a security group rule (aws_security_group_rule) to allow ingress
traffic on port 443. In the aws_security_group_rule we need to reference the id of the security group
that we want to put this rule in. We can use the same technique as we did when we referenced
the id of the VPC. Lets work through how to figure this out together. It will start with the type
of the resource we want to reference aws_security_group. Next we use the identifier to specify
which instance of the security group we want to use which is my_security_group. Lastly we use the
attribute of that property we want to use, which is id. This leads use to build the expression aws_-
security_group.my_security_group.id which we can use for the value of the property security_-
group_id inside the aws_security_group_rule resource.

The neat thing about using interpolation syntax to reference the attribute of a resource in another
resource is that it allows Terraform to work out the dependency order of the resources. From our
HCL above Terraform can determine that first it needs to create the VPC because it needs the id
that AWS assigns to the VPC in order to create the security group. It then knows that it needs to
create the security group next as it needs the id of the security group in order to create the security
group rule. Terraform uses this information to build up a dependency graph and then tries to run in
parallel as much as possible.

To illustrate the way Terraform can create a project in parallel consider what happens when we
add a new security group rule to our project above (folder resources_example_03 in the example
repository)

```.tf
1 resource "aws_security_group_rule" "http_in" {
2 protocol = "tcp"
3 security_group_id = aws_security_group.my_security_group.id
4 from_port = 80
5 to_port = 80
6 type = "ingress"
7 cidr_blocks = ["0.0.0.0/0"]
8 }
```

When you run the project now with Terraform, it will realise that it can create both security group
rules in parallel. Once the security group they both depend on is created, it will be able to create both
of the rules together. This feature of Terraform makes performance very good. It may seem quite
obvious in this example but as a project grows it can be quite impressive at how much Terraform
can run in parallel

### Providers

-🔌 Terraform Providers Explained In Terraform, providers are plugins that enable interaction with various APIs, including cloud providers, third-party tools, and other services. They act as intermediaries between Terraform and the target infrastructure or service, allowing you to manage resources and configurations. 

🧰 Provider Functionality Providers define the resources and data sources available for managing infrastructure within a specific platform or service. They provide the necessary functionalities to create, read, update, and delete resources, as well as retrieve information about them. 

📚 Provider Examples The Terraform ecosystem offers a vast collection of providers, including those for popular cloud platforms like AWS, Azure, and GCP, as well as for various SaaS tools and other services. You can find a comprehensive list of available providers in the Terraform Registry. 

- A provider is defined using a provider block. You have already used a provider block in the examples
so far in this book, it looks like:

```.tf
1 provider "aws" {
2 region = "us-east-1"
3 }
```

- The provider block is very simple it starts with the keyword provider to indicate that this is a
provider block. You then have to give the name of the provider that you are using. In this case we
are using the aws provider so we put "aws". You then use a { to open the provider block. Inside the
provider block you can put all of the configuration you want for the provider. For the AWS provider
the only property that we are configuring is the region. This will be the region that we are going to
create our AWS resources in. You then end the provider block with a closing }.

- You may be wondering where Terraform puts this provider? It puts it inside the project where you
are currently working in a special folder called .terraform

-  The provider is actually a separate binary which
Terraform calls out to at run time to do its work. As an interesting aside the name of the provider
binary is always in the format terraform-provider-<NAME>_vX.Y.Z. Terraform uses this convention
to search for providers on your machine, so that it knows if you have a particular version of a
provider when you run terraform init. It uses this information to know whether or not to download it.

**More than one instance of the same provider**

```.tf
1 provider "aws" {
2 region = "eu-west-1"
3 version = "~> 2.27"
4 }
5
6 provider "aws" {
7 region = "eu-west-2"
8 alias = "london"
9 version = "~> 2.27"
10 }
11
12 resource "aws_vpc" "ireland_vpc" {
13 cidr_block = "10.0.0.0/16"
14 }
15
16 resource "aws_vpc" "london_vpc" {
17 cidr_block = "10.1.0.0/16"
18 provider = "aws.london"
19 }

```

### Datasources

🔎 Data Sources Explained In Terraform, data sources act as read-only information retrievers. They fetch data from external sources, including cloud provider APIs, existing infrastructure, and other resources. Unlike regular Terraform resources, data sources don't create or modify anything; they simply gather information. 

🔌 Data Source Applications Data sources offer diverse applications in Terraform configurations. They can:

Retrieve existing resource attributes: Obtain information about existing resources in your infrastructure, such as the ID of a specific virtual machine.
Dynamically configure resources: Use data source outputs to dynamically configure other resources within your Terraform code.
Access external data: Fetch data from external APIs or services, like retrieving the current price of a resource from a cloud provider. 
🛠️ Data Source Syntax Data sources are declared similarly to resources, using the data keyword followed by the provider and resource type. They have attributes that specify the data to be retrieved and outputs that expose the fetched information for use in your configuration.

💻 Example: Retrieving an AWS EC2 Instance ID

Here's an example of how to use a data source to retrieve the ID of an existing EC2 instance in Terraform:

```.tf
data "aws_instance" "example" {
  instance_id = "i-0123456789abcdef0"
}

output "instance_id" {
  value = data.aws_instance.example.id
}
```

This code defines a data source named example that retrieves information about the EC2 instance with the ID i-0123456789abcdef0. The output block then displays the instance ID.


**💡 Benefits of Using Data Sources**

Data sources offer several benefits, including:

Dynamic configurations: You can use data sources to dynamically configure your infrastructure based on external data. <br>
Reusability: Data sources can be reused across multiple Terraform configurations. <br>
Readability: Data sources improve the readability of your Terraform code by separating data retrieval from resource management.

## outputs

An output in your Terraform project shows a piece of data after Terraform successfully completes.
Outputs are useful as they allow you to echo values from the Terraform run to the command line.
For example, if you are creating an environment and setting up a bastion jump box as part of that
environment then its handy to be able to echo the public IP address of the newly created bastion to
the command line. Then after the Terraform apply finishes you get given the IP of the newly created
bastion ready for you to ssh straight onto it.

Lets start with an example of outputs. Create a new folder to put our new Terraform project into and
create a single file called main.tf and paste in the following code (or grab the code from outputs_-
example_01 folder inside the examples repository):

```.tf
1 output "message" {
2 value = "Hello World"
3 }
```

Try running this project by opening your terminal. Changing directory into the folder that you
created where the main.tf file is and then running terraform init and terraform apply. You will
see that Terraform runs and then prints the following:

```.tf
1 Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
2
3 Outputs:
4
5 message = Hello World
```
**Outputting resource properties**

```.tf
1 provider "aws" {
2 region = "eu-west-1"
3 }
4
5 resource "aws_s3_bucket" "first_bucket" {
6 bucket = "kevholditch-bucket-outputs"
7 }
8
9 output "bucket_name" {
10 value = aws_s3_bucket.first_bucket.id
11 }
12
13 output "bucket_arn" {
14 value = aws_s3_bucket.first_bucket.arn
15 }
16
17 output "bucket_information" {
18 value = "bucket name: ${aws_s3_bucket.first_bucket.id}, bucket arn: ${aws_s3_bucke\
19 t.first_bucket.arn}"
20 }

```

- Terraform got the values from the S3 bucket that it created and outputted them when the run
completed. Terraform prints the outputs in alphabetical order, not the order that you define them in
your project. That is a good point to make, that Terraform does not care which order you define the
blocks in your project. Try reordering them and running terraform apply again.

Exporting all attributes

- As of Terraform 0.12>, Terraform allows you to output an entire
resource or data block. To do this take the example that we just had and add the following output
(in the examples repository it is outputs_example_03 if you want to just get the code):
```.tf
1 output "all" {
2 value = aws_s3_bucket.first_bucket
3 }
```

Run the project again (terraform apply) and you will notice that you see an output called all that
has all of the attributes that are exported by the aws_s3_bucket resource. Sometimes it can be handy
just to output the whole resource to the console. Normally when you are debugging something and
you want to see what the value of one of the properties is.

## Locals

- A local can refer to a fixed value such as a string or it can be used to refer to an expression
such as two other locals concatenated together or the attribute of a resource that you have created

💻 Terraform Locals Explained In Terraform, locals are named values defined within a module or configuration file. They serve as temporary variables, holding expressions or values that can be referenced elsewhere within the same scope. Locals simplify configuration by avoiding repetitive expressions and promoting code reusability. 

🔨 Creating Locals Locals are declared using the locals block. Within this block, you define key-value pairs, where the key represents the local's name and the value can be any valid Terraform expression. For example:

```.tf
locals {
  bucket_name = "${var.prefix}-${var.environment}-bucket"
  region      = "us-east-1"
}
```
🔁 Using Locals Once defined, locals can be referenced using the local. prefix followed by the local's name. They can be used in various contexts, including resource names, dynamic blocks, and interpolation. For instance:
```.tf
resource "aws_s3_bucket" "my_bucket" {
  bucket = local.bucket_name
  region  = local.region
}
```

**Locals referencing resources**

Locals can reference the output of a resource or a data source by using the expression syntax we
have learnt. This allows you to give something a more meaningful name or to combine outputs from
different resource and data source attributes to build up a more complex value

## Templates and files

#### Files-Example

```.tf
1 provider "aws" {
2 region = "eu-west-1"
3 version = "~> 2.27"
4 }
5
6 resource "aws_iam_policy" "my_bucket_policy" {
7 name = "list-buckets-policy"
8 policy = file("./policy.iam")
9 }
```
Next if you are creating the code yourself, create another file called policy.iam and paste in:

Filename: policy.iam

```.tf
1 {
2 "Version": "2012-10-17",
3 "Statement": [
4 {
5 "Action": [
6 "s3:ListBucket"
7 ],
8 "Effect": "Allow",
9 "Resource": "*"
10 }
11 ]
12 }

```
Template file function :

- To be able to use dynamic values in a file we need to use the templatefile function.
- The templatefile function allows you to define placeholders in a template file and then pass their
values at runtime.

  main.tf
  
```.tf
1 locals {
2 rendered = templatefile("./example.tpl", { name = "charan", number = 7})
3 }
4
5 output "rendered_template" {
6 value = local.rendered
7 }
  ```

example.tf1

```.tf
1 hello there ${name}
2 there are ${number} things to say
```

**Loops in a template**
- You can pass in an array of values into a template and loop round them.

filename: main.tf
```.tf
1 output "rendered_template" {
2 value = templatefile("./backends.tpl", { port = 8080, ip_addrs = ["10.0.0.1", "10.\
3 0.0.2"] })
4 }

```

filename:  backends.tpl 

```.tf
1 %{ for addr in ip_addrs ~}
2 backend ${addr}:${port}
3 %{ endfor ~}

```

## Variables

- A Variable in Terraform is something which can be set at runtime. It allows you to vary what
Terraform will do by passing in or using a dynamic value.

```.tf
1 provider "aws" {
2 region = "eu-west-1"
3 version = "~> 2.27"
4 }
5
6 variable "bucket_name" {
7 description = "the name of the bucket you wish to create"
8 }
9
10 resource "aws_s3_bucket" "bucket" {
11 bucket = var.bucket_name
12 }
```

variable keyword followed by identifier of the variable in quotes.  and inside the variable block description is optional.

variable can be defined as `1 variable "bucket_name" {}`

To use the value of a variable in your Terraform code you use the syntax `var.<variable_-
identifier>`

**variable defaults**
```.tf
1 provider "aws" {
2 region = "eu-west-1"
3 version = "~> 2.27"
4 }
5
6 variable "bucket_name" {
7 description = "the name of the bucket you wish to create"
8 }
9
10 variable "bucket_suffix" {
11 default = "-abcd"
12 }
13
14 resource "aws_s3_bucket" "bucket" {
15 bucket = "${var.bucket_name}${var.bucket_suffix}"
16 }
```

- We have extended the first example and added a second variable "bucket_suffix" and we have set
its default to "-abcd". Setting a default on a variable means that if you do not provide a value for
that variable then the default will be used. We are then using the value of the bucket_name variable
concatenated with the value of the bucket_suffix variable for the value of the bucket name. As
we are using the values inside a string we need to surround our variables with ${ and }. Otherwise
Terraform will not use the value of the variable and instead would just print the string var.bucket_-
name.

**Setting a variable on command line**:
- Run ` terraform apply -var bucket_suffix=hello`
- if we have to give values to multiple variables then we can use -var multiple times

  To set the value of a variable on the command line you use the -var flag followed by the variable
name and the value you wish to use.

**Setting a variable using an environment variable**
-  set an environment variable in your terminal using the convention `TF_VAR_<variable_identifier>`

```.tf
  Mac OS/Linux
1 export TF_VAR_bucket_name=kevholditch
2 export TF_VAR_bucket_suffix=via_env

Windows
1 set TF_VAR_bucket_name=kevholditch
2 set TF_VAR_bucket_suffix=via_env
```

**Setting a variable using a file**
- Create a file with `.tfvars` extension. EX: filename.tfvars

Here i am continuouing with above example only.
```.tf
Inside the terraform.tfvars file place the following:
1 bucket_name = "charan"
2 bucket_suffix = "from_file"
```

terraform.tfvars is a special file name that Terraform looks for to discover values for variables.
Terraform will look in this file and use any values given for a variable.

- The other way we could have named our file was anything ending in `.auto.tfvars`

**More Complex Variables**

main.tf
```.tf
1 variable "instance_map" {}
2 variable "environment_type" {}
3
4 output "selected_instance" {
5 value = var.instance_map[var.environment_type]
6 }

```

terraform.tfvars

```.tf
1 instance_map = {
2 dev = "t3.small"
3 test = "t3.medium"
4 prod = "t3.large"
5 }
6
7 environment_type = "dev"
```

- In our variables file we are setting instance_map to a map. A map is a collection of values indexed
by a key name. We have set 3 keys in our map dev, test and prod. The values we have given for
each of these keys are instance types to use in AWS. This map could be used to set the instance
size based on the type of environment you are creating. Next we are setting the environment_type
variable to dev. Look at the Terraform code we have written and you will see that we are defining
the two variables instance_map and environment_type. At the bottom we are outputting the value
in the map for the key specified by the environment_type variable.

## Type constraints - Simple Types

- A type constraint allows you to specific
the type of a variable. There are 3 simple types string, number and bool.
To specify a type constraint use the type property when defining a variable

```.tf
1 variable "a" {
2 type = string
3 default = "foo"
4 }
5
6 variable "b" {
7 type = bool
8 default = true
9 }
10
11 variable "c" {
12 type = number
13 default = 123
14 }
15
16 output "a" {
17 value = var.a
18 }
19
20 output "b" {
21 value = var.b
22 }
23
24 output "c" {
25 value = var.c
26 }
```

- By using a type constraint you make it illegal to set the variable to anything other than the type
defined. So for example if you try and set b to "hello" or 123 and run Terraform then Terraform will
print an error saying that the value you have provided is not compatible with the type constraint

- There are a few interesting quirks with how the value you give is interpreted that are worth knowing.
When you define the type to be bool then the following values will be valid true, false, "true",
"false", "1" (evaluated to true), "0" (evaluated to false). The interesting part is that "1" is valid but
1 (without the quotes) is not valid.

- As well as the 3 simple types above these types can be combined into the following more complex
types:
• list(<TYPE>)
• set(<TYPE>)
• map(<TYPE>)
• object()
• tuple([<TYPE>, …])

**Type Constraint - LIST**
- A list is a list of a type. So you can have a list of strings like ["foo", "bar"] or a list of number [2,
4, 7]. The type means that every element in the list will be that type.

main.tf

```.tf
1 variable "a" {
2 type = list(string)
3 default = ["foo", "bar", "baz"]
4 }
5
6 output "a" {
7 value = var.a
8 }
9
10 output "b" {
11 value = element(var.a, 1)
12 }
13
14 output "c" {
15 value = length(var.a)
16 }
```

** Type constraint - set**
- Set is almost like list , the key difference is that a set only contains a unique values

```.tf
1 variable "my_set" {
2 type = set(number)
3 default = [7, 2, 2]
4 }
5
6 variable "my_list" {
7 type = list(string)
8 default = ["foo", "bar", "foo"]
9 }
10
11 output "set" {
12 value = var.my_set
13 }
14
15 output "list" {
16 value = var.my_list
17 }
18
19 output "list_as_set" {
20 value = toset(var.my_list)
21 }
```

**Type constraints - Tuple**

A tuple are a strongly typed collection of one or more values. Once a tuple is defined
it always has to contain the number of values as defined in that tuple. The values also have to be
the correct type and in the correct order based upon type.

```.tf
1 variable "my_tup" {
2 type = tuple([number, string, bool])
3 default = [4, "hello", false]
4 }
5
6 output "tup" {
7 value = var.my_tup
8 }
```

**Type Constraint - MAP**
- Type is a set of values indexed by key name. We can give map a  type, the type will be the type of the value

```.tf
1 variable "my_map" {
2 type = map(number)
3 default = {
4 "alpha" = 2
5 "bravo" = 3
6 }
7 }
8
9 output "map" {
10 value = var.my_map
11 }
12
13 output "alpha_value" {
14 value = var.my_map["alpha"]
15 }
  ```

- In this project we are creating a map of type number. We are initialising the map to have two keys
alpha and bravo, the values for the keys are 2 and 3 respectively. The fact that we have specified
that the map is of type (number) means that all of the values have to match the number constraint

**Type Constraint -Object**
- An object is a structure that you can define from the other types listed above. It allows you to define
quite complex objects and constrain them to types.

```.tf
1 variable "person" {
2 type = object({ name = string, age = number })
3 default = {
4 name = "Bob"
5 age = 10
6 }
7 }
8
9 output "person" {
10 value = var.person
11 }
12
13 variable "person_with_address" {
14 type = object({ name = string, age = number, address = object({ line1 = string, li\
15 ne2 = string, county = string, postcode = string }) })
16 default = {
17 name = "Jim"
18 age = 21
19 address = {
20 line1 = "1 the road"
21 line2 = "St Ives"
22 county = "Cambridgeshire"
23 postcode = "CB1 2GB"
24 }
25 }
26 }
27
28 output "person_with_address" {
29 value = var.person_with_address
30 }
```

In the project above we are are first defining a variable called person. This variable has two fields
a name which is of type string and an age which is of type number. To define the object we specify
each field inside {} brackets. Each field has the form fieldname = type. We are giving person some
default values. If you run this project by doing terraform apply you will see that the person output
will contain the values we gave it Bob, 10. These values are constrained to the types give so if you
tried to assign a string to the age field you would get a type constraint error.

One interesting thingto point out here is that you are allowed to have different items with the same name in Terraform.
In this project we have a variable with the identifier person and we have an output with the same
identifier. This is allowed because one is a variable and the other is an output. You are not allowed
to have two variables with the same identifier or two outputs.

Next we are defining a variable called person_with_address to show how you can nest objects
to build up even more complex structures. The person structure is the same as before except we
have added the field address. The field address is in itself an object which contains four strings
line1, line2, county, postcode. You can see when we initialise the variable we set the address
by wrapping the values in a set of {} brackets. When you run the project you will see the person_-
with_address structure printed out

**Type Constraint -Any type**
- The any type is a special construct that serves as a placeholder for a type yet to be decided. any itself
is not a type, Terraform will attempt to calculate the type at runtime when you use any

```.tf
1 variable "any_example" {
2 type = any
3 default = {
4 field1 = "foo"
5 field2 = "bar"
6 }
7 }
8
9 output "any_example" {
10 value = var.any_example
11 }
```

## Project Layout

- Terraform actually does not care what the name of the file is, as long as it ends in .tf. So in all of the projects so far we could have called the
file project.tf, code.tf or foo.tf. It really does not matter.
We can also split the code over as many files as we wish. The only rule is that all of the files have to
be in the same folder because folders have a significance in Terraform

-  only the code in the top level folder is considered by Terraform. It will ignore code inside subfolders

## Modules
- A module in Terraform is a mini Terraform project that can contain all of the same constructs as
our main Terraform project (resources, data blocks, locals, etc). Modules are useful as they allow us
to define a reusable block of Terraform code and have many instances of it in our main Terraform
project

modules Example --> main.tf sqlwithbackooff /main.tf output.tf variable.tf

  main.tf

```.tf

provider "aws" {
  region  = "eu-west-1"
}

module "work_queue" {
  source      = "./sqs-with-backoff"
  queue_name  = "work-queue"
}

output "work_queue_name" {
  value = module.work_queue.queue_name
}

output "work_queue_dead_letter_name" {
  value = module.work_queue.dead_letter_queue_name
}
  ```

sqlwithbackoff/main.tf
```.tf
resource "aws_sqs_queue" "sqs" {
  name                       = "awesome_co-${var.queue_name}"
  visibility_timeout_seconds = var.visibility_timeout
  delay_seconds              = 0
  max_message_size           = 262144
  message_retention_seconds  = 345600 # 4 days.
  receive_wait_time_seconds  = 20 # Enable long polling
  redrive_policy             = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.sqs_dead_letter.arn}\",\"maxReceiveCount\":${var.max_receive_count}}"
}

resource "aws_sqs_queue" "sqs_dead_letter" {
  name                       = "awsome_co-${var.queue_name}-dead-letter"
  delay_seconds              = 0
  max_message_size           = 262144
  message_retention_seconds  = 1209600 # 14 days.
  receive_wait_time_seconds  = 20
}
```
sqlwithbackoff/output.tf

```.tf

output "queue_arn" {
  value = aws_sqs_queue.sqs.arn
}

output "queue_name" {
  value = aws_sqs_queue.sqs.name
}

output "dead_letter_queue_arn" {
  value = aws_sqs_queue.sqs_dead_letter.arn
}

output "dead_letter_queue_name" {
  value = aws_sqs_queue.sqs_dead_letter.name
}
```
sqlwithbackoff/variable.tf

```.tf
variable "queue_name" {
  description = "Name of queue"
}

variable "max_receive_count"{
  description = "The maximum number of times that a message can be received by consumers"
  default = 5
}

variable "visibility_timeout" {
  default = 30
}
```

-  In a module you can take arguments. This allows you to give the user a chance to specify things about
this instance of a module. The module that we have written is a module that creates two AWS SQS
queues. One of the queues is a dead letter queue of the other. For our module we are allowing the user
to specify the name of the queue. We are doing this by defining the variable queue_name. Variables
have a special meaning when used with a module, they are the input values for your module. Note
that inside a module Terraform does not care what the filenames are as long as they end in .tf.
However, there is a convention where variables go in a file called variables.tf so we are going to
stick with that. As the queue_name variable does not have a default a value must be given when the
module is used.

- The last file that makes up our module is output.tf. This is where our outputs (or return values)
from the module are specified. It is optional to return values out of a module but most modules do
return values as it makes them easier to use

- To create an instance of a module we start with the keyword module. You then follow that with the
identifier you want to use to refer to that instance of the module. You then surround the module
block in { and }. Inside the module every module has a property called source. The source property
is where the code is for the module. You can see that we are using the local path ./sqs-with-backoff.
This is telling Terraform that it can find the code for this module in a local folder with that name. We
are then giving a value of work-queue to the queue_name property

- To reference a value returned by a module, you use the following syntax
`module.<module_identifier>.<output_name>`. So to reference the value of the main queue you
would use `module.work_queue.queue_name`. The keyword module is constant.

main.tf crosstalk/ cross-talk-3-way/

crosstalk/main.tf variable.tf   cross-talk-3-way/main.tf variable.tf

```.tf

provider "aws" {
  region  = "eu-west-1"
}

resource "aws_security_group" "group_1" {
  name = "security group 1"
}

resource "aws_security_group" "group_2" {
  name = "security group 2"
}

resource "aws_security_group" "group_3" {
  name = "security group 3"
}

module "cross_talk_groups" {
  source            = "./cross-talk-3-way"
  security_group_1  = aws_security_group.group_1
  security_group_2  = aws_security_group.group_2
  security_group_3  = aws_security_group.group_3
  port              = 8500
  protocol          = "tcp"
}
```
crosstalk/main.tf
```.tf

resource "aws_security_group_rule" "first_egress" {
  from_port                 = var.port
  to_port                   = var.port
  protocol                  = var.protocol
  security_group_id         = var.security_group_1.id
  type                      = "egress"
  source_security_group_id  = var.security_group_2.id
}

resource "aws_security_group_rule" "first_ingress" {
  from_port                 = var.port
  to_port                   = var.port
  protocol                  = var.protocol
  security_group_id         = var.security_group_1.id
  type                      = "ingress"
  source_security_group_id  = var.security_group_2.id
}


resource "aws_security_group_rule" "second_egress" {
  from_port                 = var.port
  to_port                   = var.port
  protocol                  = var.protocol
  security_group_id         = var.security_group_2.id
  type                      = "egress"
  source_security_group_id  = var.security_group_1.id
}

resource "aws_security_group_rule" "second_ingress" {
  from_port                 = var.port
  to_port                   = var.port
  protocol                  = var.protocol
  security_group_id         = var.security_group_2.id
  type                      = "ingress"
  source_security_group_id  = var.security_group_1.id
}
```
crosstalk/variable.tf

```.tf

variable security_group_1 {}
variable security_group_2 {}
variable port {
  type = number
}
variable "protocol" {}
```

crosstalk-3-way/main.tf

```

module "first_to_second" {
  source            = "../cross-talk"
  security_group_1  = var.security_group_1
  security_group_2  = var.security_group_2
  protocol          = var.protocol
  port              = var.port
}

module "second_to_third" {
  source            = "../cross-talk"
  security_group_1  = var.security_group_2
  security_group_2  = var.security_group_3
  protocol          = var.protocol
  port              = var.port
}

module "first_to_third" {
  source            = "../cross-talk"
  security_group_1  = var.security_group_1
  security_group_2  = var.security_group_3
  protocol          = var.protocol
  port              = var.port
}
```

crosstalk-3-way/variable.tf

```

variable security_group_1 {}
variable security_group_2 {}
variable security_group_3 {}
variable port {
  type = number
}
variable "protocol" {}
```

**Remote Modules**

- A remote module is a module hosted
externally to the local file system. Terraform supports many different remote module sources such
as GitHub, BitBucket and S3

```.tf

provider "aws" {
  region  = "eu-west-1"
}

module "work_queue" {
  source      = "github.com/kevholditch/sqs-with-backoff"
  queue_name  = "work-queue"
}

output "work_queue" {
  value = module.work_queue.queue
}

output "work_queue_dead_letter_queue" {
  value = module.work_queue.dead_letter_queue
}
```
- By default Terraform will add on the https:// on the front of the URL so we do not need to include that.

-  If you want to instead clone using SSH
then you can do that by changing the URL to `git@github.com:kevholditch/sqs-with-backoff.git`
which is the SSH clone address. It is cool that Terraform allows you to clone the module either way.
Note you will need SSH setup with GitHub in order for the SSH clone to work.

main.tf
```.tf
provider "aws" {
  region  = "eu-west-1"
}

module "work_queue" {
  source      = "github.com/kevholditch/sqs-with-backoff?ref=0.0.1"
  queue_name  = "work-queue"
}

output "work_queue" {
  value = module.work_queue.queue
}

output "work_queue_dead_letter_queue" {
  value = module.work_queue.dead_letter_queue
}
```

## Plans

- A plan is Terraform showing you how it needs to change the world to get it into the desired state
specified in your code. Terraform plans, detail you what Terraform will create, what Terraform will
destroy and what Terraform will update. This gives you a view on what Terraform is going to do
before you ask Terraform to do it. Terraform summarises how many creates, updates and destroys
it is going to do at the bottom of the plan

- If you want Terraform to create the new queue before deleting the old one
then this is possible using a resource `lifecycle`

- You can save the plan
that Terraform generates to a file by using the -out parameter.

- `-out` is to save your plan

## state

- State is Terraform’s store of all of the resources it has created. State stores all of the information
about the resources, including meta information that cannot be retrieved from the underlying
infrastructure APIs. It also stores the dependency order of the resources that it created. Terraform
uses its state to work out how it needs to make changes. By default Terraform stores state in a local
file called terraform.tfstate. You may have noticed this file in the examples we have been doing
up until now.

EX: RDS instance password and Resource Deletion dependency

- Io import the VPC you created by hand into Terraform go to the AWS UI and copy the VPC ID. Go to
the command line and type terraform import aws_vpc.example <VPC_ID> replacing <VPC_ID> with
the ID of the VPC that you got from AWS. You should see Terraform say Import Successful. Now
if you run terraform apply Terraform will report No changes. Infrastructure is up-to-date..

- terraform import <resource_type>.<resource_-
identifier> <value>. Where <resource_type> is the type of the resource you are importing,
<resource_identifier> is the identifier you gave the resource. <value> can be an id or an identifier
that Terraform can use to go and get the resource. The <value> field is different for every resource.

**Moving resources from one project to another**
- To make
Terraform stop managing the resource we have to remove it from Terraform’s state.
To remove the VPC from the Terraform’s state we need to use the terraform state rm command.

- To remove the VPC from the state run terraform state rm aws_vpc.my_vpc, you will see Terraform say Removed aws_vpc.my_vpc. This now means
that the VPC will not be in Terraform’s state any more, which means as far as Terraform is concerned
it did not create the VPC and is not managing it. Note the VPC still exists in AWS (which is what
we wanted). The format of the Terraform state rm command is terraform state rm <resource_-
name>.<resource_idenitifier>.

- Now open a terminal in the directory for project 2 and run terraform import aws_-
vpc.main <VPC_ID>. This will import the VPC into the state of Terraform. Now run terraform apply
and Terraform should report that there is nothing to do. This is because Terraform in project 2 is
now managing the VPC and it matches our HCL code. Another interesting aside is that we changed
the identifier of the VPC in our HCL code from my_vpc to main.
We have now successfully moved the VPC from one Terraform project to another.

- There is another way to move a resource from one project to another and that is to use the terraform
state mv command.

```
1 terraform state mv -state-out=../state_example_02a/terraform.tfstate aws_vpc.main aw\
2 s_vpc.my_vpc
```
- The advantage of the state mv command is that it works on any resource even if it does not support
an import

-  run the command terraform state list. This command lists all of
the resources that exist in Terraform’s state file

**Remote state**
- By default terraform stores its state file locally with `terraform.tfstate` extension. it is ok if we are working individually on POC project or single person. it doesn't work if we are working with multiple people as  a team or big project. That is where remote state comes into the picture.

- Terraform supports multiple remote state storage backends like AWS S3, AzureRM, consul etc.

- To
specify Terraform to use the S3 state backend we need to create another file called state.tf

```.tf
1 terraform {
2 backend "s3" {
3 bucket = "your-bucket-name"
4 key = "myproject.state"
5 region = "eu-west-1"
6 }
7 }
```

- while selecting the remote backend we have to make sure it supports locking feature. With locking feature multiple people are not able to overwrite it.
- It is not mandatory to have `state.tf` as the name of the state file. it is just our best practice.Terraform doesn't care about the name it only asks us to keep it in .tf extension.

**workspaces**

- A  workspace in Terraform is a way of creating many instances of a set of Terraform code using a
single project. One of the advantages of Terraform is that you can use the infrastructure as code
to create your environments reducing human error and making them all the same

- To list all available workspaces in the current project run the command `terraform workspace list`

  `terraform workspace select default` --> To switch back to default workspace

`terraform workspace new dev` --> to create and switch to new workspace named dev

- The special folder terraform.tfstate.d is where Terraform stores its local workspaces, each workspace has
a folder with its name and in that folder is the terraform.tfstate file for that workspace

- To delete a workspace use the command terraform workspace
delete dev. It is important to note that the delete command will remove the Terraform state it will
NOT destroy the infrastructure

-  the amount that you can drive just from the workspace alone
does not scale well. You really need to have a way to change your input variables at the top-level.
This problem is solved by Terraform’s managed offering Terraform Cloud or Terraform Enterprise.
These solutions allow you to create a workspace, point it at a source control repo containing your
Terraform code and set the variables for that workspace

**provisioners**
- a  provisioner in Terraform is a way to run a script either remotely or locally after a resource
has been created. They were added by Hashicorp to Terraform to allow for certain scenarios that
are not natively supported by the provider you are using

main.tf
```.tf

provider "aws" {
  region  = "eu-west-1"
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = aws_vpc.vpc.cidr_block
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-1a"
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

resource "aws_route_table_association" "gateway_route" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "rules" {
  name   = "example"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.my_ip}/32"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "keypair" {
  key_name   = "key"
  public_key = file("nginx_key.pub")
}

data "aws_ami" "ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*-x86_64-gp2"]
  }
}

resource "aws_instance" "nginx" {
  ami                    = data.aws_ami.ami.image_id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.rules.id]
  key_name               = aws_key_pair.keypair.key_name


  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras enable nginx1.12",
      "sudo yum -y install nginx",
      "sudo chmod 777 /usr/share/nginx/html/index.html",
      "echo \"Hello from nginx on AWS\" > /usr/share/nginx/html/index.html",
      "sudo systemctl start nginx",
    ]
  }

  connection {
    host        = aws_instance.nginx.public_ip
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("nginx_key")
  }
}
```

variables.tf

```
variable "my_ip" {}
```

output.tf
```.tf
output "command" {
  value = "curl http://${aws_instance.nginx.public_ip}"
}
```

-Turning to the file main.tf. We are setting up a vpc which is a virtual private cloud in AWS,
essentially this is a ring fenced private network where we are going to put our infrastructure. The
internet gateway allows machines inside our VPC to access the internet. Next we create a public
subnet and a route table. In the route table we create a default route (0.0.0.0/0) and point that to
our internet gateway. That is basically saying if you are looking for an IP address outside of the
range of our VPC CIDR (10.0.0.0/16) then go out through the internet gateway. We then need to
associate this route table with our subnet using an aws_route_table_association.

- By default, AWS security groups which are basically the firewall around a subnet are DENY all. That
means to allow traffic in and out of our subnet we need to open up ports in (ingress) and out (egress).
This is what we are doing with the aws_security_group resource. We open port 22 ingress so that
we can ssh onto the server and run a script. We only open up port 22 to your IP (this is what we are
using the my_ip variable for). We do this because we do not want to open port 22 to the world as it
means that anyone can try and get onto that server. We open port 80 ingress so we can hit a website
over http running on the server. This is ok to open to any address as its bound to our webserver.
Lastly, we create a rule so that all traffic can egress our server on any port. In practice this isn’t great
and you would want to lock it down, but it makes getting our example up and running easier.
The aws_key_pair resource creates a key pair in AWS. A keypair is used to ssh onto a server. The
keypair that we are setting up is from a local file in the directory. This keypair will not exist on
your machine

- remote-exec means that Terraform will
execute this provisioner remotely on the resource itself, in this case on the EC2 machine. The other
common option is local-exec where the script will run on the machine where Terraform is running
(ie your machine)

- We have just created a full private
network, setup a firewall, created a webserver, installed a custom script on there and got it to print
a message when we visit a page.


- The last part of the script is the aws_instance. We have finally arrived at the resource where our
provisioner is defined. A provisioner is essentially a script that Terraform will execute. We start
the provisioner block on the resource with the keyword provisioner. After provisioner the value
remote-exec is the type of provisioner we want to use, remote-exec means that Terraform will
execute this provisioner remotely on the resource itself, in this case on the EC2 machine. The other
common option is local-exec where the script will run on the machine where Terraform is running
(ie your machine). There are a few other provisioners available too, such as chef and puppet but I’m
not going to discuss those in this book.


**null resource**

🔨 What is a Null Resource in Terraform?

A null resource in Terraform is a special type of resource that doesn't actually provision any infrastructure. Instead, it acts as a placeholder for other resources or configurations in your Terraform code. It allows you to perform actions or manage dependencies without directly creating or managing any infrastructure. 

⚙️ How to Use a Null Resource in Terraform?

To use a null resource, you define it in your Terraform configuration file using the null_resource keyword. You can then specify various attributes and options to control its behavior, including:

triggers: This specifies the conditions under which the null resource will be triggered and executed.
provisioners: This allows you to attach provisioners to the null resource, enabling you to run scripts or perform other actions during the Terraform apply process.
depends_on: This specifies other resources that the null resource depends on, ensuring that it is executed only after those resources have been created or updated. 
💡 Why Use a Null Resource in Terraform?

There are several reasons why you might use a null resource in your Terraform code:

Manage dependencies: You can use a null resource to manage dependencies between resources, ensuring that certain actions are taken only after specific resources have been created or updated.
Execute scripts or commands: You can attach provisioners to a null resource to run scripts or commands during the Terraform apply process, allowing you to perform tasks that are not directly related to infrastructure provisioning.
Create placeholders: You can use a null resource as a placeholder for future resources or configurations, making it easier to manage your Terraform code as your infrastructure evolves

```.tf
1 resource "null_resource" "setup" {
2 provisioner "local-exec" {
3 command = <<CMD
4 ssh -i nginx_key ec2-user@${aws_instance.nginx.public_ip} -o StrictHostKeyChecki\
5 ng=no -o UserKnownHostsFile=/dev/null 'sudo amazon-linux-extras enable nginx1.12; su\
6 do yum -y install nginx; sudo chmod 777 /usr/share/nginx/html/index.html; echo \"Hel\
7 lo from nginx on AWS\" > /usr/share/nginx/html/index.html; sudo systemctl start ngin\
8 x;'
9 CMD
10 }
11 }
```
