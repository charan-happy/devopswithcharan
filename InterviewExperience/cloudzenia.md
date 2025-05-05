--> Got interview invitation by cloudzenie from linkedin 
--> First had a introductionary call for 10 minutes
--> Got interview hands-on assignment (Refer cloudzenie-challenge)
--> Had a technical interview for 40 minutes

1. what do you do exactly at the current role ? architecting part ? and rate yourself with devops tools
2. what is your current CTC and expected CTC ?
3. Did you get a chance to setup self-hosted runners in github actions ?
4. what command is used to see current path ?
5. How to list all folder and files ?
6. what is rt in ls -lrt ?
7. explain anyone line in the output of ls -lrt ?
8. how to find where domain is hosted ? where domain name servers are hosted for a particular website in linux server ?
```
the dig or nslookup command-line tools. These tools query the DNS records. For example, dig example.com will show the nameservers associated with "example.com". You can also specify the record type, such as dig ns example.com to specifically look for NS records, which list the nameservers. The output will display the DNS servers responsible for resolving the domain.
dig example.com +short
dig ns example.com
whois example.com

- `dig` shows A records and NS records
- `whois` can reveal registrar, nameservers, and hosting info
```
10. where is your kubernetes hosted ?
11. is nodes are autoscaled or what ? if i need to add hosts how we have to do everytime ?
13. How do you scale nodes in kubernetes in onprem vmware environment ?
```
- In cloud (EKS), I’ve used Cluster Autoscaler and Karpenter
- In on-prem (VMware):
  1. Create a new VM using base image or automation (e.g., Packer + Terraform)
  2. Install kubeadm, kubelet, kubectl
  3. Join using kubeadm token:
     ```bash
     kubeadm join <MASTER_IP>:6443 --token <TOKEN> --discovery-token-ca-cert-hash sha256:<HASH>
     ```
  4. Labels and taints are applied post-join

```
14. what is the difference between statefulset and deployment ?
```
| Feature         | Deployment                     | StatefulSet                          |
|----------------|----------------------------------|--------------------------------------|
| Identity       | No stable identity              | Each pod has a persistent identity   |
| Use Case       | Stateless apps (Node.js, Nginx) | Databases (MongoDB, PostgreSQL)      |
| Volume         | Shared or none                  | PersistentVolumeClaim per pod       |
| Pod Name       | Random                          | Predictable (e.g., app-0, app-1)     |

```
15. how replicaset is different from statefulset ?
```
- ReplicaSet ensures a fixed number of **identical** pods.
- StatefulSet manages **unique** pods with **stable identity** and storage.

```
16. Does stateful use replicaset in any way ?
```
No. StatefulSet uses its own controller logic, not based on ReplicaSet.
- It supports ordered creation/deletion and persistent identity
```
17. if we have two namespaces 1. application namespace (nodejs) and 2. database namespace(postgresql).  what should i do make both them to communicate ?
```
# From nodejs namespace, access via FQDN:
postgres-service.database-namespace.svc.cluster.local

- Ensure:
  - NetworkPolicies allow cross-namespace traffic (if enforced)
  - DNS works inside the cluster
  - Correct service name and port are used in Node.js env config
```
18. Inside a linux server i have a docker container with nginx running on it. right now i am not able to access it via localhost what should be reasons for it and how should i make it work ?
```
Check container is running: docker ps

Is NGINX listening on correct port? (docker exec <id> netstat -tuln)

Port mapping missing? (Use -p 80:80)

Try curl localhost:<host_port>

docker run -d -p 80:80 nginx

Possible Reasons:
- Container is not using `--network=host`
- NGINX is binding to container `localhost` instead of `0.0.0.0`
- Port not mapped properly: `docker run -p 80:80 nginx`
- Firewall or SELinux restrictions
```
19. what services and what is your prior experience on aws ?
20. How much experience you have with terraform ?
21. How much of code in terraform you have get from ai/forums/documentation ?
22. provide an example for dynamic block of code in terraform ?
```
variable "ports" {
  default = [80, 443]
}

resource "aws_security_group" "web_sg" {
  name = "web"

  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

```
23. I have to create 3 ec2 instances and i want them to have different names for each one of them and these names comes from variable in terraform ?
```
variable "names" {
  default = ["web-1", "web-2", "web-3"]
}

resource "aws_instance" "ec2" {
  count         = length(var.names)
  ami           = "ami-xyz"
  instance_type = "t2.micro"
  tags = {
    Name = var.names[count.index]
  }
}

```
24. How familiar with bash/python scripting ?
25. write a bash script that will show me date time in terminal and it has to keep updating every second ? like a digital clock in console. Cron is background process
```
#!/bin/bash
while true; do
  clear
  date '+%Y-%m-%d %H:%M:%S'
  sleep 1
done
```

26. I have an ec2 instance and i lost pem key for it. I don't have access to SSM,kMS services of aws. i have only access via ssh and after that i lost in both remote and local system . How should we get access to it ?
```
If EC2 is still running and SSH session is lost:

Detach root volume from current EC2.

Attach to another instance with a valid key.

Mount it and update ~/.ssh/authorized_keys with a new public key.

Re-attach volume to original EC2 and boot.

Why this is safe:
You’re not modifying the AMI or deleting the instance. It’s a known recovery method without SSM

As a DevOps engineer:
- Use a backup AMI:
  - Stop instance
  - Detach root volume
  - Attach to another EC2 as secondary volume
  - Mount and modify ~/.ssh/authorized_keys
  - Add a new public key
  - Detach and reattach to original instance
```


