--> Got interview call from naukri

## Round 1

date : 3/6/2025 Time : 11-11.30 AM

Azure DevOps Engineer role

<details><summary>1. Tell me about yourself ?</summary></details>
<details><summary>2. write yaml file structure for any kubernetes objects ?</summary>Deployment structure
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp
spec:
  replicas: 3
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
      - name: myapp-container
        image: myapp:latest
        ports:
        - containerPort: 80

</details>
<details><summary>3. Tell me about kubernetes architecture ?</summary>
Kubernetes architecture follows a master–worker model:

Control Plane (Master Node):

kube-apiserver: Entry point to cluster

etcd: Key-value store for cluster state

controller-manager: Handles replication, endpoints, etc.

scheduler: Schedules pods to nodes

Worker Nodes:

kubelet: Manages containers on the node

kube-proxy: Handles networking/routing

container runtime: Like Docker or containerd</details>
<details><summary>4. Have you done any automation in your current project and what are the challenges u got inbetween and how you overcome them ?</summary>Yes, I’ve automated:

Infrastructure provisioning using Terraform

Deployment pipelines via GitHub Actions

Alerting and monitoring using Prometheus stack

Challenges:

Dependency issues across modules → Solved with modular Terraform and remote state

Secrets handling → Integrated AWS Secrets Manager with GitHub Actions

Multi-env handling → Used environment overlays and dynamic variable injection</details>
<details><summary>5. Your experience with sql ?</summary>Comfortable with writing complex JOIN, GROUP BY, subqueries, indexing, performance tuning. Used MySQL and PostgreSQL for backend support, mostly for reading logs, writing analytics queries, and managing schemas during migrations.</details>
<details><summary>6. Have you done any on-prem to cloud migrations ?</summary>Yes, I’ve migrated legacy .NET apps from on-prem VMs to Azure App Services and SQL DB. Used Azure Migrate tool, containerized services, moved databases with DMS, and built Infra with Terraform.</details>
<details><summary>7. Explain me about typical CICD pipeline flow ?</summary>Code pushed to GitHub

CI builds:

Unit test, lint

Build Docker image

Scan image (Trivy, SonarQube)

CD pipeline:

Push image to registry

Deploy to K8s with Helm

Notify via Slack/email

Rollback if failure detected</details>
<details><summary>8. How terraform and azure integrated ?</summary>Use AzureRM Provider

Authenticate using service principal

Store state in Azure Blob Storage

Use terraform init, plan, apply

Example:

provider "azurerm" {
  features = {}
}</details>
<details><summary>9. why sonarqube and how u will integrate in your pipeline ?</summary>To ensure code quality, security, and compliance.

Integration:

Add SonarQube scanner in CI pipeline

Use SonarQube token

Example GitHub Actions step:

yaml
Copy
Edit
- name: SonarQube Scan
  uses: sonarsource/sonarqube-scan-action@v1</details>
<details><summary>10. what azure services you used ?</summary>Azure DevOps (Repos, Pipelines)

Azure VM

Azure App Services

Azure Key Vault

Azure Blob Storage

Azure Functions

Azure AKS (Kubernetes)

Azure SQL Database

Azure Monitor, Log Analytics</details>
<details><summary>11. what challenges you  solved and did you take help from anyone or else you did yourself ?</summary>Challenges:

Deployment race conditions (solved with workflow gates)

Cost optimization (shutdown non-prod VMs using automation runbooks)

Network latency (implemented Azure Front Door for routing)

Mostly handled issues myself, but collaborated with architects for larger changes.</details>
<details><summary>12. what is your experience with bash/python ?</summary>Bash: Used for automation scripts (backup, log parsing, cron jobs)

Python: Used for writing custom monitoring plugins and REST API interactions</details>
<details><summary>13. Do you know about RBAC in azure ?</summary>Yes, Azure RBAC controls access using roles like Reader, Contributor, Owner.

Example:

Assign Contributor role to DevOps team on Resource Group

Use az role assignment create to automate</details>
<details><summary>14. Are you preparing for any certifications ?</summary></details>

    They are actively working on migrations from on-prem to cloud. Got positive feedback and moved me to next round of interview
 
## Round 2 Date : June 4 2025 Time : 12 - 12.30 PM


## Round 3 Client Interview Date : june 10 2025 Time : 10 - 10.30 PM
- Showed one azure pipelines script and asked me to explain line by line, each and every component

  Verdict : Selected ✅🔥🔥
  Package Offered : 1012150 (10 LPA)
   DOJ : 27/7/2025 Work Mode : WFH
  
