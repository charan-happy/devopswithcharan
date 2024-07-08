1. what is terraform and how is it differ from other IAC tools out there in the market ?

2. what are the key components of a terraform configuration ?

3. what are the main benefits of using terraform ?

4. How do you initialize a new terraform configuration ?

5. Explain the purpose of terraform state file ?

6. How can you manage sensitive information like API keys in terraform ?

7. what is the difference between terraform plan and terraform apply ?

8. How do you destroy resources created by terraform ?

9. what is the terraform output command used for ?

10. How do you call module in a terraform configuration ?

11. what is terraform's remote state backend and why is it useful ?

12. Explain the concept of terraform data sources ?

13. what are some of the best practices for organizing terraform code ?

14. Have u used the terraform enterprise version or deployed our own backend ?

15. - Questions:
  - Ques: Tell me about your project in terraform?
    Ans: Project infra, application infra. Onetime resources like VPC, SG, NACL, Databases, LB, Listeners, CDN, ACM, etc these are managed as project infrastructure application infra as in frequently changing resources with every release/deployment like Autoscaling, AMI, Autoscaling policies, rules, etc 
  - Ques: You are going to deploy similar resources in Development, Staging and Prod environments. How can you code so that you can deploy similar Terraform code without  repeating your code.
    Ans:
    - tfvars. Keeping the code same across all environments, we can control using variables and tfvars. values same across all environments will keep in vairables. values different for different environments will keep in tfvars. we will maintain a folder for environment where backend configuration and tfvars are placed.
    - workspaces. we created seperate workspace for every environment, we have respected values in variables for every environment.
  - Ques: If you are tagged to implement Terraform in a team or company where they have never used Terraform, what issues might you solve pre-emptively?
    Ans:
    - state. where to store state. preferably AWS S3 with dynamo DB locking. seperate bucket for each environment.
    - folder structure. divide folder structure logically to limit number of API calls to cloud.
    - env management. How to manage code for different environments?
    - secrets and configurations. Where to store configurations and secrets. preferably keep values in SSM parameter store to share across teams and projects. store secrets also in SSM parameter store with KMS encryption.
    - modules and code sharing. implement modules across the project, force other teams to use them. You will have full control to implement best standards at the module levels. DRY principle as well.
    - code review. PR process.
    - documentation. maintain proper documentation clearly.
    - import. import existing resources into terraform.
  - Ques: Is it safe to store terraform state in a private git repo? Why or why not?
    Ans: We should not store state in git repo for security and collaboration reasons. State should be available in a central location with lock mechanism. S3 with dynamo DB is one of the option.
    
  - Ques: You have 2 folders of terraform code. Folder A and Folder B. Folder B needs to use output (state) from folder A to create resources. How can you accomplish this?
    Ans: use SSM parameter store.
  - Ques: What does "terraform refresh do"?
    Ans: It compares the state file with actual infra in cloud.
  - Ques: Using Terraform , you have deployed 6 resources in AWS. However, a developer deleted one of them via AWS Console. Turns out that , that resource was not needed any way. How can you make your terraform code and terraform state sync up now?
    Ans:
    - comment the resource section
    - remove from state using terraform state rm command
  - Ques: Generally speaking, using --auto-approve is a bad idea. Can you imagine a situation where it may be ok ?
    Ans: 
    - It is OK in DEV environment.
  - Ques: How to handle terraform in production safely?
    Ans:
    - code review
    - terraform plan review. take output of the plan and apply that.
    - automated testing. terra test, kitchen framework.
    - security scanning. tfsec
    - cost estimation. 
    - Change management process.
  - Ques: Is there a tool that can look for security vulnerabilities in your terraform code?
    Ans: tfsec
  - Ques: How do you upgrade the version or providers and plugins and modules?
    Ans: terraform init -upgrade
  - Ques: You are building ec2 machines via terraform. However, you also have to install software and configurations on these ec2 machines. How can you do this using Terraform?
    Ans: user data, provisioners with ansible or shell.
  - Ques: If a null resource takes no action, what could possibly be a use case for it?
    Ans: It has trigger option any change in other resources can trigger this. for example AMI creation in every release.
  - Ques: Have you ever used data sources to retrieve sensitive information  from any external system?
    Ans: Yes we used to retrieve passwords from SSM parameter store and vault.
  - Ques: What is the remote backend in terraform ?
    Ans: store the state of terraform. S3 with dynamo DB
  - Ques: What is the difference between Anisible & Terraform ?
    Ans: Terrafomr is IaaC. Ansible configuration management, it can be used to create cloud resources, but we can't manage because state is not available. You can use terraform with Ansible to get best results, create EC2 with terrform use ansible to configure that EC2.
  - Ques: explain provisioners in terraform.
    Ans:
    - local-exec. this will run where terraform command runs.
    - remote-exec. this will run inside EC2. connection needs to be established.
  - Ques: variables vs locals
    Ans: variables holds the values we can override them using command line tfvars. but locals we can store functions and expressions and get the values at run time. local values can't be override.
## Join Devops

* What is state and remote state, how did you configure?
* Terraform data vs resource?
* How do you mange credentials in terraform?
* Explain terraform workspace?
* What are modules?
* What are providers in terraform?
* What is the advantage of null resource?
* If I lose the state files in terraform how can I recover that
* What is the difference between Anisible & Terraform?
* Is there a tool that can look for security vulnerabilities in your terraform code?
* Explain provisioners in terraform.
* Variables vs locals
* Does Terraform support multi-provider deployments?
* Write the terraform configuration for creating a single EC2 instance on AWS 
* How does Terraform manage updates to existing resources?
* How can you manage versioning of Terraform configurations?
* What are the commands of terraform apart from init, apply, plan


100 Terraform Basic To Advanced Interview Questions & Answers

ProDevOpsGuy's photo
ProDevOpsGuy
·
Jun 3, 2024
·
14 min read

Lets get started:
Terraform Basics
1. What is Terraform? 🛠️
Terraform is an open-source infrastructure as code software tool created by HashiCorp. It allows users to define and provision infrastructure using a high-level configuration language known as HashiCorp Configuration Language (HCL).

2. Difference Between Terraform and Other Configuration Management Tools 🆚
Terraform is focused on infrastructure provisioning and management, while tools like Ansible or Chef are primarily configuration management tools for servers and applications.

3. What is Infrastructure as Code (IaC)? 📜
Infrastructure as Code is the practice of managing infrastructure using code and automation. With IaC, infrastructure configurations are defined in code, version-controlled, and can be automatically provisioned and managed.

4. Purpose of State Files in Terraform 🗃️
State files in Terraform store information about the infrastructure managed by Terraform. They track resource metadata, dependencies, and other details required for Terraform to manage the infrastructure effectively.

5. Initializing a Terraform Configuration 🚀
You initialize a Terraform configuration by running the terraform init command in the directory containing your Terraform configuration files.

Terraform Commands
6. Command to Initialize a Terraform Configuration 🏁

COPY
terraform init
7. Creating an Execution Plan in Terraform 📋
You create an execution plan by running the terraform plan command. This command generates an execution plan showing what Terraform will do when you apply the configuration.

8. Command to Apply Terraform Configuration Changes 🔧

COPY
terraform apply
9. Destroying Terraform-Managed Infrastructure 💣
You can destroy Terraform-managed infrastructure using the terraform destroy command.

10. Validating Terraform Configuration Files ✅

COPY
terraform validate
Terraform Configuration
11. What is a Provider in Terraform? 🌐
A provider is a plugin that Terraform uses to interact with a specific cloud or infrastructure service. Examples include AWS, Azure, Google Cloud, etc.

12. Defining a Provider in Terraform Configuration 📦
You define a provider using the provider block in your Terraform configuration file. For example:


COPY
provider "aws" {
  region = "us-west-2"
}
13. What is a Resource in Terraform? 🌲
A resource in Terraform represents a piece of infrastructure, such as an AWS EC2 instance, Google Cloud Storage bucket, or Azure Virtual Network.

14. Defining a Resource in Terraform Configuration 📐
You define a resource using the resource block in your Terraform configuration file. For example:


COPY
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
15. What is a Module in Terraform? 📦
A module in Terraform is a collection of Terraform configuration files grouped together to encapsulate reusable infrastructure components.

Terraform State
16. Default Storage Location for Terraform State 🏠
Terraform stores its state locally by default, in a file named terraform.tfstate in the working directory.

17. Drawbacks of Storing Terraform State Locally ⚠️
Storing Terraform state locally can lead to issues with collaboration and concurrency, as multiple users working on the same configuration can overwrite each other's changes.

18. Storing Terraform State Remotely 🌍
Terraform supports storing state remotely using backend configurations. Popular options include Amazon S3, Azure Blob Storage, Google Cloud Storage, and HashiCorp Consul.

19. Purpose of Locking in Terraform State 🔒
Locking in Terraform state prevents concurrent operations from multiple users, ensuring that changes are applied sequentially and preventing conflicts.

20. Enabling State Locking in Terraform 🗝️
You enable state locking by configuring a locking mechanism in your Terraform backend configuration. For example, with S3 backend, you can enable locking by setting the dynamodb_table parameter.

Terraform Variables and Outputs
21. What are Terraform Variables? 🧮
Terraform variables allow you to parameterize your configurations, making them more flexible and reusable.

22. Defining Variables in Terraform Configuration ✏️
You define variables using the variable block in your Terraform configuration file. For example:


COPY
variable "instance_type" {
  description = "The type of EC2 instance to create"
  default     = "t2.micro"
}
23. Assigning Values to Variables in Terraform 🔢
You can assign values to variables using various methods, such as passing them as command-line arguments, using environment variables, or defining them in a separate variable file.

24. What are Terraform Outputs? 🖥️
Terraform outputs allow you to extract information from your Terraform configuration, such as resource attributes or computed values, and display them after applying the configuration.

25. Defining Outputs in Terraform Configuration 📝
You define outputs using the output block in your Terraform configuration file. For example:


COPY
output "instance_ip" {
  value = aws_instance.example.public_ip
}
Terraform Modules
26. What is a Terraform Module? 📦
A Terraform module is a reusable collection of Terraform configuration files that represent a set of related infrastructure resources.

27. Purpose of Using Terraform Modules 🛠️
Terraform modules promote code reuse, modularity, and maintainability by encapsulating infrastructure components into reusable units.

28. Calling a Module from Another Terraform Configuration 📞
You call a module using the module block in your Terraform configuration file, providing values for any input variables defined by the module.

29. Input Variables in Terraform Modules 🔄
Input variables in Terraform modules allow you to customize the behavior of the module by passing values from the calling configuration.

30. Defining Input Variables for Terraform Modules 📋
You define input variables for modules using the variable block within the module's configuration files.

Terraform Networking
31. Creating a Virtual Network in Terraform 🌐
You can create a virtual network using the appropriate resource block for the cloud provider you are using, such as aws_vpc for AWS or google_compute_network for Google Cloud.

32. What is a Subnet in Terraform? 🌍
A subnet in Terraform represents a range of IP addresses within a virtual network. Subnets are used to divide a network into smaller, more manageable segments.

33. Creating a Subnet in Terraform 📏
You create a subnet using the appropriate resource block for the cloud provider you are using, such as aws_subnet for AWS or google_compute_subnetwork for Google Cloud.

34. What is a Security Group in Terraform? 🛡️
A security group in Terraform is a set of firewall rules that control inbound and outbound traffic for instances within a virtual network.

35. Defining a Security Group in Terraform 🛡️
You define a security group using the appropriate resource block for the cloud provider you are using, such as aws_security_group for AWS or google_compute_firewall for Google Cloud.

Terraform Best Practices
36. Best Practices for Organizing Terraform Configurations 📁
Best practices include modularizing configurations with Terraform modules, using version control for configuration files, and separating environments using workspaces or separate directories.

37. Managing Secrets and Sensitive Information in Terraform 🔒
Secrets and sensitive information can be managed using Terraform's built-in mechanisms such as input variables marked as sensitive or by integrating with external secret management solutions like HashiCorp Vault or AWS Secrets Manager.

38. What is a Terraform Workspace? 🗂️
A Terraform workspace is a separate environment for running Terraform commands, allowing you to manage multiple environments (e.g., development, staging, production) with separate state files and configurations.

39. Creating and Switching Between Terraform Workspaces 🔄
You create a new workspace using the terraform workspace new command and switch between workspaces using the terraform workspace select command.

40. Common Pitfalls to Avoid When Using Terraform ⚠️
Common pitfalls include not properly managing state files, failing to use appropriate locking mechanisms, and not testing changes thoroughly before applying them in production environments.

Advanced Terraform Concepts
41. What is Terraform Interpolation? 🔗
Terraform interpolation allows you to insert dynamic values into your configuration files, such as referencing attributes of other resources or using built-in functions.

42. Using Interpolation in Terraform 🔀
Interpolation is performed by enclosing the expression within ${} or using the newer ${var.} syntax for variables.

43. What is Terraform's Plan Output? 📋
Terraform's plan output provides a detailed summary of the changes Terraform will make to your infrastructure when you apply the configuration.

44. Customizing Terraform's Plan Output ✨
You can customize Terraform's plan output using the -out flag to save the plan to a file or using the -compact-warnings flag to condense warning messages.

45. What is Terraform's Graph Command Used For? 🗺️
The terraform graph command generates a visual representation of the dependency graph for your Terraform configuration, showing the relationships between resources.

Miscellaneous
46. Common Error Messages in Terraform ⚠️
Common error messages include resource conflicts, syntax errors in configuration files, and issues with state file locking.

47. Troubleshooting Terraform Configuration Errors 🛠️
Troubleshooting Terraform configuration errors involves carefully reviewing

error messages, checking syntax and formatting, and examining state files for inconsistencies.

48. What is Terraform's Remote Backend? 🌍
Terraform's remote backend allows you to store state files remotely, enabling collaboration and concurrency among multiple users.

49. Configuring a Remote Backend in Terraform 🌐
You configure a remote backend by specifying the backend configuration block in your Terraform configuration files, including details such as the backend type (e.g., S3, Azure Blob Storage) and access credentials.

50. Difference Between terraform apply and terraform refresh 🔄
terraform apply applies changes to your infrastructure as defined in the Terraform configuration, while terraform refresh updates the state file to reflect the current state of the infrastructure without making any changes.

Advanced Infrastructure as Code (IaC) Concepts
1. What is Infrastructure as Code (IaC)? 📜
Answer: IaC is the practice of managing and provisioning infrastructure through machine-readable definition files rather than physical hardware configuration or interactive configuration tools.

2. Benefits of Using Terraform for IaC 🌟
Answer: Terraform provides benefits such as infrastructure versioning, automated provisioning, consistency across environments, and the ability to manage complex infrastructure setups.

3. Key Components of Terraform 🧩
Answer: Key components include the Terraform CLI, Terraform configuration files (.tf files), providers, resources, data sources, and modules.

Terraform Commands
4. Initializing a Terraform Configuration 🚀
Answer: Use the terraform init command.

5. Creating an Execution Plan 📋
Answer: Use the terraform plan command.

6. Applying Changes to Infrastructure 🔧
Answer: Use the terraform apply command.

7. Destroying Resources Provisioned by Terraform 💣
Answer: Use the terraform destroy command.

Terraform Configuration
8. What is a Terraform Provider? 🌐
Answer: A provider is responsible for managing the lifecycle of a resource. It authenticates with the cloud provider and exposes resources for use in Terraform configurations.

9. Purpose of Terraform Variables 🧮
Answer: Variables allow you to parameterize your configurations, making them more flexible and reusable across environments.

10. Defining Variables in Terraform ✏️
Answer: Variables can be defined using the variable block in a .tf file or by passing them via command-line flags or environment variables.

Terraform State Management
11. What is Terraform State? 🗃️
Answer: Terraform state is a representation of your infrastructure as managed by Terraform. It keeps track of resources and their dependencies.

12. Storing Terraform State 🏠
Answer: Terraform state can be stored locally in a file (terraform.tfstate) or remotely using backend services like AWS S3, Azure Storage, or HashiCorp Consul.

13. Handling Lost or Corrupted Terraform State ⚠️
Answer: Loss or corruption of Terraform state can lead to inconsistencies between the desired infrastructure state and the actual state. It's crucial to back up and protect Terraform state.

Terraform Modules
14. What are Terraform Modules? 📦
Answer: Modules are self-contained packages of Terraform configurations that are managed as a group. They allow you to encapsulate and reuse infrastructure components.

15. Using Terraform Modules 📞
Answer: Modules are used by referencing them in your Terraform configurations using the module block and providing input variables.

16. Advantages of Using Terraform Modules 🌟
Answer: Advantages include code reuse, abstraction of complexity, easier maintenance, and improved collaboration.

Advanced Terraform Concepts
17. Terraform Apply vs. Terraform Plan 🔄
Answer: terraform plan generates an execution plan without making any changes, while terraform apply executes the plan and makes the necessary changes to reach the desired state.

18. Purpose of Terraform's Count Parameter 🔢
Answer: The count parameter allows you to create multiple instances of a resource based on a numerical value or condition.

19. Handling Sensitive Data in Terraform 🔒
Answer: Sensitive data can be managed using sensitive input variables (sensitive = true) or stored securely in external systems and referenced in Terraform configurations.

20. Concept of Terraform Workspaces 🗂️
Answer: Workspaces allow you to manage multiple environments (such as development, staging, and production) within the same Terraform configuration, maintaining separate state files for each environment.

Terraform Best Practices
21. Organizing Terraform Configurations 📁
Answer: Best practices include using modules for reusable components, leveraging variables and locals for configuration flexibility, and separating environments using workspaces or directories.

22. Managing Dependencies Between Terraform Resources 🔗
Answer: Terraform automatically manages dependencies based on resource references. You can also use depends_on to explicitly define dependencies between resources.

23. Precautions in Team Environments 🛡️
Answer: It's important to establish version control practices, use locking mechanisms to prevent concurrent state modifications, and implement access controls to restrict permissions.

Terraform Networking
24. Managing Network Resources with Terraform 🌐
Answer: Use Terraform's network provider (e.g., AWS, Azure, GCP) to define network resources in your configuration files.

25. Using Terraform's cidrsubnet Function 🌍
Answer: cidrsubnet is used to calculate subnets within a given CIDR block, allowing you to dynamically generate subnet configurations based on a specified prefix length.

Terraform and Cloud Providers
26. Supported Cloud Providers 🌥️
Answer: Terraform supports major cloud providers such as AWS, Azure, Google Cloud Platform, as well as providers for various other services and platforms.

27. Authenticating Terraform with Cloud Providers 🔑
Answer: Terraform providers authenticate using credentials (e.g., API keys, access tokens) provided through environment variables, configuration files, or external identity providers.

28. Terraform Remote Backend 🌐
Answer: The remote backend allows Terraform state to be stored remotely, enabling collaboration and state locking across multiple users and environments.

Terraform Security
29. Implementing Security Best Practices 🔒
Answer: Best practices include using secure credentials management, implementing least privilege access controls, encrypting sensitive data, and regularly auditing configurations for vulnerabilities.

30. Using the terraform fmt Command 🖊️
Answer: terraform fmt is used to format Terraform configuration files according to a consistent style, improving readability and maintainability.

Troubleshooting Terraform
31. Troubleshooting Errors in Terraform Configurations 🛠️
Answer: Troubleshooting involves examining Terraform logs (terraform.log), analyzing error messages, checking for syntax errors, and validating resource dependencies.

32. Preventing Accidental Destruction of Infrastructure 🚫
Answer: Implementing safeguards such as enabling terraform apply confirmation prompts, using terraform plan to review changes before applying, and enabling state file backups can help prevent accidental destruction.

Terraform Integration
33. Integrating Terraform with CI/CD Pipelines 🚀
Answer: Terraform can be integrated into CI/CD pipelines using tools like Jenkins, GitLab CI/CD, or AWS CodePipeline to automate infrastructure provisioning and deployment.

34. Terraform's local-exec Provisioner 🖥️
Answer: The local-exec provisioner allows you to execute commands locally on the machine running Terraform, enabling tasks such as local script execution or resource configuration.

Advanced Terraform Techniques
35. Managing Terraform State Across Multiple Teams or Projects 🏢
Answer: Use Terraform's remote state backend with access controls and state locking mechanisms to manage state across teams or projects securely.

36. Purpose of the terraform console Command 🖥️
Answer: terraform console opens an interactive console where you can evaluate Terraform expressions, test configurations, and troubleshoot issues.

Terraform Enterprise
37. What is Terraform Enterprise? 💼
Answer: Terraform Enterprise is a commercial offering by HashiCorp that provides additional features such as collaboration, governance, and automation capabilities beyond the open-source version.

38. Managing Workspaces and Permissions in Terraform Enterprise 🔧
Answer: Terraform Enterprise allows you to manage workspaces and permissions through its web interface, providing granular control over who can access and modify infrastructure configurations.

Terraform Cloud
39. What is Terraform Cloud? ☁️
Answer: Terraform Cloud is a SaaS platform for collaborating on Terraform configurations, providing features such as remote execution, state management, and version control integration.

40. Triggering Terraform Runs in Terraform Cloud 🔄
Answer: Terraform runs in Terraform Cloud can be triggered manually, automatically on VCS (Version Control System) changes, or via API calls.

Terraform Automation
41. Automating Terraform Tasks 🛠️
Answer: Terraform tasks can be automated using scripting languages (e.g., Bash, Python) or automation tools (e.g., Ansible, Puppet) to orchestrate Terraform commands and workflows.

42. Terraform's remote-exec Provisioner 🌐
Answer: The remote-exec provisioner allows you to execute commands on remote instances after provisioning, enabling tasks such as software installation or configuration management.

Terraform Migration
43. Migrating Existing Infrastructure to Terraform 🔄
Answer: Existing infrastructure can be migrated to Terraform by reverse-engineering configurations, defining them in Terraform format, and gradually transitioning resources using terraform import and terraform apply.

44. Challenges When Migrating to Terraform ⚠️
Answer: Challenges include ensuring compatibility between existing infrastructure and Terraform configurations, handling state migration, and managing dependencies between resources.

Terraform Scaling
45. Scaling Infrastructure Resources with Terraform 📈
Answer: Terraform can scale infrastructure resources dynamically using features such as count, for_each, and conditional expressions to manage resource instances based on demand or configuration parameters.

46. Optimizing Terraform Performance for Large-Scale Deployments 🚀
Answer: Strategies include parallelism tuning, modularization of configurations, state management optimizations, and leveraging caching mechanisms to improve performance.

Terraform Observability
47. Monitoring and Tracking Infrastructure Changes 📊
Answer: Monitoring solutions and change tracking

mechanisms (e.g., AWS CloudTrail, Azure Activity Logs) can be used to audit and track changes made by Terraform, providing visibility into infrastructure modifications.

48. Logging Options in Terraform 📝
Answer: Terraform generates logs that can be configured to various output destinations (e.g., stdout, files) and levels of verbosity to aid in troubleshooting and auditing.

Terraform Upgrades and Maintenance
49. Handling Upgrades and Maintenance of Terraform Versions 🔄
Answer: Upgrades can be managed using package managers (e.g., Homebrew, Chocolatey) or by downloading and installing the latest Terraform binary manually. It's essential to test upgrades in a non-production environment before applying them in production.

50. Considerations for Terraform Version Upgrades 📝
Answer: Considerations include compatibility with existing configurations, changes in behavior or syntax, availability of new features, and potential impacts on existing infrastructure.
