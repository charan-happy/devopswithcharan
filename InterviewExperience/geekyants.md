--> Got call from naukri

Budget: 7-8 LPA  WFO 
Total 3 rounds
1. HR screening (Techical + Non-Technical ) --> 4/june/2025 5-5.30 PM
2. DevOps Lead Interview (Pure Technical Hands-on) --> 18/6/2025 12-2 PM
3. Interview With CEO

Round 2 : DevOps Lead
1. Tell me about yourself ?
<details><summary>2. Tell me about linux filesystem ?</summary>/: Root

/home: User data

/var: Logs, mail

/etc: Config files

/bin: Essential binaries

/opt: Optional software

/tmp: Temp files</details>
<details><summary>3. How SSH Authentication works ?</summary>2 types:

SH (Secure Shell) is a secure protocol used to remotely log into systems and perform administrative tasks. It's critical for DevOps engineers who manage cloud infrastructure, CI/CD systems, and automation scripts.

There are two primary authentication mechanisms in SSH:

✅ 1. Password-based Authentication
How it works:

You run: ssh user@server

The server prompts: Password:

You manually enter the password.

If it matches the user credentials on the server, access is granted.

Risks:

Prone to brute-force attacks

If password is weak or reused, it's a major security risk

Not scalable for automated tasks (e.g., Ansible, CI/CD)

Usage:

Mostly used in non-production or legacy systems

Can be disabled on secure setups

✅ 2. Key-based Authentication (Highly Preferred in DevOps)
🔧 How it works:
You generate a key pair on your local machine:

bash
Copy
Edit
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
This creates:

~/.ssh/id_rsa (Private Key)

~/.ssh/id_rsa.pub (Public Key)

You copy the public key to the remote server:

bash
Copy
Edit
ssh-copy-id user@server
Or manually add it to:

swift
Copy
Edit
/home/user/.ssh/authorized_keys
When you try to SSH:

bash
Copy
Edit
ssh user@server
The server checks if your private key matches a public key in authorized_keys.

If matched → Encrypted challenge is solved locally using the private key.

Server grants access without asking for a password.

🔐 Why is key-based authentication more secure?
Private keys are never transmitted over the network.

Can be protected with a passphrase.

Keys are long and random (almost impossible to brute-force).

Supports automation (used by Ansible, Jenkins, GitHub Actions, etc.)

📌 Real-World Use Cases:
Use Case	Authentication Type	Why?
Cloud VM access (e.g., AWS EC2)	Key-based	AWS disables password login by default
Ansible deployments	Key-based	Required for non-interactive access
Jump server access	Key-based (often with MFA)	Hardened environments
CI/CD pipelines (SSH deploys)	Key-based	Required for automation
Bastion hosts	Key-based + IP whitelisting	Extra layer of control

🔐 Optional Enhancements (Real-World):
SSH Agent Forwarding: For jumping across multiple servers without copying keys.

Key with Passphrase: Add extra protection if key is compromised.

Using ssh-agent: Store decrypted keys temporarily so you don’t re-enter passphrase.

🚫 Disable Password-based SSH (Best Practice):
Edit /etc/ssh/sshd_config on the remote server:

ini
Copy
Edit
PasswordAuthentication no
PermitRootLogin no
Then restart SSH:

bash
Copy
Edit
sudo systemctl restart sshd
🧠 Pro Tip (from experience):
Use ~/.ssh/config to simplify multiple remote connections:

ini
Copy
Edit
Host dev-server
  HostName 192.168.1.100
  User ubuntu
  IdentityFile ~/.ssh/dev.pem
Then you can just do:

bash
Copy
Edit
ssh dev-server
</details>
<details><summary>4. Explain about TOP in linux ?</summary>Real-time CPU, memory, and process usage monitor.
Shows:

PID, %CPU, %MEM, command name

Load average

Uptime</details>
<details><summary>5. How will you check cpu & Ram info in a server ?</summary># CPU
lscpu
cat /proc/cpuinfo

# RAM
free -h
vmstat
</details>
<details><summary>6. Do you know about selinux ?</summary>Security-Enhanced Linux — a kernel security module.
Defines access controls beyond user/group permissions (MAC-based).

Modes:

Enforcing

Permissive

Disabled</details>
<details><summary>7. How will you secure your linux server ?</summary>Use SSH keys, disable password login

Regular patching

Limit sudo access

UFW or iptables firewall

Fail2Ban for brute-force protection

Disable root login

Use SELinux/AppArmor</details>
<details><summary>8. How can i connect one linux server with another without sharing public key ?</summary>If SSH keys are not shared:

Use sshpass for password auth (not recommended)

Or manually enter password on connection

bash
Copy
Edit
ssh user@server</details>
<details><summary>9. Explain about chmod , chown ?</summary>chmod: Change permissions
chmod 755 file

chown: Change ownership
chown user:group file</details>
<details><summary>10. Explain about filepermissions ?</summary>Format: -rwxr-xr--

1st: type (-, d, l)

Next 3: Owner (read/write/exec)

Next 3: Group

Last 3: Others</details>
<details><summary>11. Asked me to explain simmmilar services in azure by giving aws like ec2, autoscalling, vpc, route53,s3 etc</summary>AWS	Azure
EC2	Azure VM
Auto Scaling	VM Scale Sets
VPC	Virtual Network
Route 53	Azure DNS
S3	Azure Blob Storage</details>
<details><summary>12. How will you secure your ec2 instance ?</summary>Disable root login

Use security groups (least privilege)

Enable monitoring (CloudWatch, GuardDuty)

Use IAM roles, not hardcoded creds

Patch regularly</details>
<details><summary>13. spin up an ec2 instance</summary>resource "aws_instance" "example" {
  ami           = "ami-xxxx"
  instance_type = "t2.micro"
  tags = {
    Name = "DevInstance"
  }
}
</details>
<details><summary>14. Do you know differnce between forward proxy and reverse proxy</summary>Forward Proxy: Client → Proxy → Internet
(Used for caching, filtering)

Reverse Proxy: Client → Proxy → Backend
(Used for load balancing, SSL termination)</details>
<details><summary>15. Is nginx forward/reverse proxy ?</summary>NGINX is commonly used as a reverse proxy, but it can also act as a forward proxy with config.</details>
<details><summary>16. How will you check disk usage in linux ? what is -h in du -h ?</summary>df -h       # Disk usage of filesystems
du -sh *    # Disk usage per directory
</details>
<details><summary>17. Write a dockerfile for nodejs application and explain each of it ?</summary>FROM node:18
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["node", "app.js"]
</details>
<details><summary>18. Explain about terraform workflow and how will you approach and what are all required to create an ec2 instance ?</summary>Define provider (AWS)

Write resource block (aws_instance)

terraform init

terraform plan

terraform apply</details>
<details><summary>19. How dns works ?</summary>You type URL → Browser queries DNS resolver

Resolver → Root server → TLD → Authoritative DNS

IP returned → Browser connects to server</details>
<details><summary>20. How are you using ansible </summary>Provision VMs

Install packages

Deploy apps

Used roles, handlers, templates (Jinja2)

Integrated with Terraform and Jenkins</details>
<details><summary>21. Difference between RUN and CMD ?</summary>RUN: Executes during image build (e.g., install packages)

CMD: Executes when container starts</details>
<details><summary>22. Do you know how to run nodejs application ?</summary>npm install
node app.js</details>
<details><summary>23. Do you know docker swarm ?</summary>Yes. Docker's native clustering/orchestration.
Used docker swarm init, docker service create.
But nowadays we prefer Kubernetes for scalability and flexibility.</details>
<details><summary>24. What is docker compose ?</summary>Tool to define and run multi-container apps using docker-compose.yml.</details>
<details><summary>25. Write a docker compose for a 3 tier application of services frontend , backend and database ? Frontend depends on backend , backend depends on database</summary>version: '3'
services:
  db:
    image: mysql
    environment:
      MYSQL_ROOT_PASSWORD: root
    volumes:
      - db_data:/var/lib/mysql

  backend:
    build: ./backend
    depends_on:
      - db
    environment:
      DB_HOST: db

  frontend:
    build: ./frontend
    depends_on:
      - backend
    ports:
      - "3000:3000"

volumes:
  db_data:
</details>
<details><summary>26. Some followup questions while writing docker compose file</summary>Used EKS (AWS) and AKS (Azure)

For local: Minikube, Kind

Used Terraform modules to create K8s clusters with autoscaling node groups

</details>
<details><summary>27. How you are spinning up your kubernetes clusters ?</summary>Pod

Deployment

StatefulSet

DaemonSet

Service

Ingress

ConfigMap

Secret

PVC

HPA

CronJob</details>
<details><summary>28. Explain some of the objects /anything you are getting in your mind right now ?</summary>Public: Has route to Internet Gateway

Private: No direct internet access</details>
<details><summary>29. Difference between public subnet and private subnet ?</summary>Allows private subnet resources to access the internet outbound only.

Used for:

OS updates

Downloading packages</details>
<details><summary>30. what is natgateway and why is it used and how is it used ? is it inbound /outbound ?</summary>outbound</details>
<details><summary>31. Explain Complete CICD workflow ?</summary>Dev pushes code

CI triggers:

Lint, test, scan, build

Docker image → Registry

CD triggers:

Pull image

Deploy to Kubernetes

Run smoke tests

Notify on Slack</details>
<details><summary>32. Difference between Daemonsets and statefulsets ?</summary>Feature	DaemonSet	StatefulSet
Purpose	1 pod per node	Stateful pods (ordered)
Use Case	Logging, monitoring	Databases, Kafka, Zookeeper</details>
<details><summary>33. what are different types of services in kubernetes ?</summary>ClusterIP (default, internal)

NodePort (external via node IP:port)

LoadBalancer (cloud-managed LB)

ExternalName (DNS alias)</details>
<details><summary>34. How dns works in kubernetes ?</summary>CoreDNS runs as a pod

Each service gets a DNS name

Example: service.namespace.svc.cluster.local</details>
<details><summary>35. why prometheus and grafana, how are you using them ?</summary>Prometheus: Metrics collection & alerting

Grafana: Visualization dashboards</details>
<details><summary>36. What metrics you are collecting with it and what are you monitoring with them ?</summary>Pod CPU/memory

Node utilization

API response time

Error rates (4xx/5xx)

Disk I/O

Network traffic

Deployment frequency</details>
<details><summary>37. what is ingress in kubernetes , what ingress you are using in your current project ?</summary></details>

 These are some of the questions i remembered and he asked somemore .

 Verdict : Selected✅  Offered package : 8.5 LPA (7.5 fixed + 1 Variable) Joining date : 7/7/2025 

 Not going to join because of notice period conflict...😓

 
   
