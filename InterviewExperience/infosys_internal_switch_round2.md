--> interview is for one of the banks in australia

<details><summary>1. Please let me know about yourself ?</summary>I'm a DevOps Engineer with 4 years of hands-on experience in building CI/CD pipelines, infrastructure automation, container orchestration, and cloud-native deployments. I’ve worked extensively with tools like Kubernetes, Docker, Helm, Terraform, Ansible, and GitHub Actions. My recent focus has been on building scalable infra using Rancher (RKE2), integrating security and observability into pipelines, and automating the release lifecycle for microservices-based apps. I specialize in reducing deployment times and ensuring high availability by building developer-centric infrastructure with best practices. </details>
<details><summary>2. How would you rate yourself on a scale of 5 ?</summary> Linux: 5/5

CI/CD (GitHub Actions, Jenkins): 5/5

Terraform & Infra-as-Code: 4.5/5

Cloud (AWS, Azure): 4/5

Kubernetes (Rancher, Helm): 4.5/5

Scripting (Python, Bash): 4/5

Monitoring (Prometheus/Grafana): 4.5/5

</details>
<details><summary>3. what are distroles images in docker ?</summary>Distroless images are minimal Docker base images that don’t contain a package manager, shell, or other OS tools—only the application and its runtime. They are more secure and lightweight.

Use Case: For a Go app, using gcr.io/distroless/static cuts attack surface and reduces image size drastically </details>
<details><summary>4. write a docker file for python application ?</summary>FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 8000
CMD ["python", "app.py"] </details>
<details><summary>5. why you used CMD instead of Entrypoint ?</summary>CMD is used when I want the flexibility to override the command during runtime, like debugging or changing behavior. </details>
<details><summary>6. How they both differ ?</summary>CMD is overridden when a command is passed via docker run

ENTRYPOINT always executes unless explicitly overridden

Use Case: ENTRYPOINT for consistent startup logic; CMD for config defaults.

 </details>
<details><summary>7. How can you access the app ?</summary> By exposing a port in the Dockerfile (EXPOSE 8000) and mapping it to a host port:docker run -p 8080:8000 myapp</details>
<details><summary>8. which is one is container port and which one is host port ?</summary>In -p 8080:8000: 8080 is the host port, 8000 is the container port.</details>
<details><summary>9. Explain about CI/CD Pipeline setup ?</summary> </details>
<details><summary>10. How helm integrated ?</summary> Tools: GitHub Actions

CI: Lint, test, build Docker image, scan using Trivy

CD: Deploy to Kubernetes via Helm

Notifications via Slack/email</details>
<details><summary>11. How can you send email notification to the team after job finished ?</summary>Helm charts stored in Git repo

CI pushes image → Helm upgrades deployed release
helm upgrade --install cloudnotes ./chart --values=values.yaml
</details>
<details><summary>12. write CI/CD pipeline (declarative) with multiple stages</summary>se mailx or sendmail

In GitHub Actions:
```
- name: Send email
  uses: dawidd6/action-send-mail@v3
```
</details>
<details><summary>13. Do you have separate Ci and CD pipelines or single pipeline ?</summary>name: CI-CD
on: [push]
jobs:
  build:
    steps:
      - run: docker build -t app .
      - run: trivy image app
  deploy:
    steps:
      - run: helm upgrade --install app ./chart 

Sometimes yes. CI runs on every push; CD is triggered after approval or on tag.
</details>
<details><summary>14. what is your deployment process ?</summary> CI → Build & Scan → Helm Deploy → ArgoCD Sync → Post-deploy validation → Slack notify</details>
<details><summary>15. terraform lifecycle ?</summary>
terraform init

terraform plan

terraform apply

terraform destroy</details>
<details><summary>16. what is terraform validate ?</summary>It checks syntax and logical structure of the configuration—does not hit the cloud provider. </details>
<details><summary>17. How you will handle secrets in terraform don't say terraform.tfvars</summary>Use aws_secretsmanager

Use sops + terraform-provider-sops

Backend encryption via KMS + remote state </details>
<details><summary>18. what are providers in terraform ?</summary>Plugins to interact with platforms like AWS, Azure, GitHub, etc
  provider "aws" {
  region = "us-east-1"
} </details>
<details><summary>19. write a terraform file to create EC2 instance</summary> resource "aws_instance" "web" {
  ami = "ami-123456"
  instance_type = "t2.micro"
  tags = {
    Name = "WebServer"
  }
}</details>
<details><summary>20. what are different types of S3 buckets ?</summary> Standard

Intelligent-Tiering

Infrequent Access

Glacier

Glacier Deep Archive</details>
<details><summary>21. what is glacier ?</summary>Low-cost, long-term archival storage for rarely accessed data. Retrieval takes minutes to hours. </details>
<details><summary>22. difference between EBS and EFS ?</summary> EBS: Block storage, attached to one instance

EFS: NFS-like file storage, shared among instances

</details>
<details><summary>23. Difference between roles and policies ?</summary> Policy: Defines permissions

Role: Entity assuming policies</details>
<details><summary>24. if EC2 failed how will u sent up notification mechanism to the team ?</summary>Setup CloudWatch alarm → SNS topic → Email/Slack </details>
<details><summary>25. How will you check disks and its mountpoints in terraform ?</summary>Use remote-exec provisioner to run: `df -hT` </details>
<details><summary>26. How will you check diskutilization in linux</summary>df -h </details>
<details><summary>27. Difference between df -h and du -h ?</summary>df -h: Filesystem-level disk usage

du -h: Directory-level usage (more granular)

 </details>
<details><summary>28. what is helm ? what files exists in helm ? what charts.yml contains ?</summary> chart/
  Chart.yaml
  values.yaml
  templates/

Chart.yaml: Metadata (name, version)

values.yaml: Default config values

templates/: K8s manifests (with Go templating)
</details>
<details><summary>29. let's say you deployed an application into IIS server . Suddenly your UI stops working and now how can you fix it ? SSL/TLS, port</summary>Check if SSL cert is valid

Restart IIS service

Verify firewall allows inbound on port 443/80

 </details>
<details><summary>30. how can you check a particular process's status in linux ?</summary> 
ps aux | grep process_name or systemctl status <service>
</details>
<details><summary>31. git ammend, git cherrypick, rebase, reset explain</summary>git commit --amend: Modify last commit

git cherry-pick <commit>: Apply specific commit

git rebase: Reapply commits on top of another

git reset: Move HEAD to a previous commit </details>
<details><summary>32. let's say you have master branch which is at commmit id 100, you created another branch A on top of master branch. it has commits 101 .....120 and now u again created another branch D from master branch. Here you wanted to get data of A branch of commit 105 and 110. done now you got another commit id 121. after sometime you that you did mistake how would you get back to 105 ?</summary>git checkout D
git cherry-pick <commit-105> <commit-110> </details>
<details><summary>33. in the same above context, u didn't pushed to the remote repository . how can you make a change to a single file ? ammend has to use need to observe the word not pushed to remote repo</summary>git add file.py
git commit --amend </details>
<details><summary>34. what libraries you worked in python ?</summary>requests, pandas, boto3, subprocess, datetime, json, logging, pathlib </details>
<details><summary>35. let's say i have Address { house:124 } how could you get house's value ?</summary>Address = {"house":124}
print(Address["house"]) </details>
<details><summary>36. let's say you have log data of an application and now there is a requirement to fetch log data of a particular date ? how can you achieve this ?</summary>grep '2023-07-06' app.log or by using `awk` awk '/2023-07-06/' app.log
</details>

Feedback : You are good at horizontally has to be good at vertically . if i ask you multiple ways u can able to answer but when i go indepth of a particular tool. then u are fearing. learn one programming language get logic clear. cloud skills needs tobe polished

Finally selected🎉🔥✅







