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