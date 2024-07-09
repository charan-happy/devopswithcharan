what is VPC and its components (public, private, NACL, Route Tables, Internet Gateway)

what is difference between NACL and Security Groups

what are different types of load balancers and tell difference between network and application load balancer ?

what is route 53, types of routing policy and routing used

What is ASG adn launch config

how to restore the login into ec2 if pem file is lost

How to encrypt the unencrypted AMI ?

what is EBS and EFS

what is vpc peering and vpc endpoint

what is S3/types of S3 bucket ? S3 bucket policy/S3 lifecycle

what is IAM roles and how the cross region roles work

how to tell one Ec2 to talk to another Ec2 in other region

what is mysql aurora/backup plan done/Master and reader end points/failover mechanism

what is ETF template/how a resource depends on other resource

what are important components of CFT

which is faster storage EBS or S3

<details><summary>Can you describe your experience with AWS services such as EC2, EKS, S3, VPC, Route53, and Lambda? </summary>"I have over three years of experience working with various AWS services. For EC2, I have managed instances, configured AMIs, and optimized performance. With EKS, I have deployed and managed Kubernetes clusters, ensuring high availability and scalability. I have utilized S3 for storage solutions, managing buckets and configuring lifecycle policies. For VPC, I have designed and implemented custom networks, setting up subnets, route tables, and security groups. Using Route53, I have managed DNS configurations and traffic policies. I have created Lambda functions to automate tasks and integrate with other AWS services seamlessly."</details>
<details><summary>Explain all components of IAM in AWS. </summary>Users: Individual IAM entities representing a person or service.
Groups: Collections of IAM users managed as a unit.
Roles: IAM entities that define a set of permissions for making AWS service requests.
Policies: JSON documents that define permissions for users, groups, and roles.
MFA (Multi-Factor Authentication): Adds an extra layer of security.</details>
<details><summary>What is SG and difference between SG and NACL? </summary> SG (Security Group): Acts as a virtual firewall for instances to control inbound and outbound traffic at the instance level. Stateful: return traffic is automatically allowed.
NACL (Network ACL): Provides an additional layer of security at the subnet level. Stateless: return traffic must be explicitly allowed by rules.</details>
<details><summary>If a server is in a private subnet, how to connect to the internet? </summary> Use a NAT Gateway or NAT Instance. The NAT device allows instances in a private subnet to initiate outbound traffic to the internet while preventing the internet from initiating connections with those instances.</details>
<details><summary>Which version of Grafana is used. Explain the source and how you configured. </summary>Provide specific details about the version used, for example, "We use Grafana v7.5.4. Grafana is sourced from the official Grafana repository and is configured using Helm for Kubernetes deployment. Custom dashboards are created to monitor specific application metrics, and Prometheus is used as the data source."</details>
<details><summary>What are the different classes of instances that you have launched in EC2? </summary>I have launched various EC2 instance classes, including General Purpose (e.g., t2, t3, m5), Compute Optimized (e.g., c5, c6a), Memory Optimized (e.g., r5, r6g), Storage Optimized (e.g., i3, d2), and Accelerated Computing (e.g., p3, g4).</details>
<details><summary>If a size of an instance is large, like a C6A.large, how many V CPUs and how much RAM can you expect? </summary> A c6a.large instance has 2 vCPUs and 4 GB of RAM</details>
<details><summary>Walk me through the steps to configure and deploy an application on EC2 using an Auto Scaling Group. </summary> Launch Template: Create an EC2 Launch Template specifying the AMI, instance type, key pair, security groups, and user data for initialization.
Auto Scaling Group: Create an Auto Scaling Group with the launch template, specifying the desired capacity, minimum and maximum number of instances, and scaling policies.
Load Balancer: Configure an Elastic Load Balancer (ELB) to distribute traffic across instances in the Auto Scaling Group.
Scaling Policies: Define scaling policies based on CloudWatch metrics, such as CPU utilization or custom metrics.
Deploy Application: Ensure the application is part of the AMI or use user data scripts to install it on instance launch.
Testing: Test the setup by simulating load and verifying that scaling works as expected.</details>
<details><summary>Is there any control that you can define for scaling in the application?
 </summary>Yes, you can define scaling policies and cooldown periods to control how and when the Auto Scaling Group scales in. You can use policies based on CloudWatch alarms, target tracking policies, or step scaling policies.</details>
<details><summary>Have you worked with built-in functions in CloudFormation? </summary>Yes, I have used intrinsic functions like Fn::Join, Fn::Sub, Fn::GetAtt, and Ref to simplify and dynamically configure CloudFormation templates.</details>
<details><summary>Troubleshooting a failing application on EC2 instances connecting to RDS.
 </summary>Check EC2 Status: Verify instance health and system logs.
RDS Status: Ensure RDS instance is available and accessible.
Network Configurations: Check security groups, NACLs, and VPC settings.
Application Logs: Look for errors in application logs.
Database Connectivity: Test connectivity to RDS from the EC2 instance.
Scaling Events: Ensure scaling events haven’t caused issues.</details>
<details><summary>If networking and DNS are fine, what else to check in your infrastructure? </summary> Application Logs: Review for errors.
Database Logs: Check for issues in MySQL RDS logs.
Security Group Rules: Ensure correct inbound and outbound rules.
Instance Resources: Verify CPU, memory, and disk space.
Load Balancer: Check ELB health checks and listener configurations.</details>
<details><summary>System check failure on an EC2 instance. </summary> Instance Reboot: Attempt to reboot the instance.
Status Checks: Review detailed status checks.
Logs: Check system and application logs.
Terminate and Recreate: If issues persist, consider terminating and replacing the instance.</details>
<details><summary>Explain cloud migration tasks. </summary></details>
<details><summary>Differences between IaaS, PaaS, and SaaS. </summary> IaaS (Infrastructure as a Service): Provides virtualized computing resources over the internet (e.g., EC2).
PaaS (Platform as a Service): Provides a platform allowing customers to develop, run, and manage applications without dealing with underlying infrastructure (e.g., AWS Elastic Beanstalk).
SaaS (Software as a Service): Delivers software applications over the internet on a subscription basis (e.g., Gmail).</details>
<details><summary>Design highly available fault tolerant infrastructure on AWS </summary>Regions and Availability Zones: Distribute resources across multiple AZs.
Auto Scaling: Ensure scalability and redundancy.
Load Balancers: Distribute traffic to healthy instances.
RDS Multi-AZ: For database high availability.
S3: For highly durable object storage.
Route 53: For DNS failover and health checks</details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
