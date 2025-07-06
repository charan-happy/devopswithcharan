Date : 19/06/2025  Time : 1.30-2.30 PM

<details><summary>1. Tell me about yourself</summary></details>
<details><summary>2. Since, you mentioned in your resume that you have reduced deployment time by 30 % justify this statement. How you did and what action you have taken
👨‍💻 Context from my actual project:
In my last role, we had a microservices-based application running across multiple environments — dev, QA, staging, and prod — deployed on Kubernetes (EKS) and Azure AKS clusters.

Originally, deployments were done manually or semi-automated using Jenkins with scripts tied to shared folders and a very fragile workflow.

The deployment time per service was around 12–15 minutes, and when multiple services needed updates, we often had downtimes, rollbacks, and sync issues between environments.

🚀 Steps I Took to Reduce Deployment Time by 30%
1. 🔁 Switched from Script-Based Deployments to GitOps (ArgoCD)
Introduced GitOps using ArgoCD to automate and manage deployments.

Each service had its own Helm chart with environment overlays (dev, staging, prod).

Pushing to the Git branch triggered auto-deployments via ArgoCD.

✅ Result: No more manual interventions; deployments started happening within seconds of merge.

2. 🧱 Optimized Docker Images
Our base images were too heavy (using ubuntu:latest, node images with unnecessary tools).

Switched to minimal images (e.g., alpine, multi-stage builds).

Cleaned up layers, removed unnecessary packages, and added .dockerignore.

✅ Result: Image build time reduced by ~40%; smaller image = faster pull time on K8s.

3. 📦 Parallelized CI Jobs in GitHub Actions
Converted the sequential Jenkins pipelines to GitHub Actions, and used matrix strategy to build/test services in parallel.

Caching used for:

npm and pip dependencies

Docker layer cache using GitHub’s actions/cache and buildx

✅ Result: CI pipeline time dropped from 10–12 min to 4–5 min.

4. 🕵️‍♂️ Implemented Canary Deployments with Helm & Argo Rollouts
Used argoproj/argo-rollouts for progressive delivery.

Only 10% of traffic was routed to new pods initially, with health checks.

Full rollout happened only after health was stable.

✅ Result: Safer deployments and less downtime; no need for manual approval and rollback unless really needed.

5. 🛑 Reduced Wait Time via Pre-pulled Images & Node Affinity
Pre-pulled critical service images on nodes with DaemonSet.

Used node affinity and tolerations to pin memory-heavy apps to optimized nodes.

✅ Result: Reduced cold-start and scheduling delays in Kubernetes.

6. 📣 Slack Notifications & Webhooks
Integrated GitHub Actions with Slack for deployment success/failure alerts.

Helped devs act faster on failure and retry instantly with slash commands.

✅ Result: Shorter feedback loops = faster bugfix + redeploy cycles.

📊 Impact Measured:
Metric	Before Optimization	After Optimization
Avg Deploy Time (per svc)	12–15 minutes	7–9 minutes
Downtime per deploy	2–4 mins	~0 or near zero
Manual steps	4–5 steps	0 (GitOps-based)
Rollbacks/Failures	Weekly	Rare (once/month)

🔁 Overall Deployment Time Reduction: ~30–40%

🎯 Tools/Technologies Used
GitHub Actions

ArgoCD

Helm + Argo Rollouts

Kubernetes (EKS + AKS)

Docker (Multi-stage builds, BuildKit)

Slack Webhooks

Trivy & SonarQube (inline security + quality scans)

💬 Final Line (For Interview):
"This wasn’t a one-time fix — I treated it like a continuous improvement initiative. By moving to GitOps, optimizing Docker, enabling parallel pipelines, and automating safe rollouts, I brought down deployment time significantly, increased team confidence, and helped ensure 99.9% availability." ✅


✅ How do I justify numbers like "30% reduction in deployment time"?
🧠 DevOps is a data-driven role — we track metrics like build duration, deployment time, failure rate, recovery time, etc., using tools like Grafana, Prometheus, Jenkins dashboards, GitHub Actions Insights, ArgoCD, and manual logs.

So even though these look exact, they’re based on real trends and monitoring dashboards — not random guesses.

🔍 Here’s how I got to 30% in my project:
Phase	Before Optimization	After Optimization	Source
Docker Build	~5–6 min (heavy images)	~2.5–3 min (alpine, multi-stage)	GitHub Actions + Docker logs
CI Pipeline	~10–12 min	~5–6 min (parallel + cache)	GitHub Actions metrics
K8s Deploy	~3–4 min rollout with downtime	<1 min rollout with Argo Rollouts	ArgoCD dashboards
Downtime	2–4 min (manual rollout)	0–10 sec (canary+health checks)	Uptime probe + SLO dashboards

✅ Deployment time (end-to-end) dropped from ~15 mins to ~9–10 mins, which is a 30–35% reduction.

🔧 Tools That Helped Me Measure:
GitHub Actions → Pipeline duration (via Insights tab)

ArgoCD → Deployment history and rollout time

Grafana + Prometheus → HTTP probe latency, app availability

ELK / Loki / CloudWatch Logs → Timestamp logs of deployments

Slack Notifications → Time between deployment start and success alert

🧑‍💼 What to Say in an Interview:

“I tracked our average deployment time using GitHub Actions Insights and ArgoCD dashboards over a 2-month period. After switching to GitOps, optimizing Docker builds, and enabling parallel jobs, we saw a consistent drop in deployment time — from an average of 14–15 minutes to around 9 minutes. That’s how I confidently state we achieved about a 30% improvement.”

</details>

<details><summary>3. You mentioned 99.9% uptime and costoptimization in aws cloud ? How you did and what steps you have taken</summary></details>
<details><summary>4. How you will solve terraform drift issues ?</summary>Use terraform plan to detect drift

If confirmed manual change: either import (terraform import) or apply override via Terraform

If unwanted, recreate state using terraform state rm/add

</details>
<details><summary>5. What does terraform plan will do ?</summary>It shows what changes Terraform will make before applying. Acts like a dry-run. Helps avoid unintentional infra modifications.</details>
<details><summary>6. how will you resolve manual changes  ex: u wanted to create 1 extra instance w.r.to. existing resources and when u do terraform plan u are able to see 2 instances. How will you fix it ?</summary>Either terraform import that manual instance into state

Or delete the manual one and let Terraform manage it

Update your Terraform config to match desired count</details>
<details><summary>7. what grep and regular expressions and how will they help ?</summary>grep: search for patterns in files

RegEx helps search complex patterns (IP, error codes, dates)

Example:

bash
Copy
Edit
grep -E "^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$" file.txt  # Match IPs
</details>
<details><summary>8. what is vertical and horizontal scaling and which one is good ?</summary>Vertical Scaling: Increase resources (CPU, RAM) of a single server.

🟢 Easy to implement

🔴 Limited by hardware limits

Horizontal Scaling: Add more servers/nodes

🟢 Scales better, more fault-tolerant

🔴 Needs load balancers, distributed systems design

Horizontal scaling is better for cloud-native apps.</details>
<details><summary>9. what is docker , why docker ?</summary>Docker is a container platform that lets you package applications with all dependencies.

Why Docker:

Consistency across environments

Lightweight (no full OS like VMs)

Fast startup

Ideal for microservices and CI/CD</details>
<details><summary>10. is this ip correct ? 1.9.142.145</summary>Yes, it is a valid public IPv4 address.</details>
<details><summary>11. what is DHCP</summary>Dynamic Host Configuration Protocol – assigns IP addresses to devices dynamically from a pool. Saves manual effort in IP assignment.</details>
<details><summary>12. what is DNS</summary>Domain Name System – translates human-readable domain names (like google.com) to IP addresses.</details>
<details><summary>13. what is subnet mask</summary>Defines the network and host portion of an IP address. Used to determine routing boundaries in networking (e.g., 255.255.255.0 for Class C).

</details>
<details><summary>14. let's say i have a yaml file and how will you filter ip address may be it is ipv4/ipv6</summary>Using grep with regex:

bash
Copy
Edit
grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' myfile.yaml
For IPv6 (basic):

bash
Copy
Edit
grep -Eo '([a-f0-9:]+:+)+[a-f0-9]+' myfile.yaml</details>
<details><summary>15. image pullback off ? how will u fix it</summary>Causes:

Wrong image name/tag

Private repo without credentials

Network issues

Fixes:

Check kubectl describe pod

Verify image exists in registry

If private, create imagePullSecret and attach it to the pod/service account

---------------------------------------------------
 What is ImagePullBackOff in Kubernetes?
When a pod is stuck in ImagePullBackOff, it means:

Kubernetes tried to pull the image, failed, and is backing off (retrying with increasing delay) from pulling it again.

🧠 Status Flow
Here’s how the pod status typically evolves:

Pending

ContainerCreating

ErrImagePull ⛔ (failed to pull the image)

ImagePullBackOff 🔁 (K8s is retrying pulling image)

📈 Real-Time Example Scenario
Let’s say you’re deploying a Node.js microservice using a Helm chart or a deployment YAML, like:

yaml
Copy
Edit
spec:
  containers:
    - name: my-app
      image: myregistry.com/my-app:latest
      imagePullPolicy: Always
You deploy with:

bash
Copy
Edit
kubectl apply -f deployment.yaml
After a few seconds:

bash
Copy
Edit
kubectl get pods
You see:

perl
Copy
Edit
my-app-658d8b79d5-xxxxx   0/1   ImagePullBackOff   0     10s
🔍 Step-by-Step Troubleshooting Process (Like a 4-Year DevOps Pro)
✅ 1. Check Pod Events
bash
Copy
Edit
kubectl describe pod <pod-name>
Look for messages under Events at the bottom, like:

vbnet
Copy
Edit
Failed to pull image "myregistry.com/my-app:latest": rpc error: code = Unknown desc = Error response from daemon: pull access denied for ...
Back-off pulling image "..."
This message is gold — it gives the exact reason.

✅ 2. Root Causes & Fixes
Let’s explore ALL possible causes with fixes, visuals, and commands:

🔸 A. Image Not Found (Wrong name or tag)
Reason: Misspelled image name or tag doesn’t exist

Example:

yaml
Copy
Edit
image: my-app:latestt
Fix:

Confirm image exists:

bash
Copy
Edit
docker pull myregistry.com/my-app:latest
Correct the image name/tag in YAML:

yaml
Copy
Edit
image: myregistry.com/my-app:latest
🔸 B. Private Registry – Unauthorized Access
Reason: Image exists but registry requires authentication (e.g., DockerHub, ACR, ECR)

Symptoms:

pgsql
Copy
Edit
pull access denied, repository does not exist or may require authorization
Fix:

Create a secret with credentials:

bash
Copy
Edit
kubectl create secret docker-registry myregcred \
  --docker-server=myregistry.com \
  --docker-username=USERNAME \
  --docker-password=PASSWORD \
  --docker-email=your@email.com
Attach to the pod or service account:

yaml
Copy
Edit
spec:
  imagePullSecrets:
    - name: myregcred
✅ Tip: For Amazon ECR, use:

bash
Copy
Edit
aws ecr get-login-password | \
kubectl create secret docker-registry ecrsecret \
  --docker-server=123456789.dkr.ecr.us-east-1.amazonaws.com \
  --docker-username=AWS \
  --docker-password-stdin
🔸 C. DNS Issues / Registry Unreachable
Reason: Kubernetes node cannot reach registry due to DNS or internet issues

Fix:

From node:

bash
Copy
Edit
curl -v https://myregistry.com
nslookup myregistry.com
Check node network and DNS settings (CoreDNS, resolv.conf)

🔸 D. ImagePullPolicy Misconfiguration
Common mistake:

yaml
Copy
Edit
imagePullPolicy: Always
but using local image that’s not pushed to registry

Fix:

Use IfNotPresent if testing local dev

Or make sure the image is pushed to a public/private registry

🔸 E. Missing or Incorrect imagePullSecrets
Even after creating the secret, you must attach it!

Fix:

yaml
Copy
Edit
spec:
  imagePullSecrets:
    - name: my-docker-secret
🔸 F. Kubernetes Node Disk Full or Docker Daemon Crash
Reason: Docker can’t pull because the node disk is full or daemon failed

Fix:

SSH into the node

Check:

bash
Copy
Edit
df -h
sudo systemctl status docker
sudo journalctl -u docker
📊 Visual Summary Diagram
Here's a conceptual diagram:

pgsql
Copy
Edit
               ┌────────────┐
               │   Pod      │
               │ Spec Image │
               └────┬───────┘
                    │
                    ▼
       ┌──────────────────────────┐
       │ Kubelet asks containerd  │
       │ to pull image            │
       └──────────┬───────────────┘
                  ▼
     ┌──────────────────────────────┐
     │ Can image be fetched?        │
     │ - Yes → Pod runs             │
     │ - No  → ImagePullBackOff     │
     └──────────────────────────────┘
                  ▲
        ┌─────────┴────────────┐
        │ Check Reasons:       │
        │ - Wrong name/tag     │
        │ - Private registry   │
        │ - Bad pull policy    │
        │ - Node/DNS issues    │
        │ - Missing secrets    │
        └──────────────────────┘
🔄 Recovery Tips (Real-world)
Action	Command
Reapply fixed deployment	kubectl apply -f deployment.yaml
Restart pod	kubectl delete pod <pod>
Check logs	kubectl describe pod <pod>
Test image locally	docker pull image

✅ Prevent It in CI/CD
In real-world pipelines (GitHub Actions, Jenkins), you can:

Run docker build && docker push before K8s deployment

Add step to verify image existence before applying manifests

Automatically attach imagePullSecrets to Helm values

✅ Pro DevOps Debug Template
bash
Copy
Edit
kubectl describe pod <pod> | tee pod.log
grep -i "Failed" pod.log
docker pull <image>  # Locally verify



</details>
<details><summary>16. difference between sql and no sql</summary>Feature	SQL	NoSQL
Structure	Tables (rows/columns)	Documents, key-value, etc
Schema	Fixed	Flexible
Examples	MySQL, PostgreSQL	MongoDB, Cassandra
Use case	Structured data, ACID	Big Data, real-time, IoT</details>
<details><summary>17. what is indexing in sql</summary>Indexes speed up data retrieval by creating lookup tables for quick search. Example:

sql
Copy
Edit
CREATE INDEX idx_name ON users(name);
Trade-off: faster read, slightly slower write.</details>
<details><summary>18. what is git conflict and how will you resolve</summary>Occurs when two branches modify the same line of a file.

Steps:

Git will mark conflict sections (<<<<<<<)

Manually edit and choose correct content

git add .

git commit</details>
<details><summary>19. what are different deployment models in kubernetes</summary>Recreate – Stops old version before starting new

RollingUpdate – Default; gradually replaces pods

Blue-Green – Deploy to a separate environment, switch traffic

Canary – Gradually expose to users in phases</details>
<details><summary>20. explain differnece between canary vs blluegreen deployments</summary>Feature	Canary	Blue-Green
Rollout	Gradual, % of users	Full switch
Risk	Lower	Medium
Complexity	Higher (needs traffic mgmt)	Lower</details>
<details><summary>21. why we need recreate ?</summary>Use when:

Old version and new version can’t coexist

DB schema changes

Port conflicts</details>
<details><summary>22. Difference between paas and saas give examples</summary>PaaS (Platform as a Service): Platform to develop apps
Ex: Azure App Services, Heroku

SaaS (Software as a Service): Complete apps
Ex: Gmail, Office365</details>
<details><summary>23. what do you know about serverless and what kind of languages will it use (python,java, go etc)</summary>Serverless = no infra management, pay-per-execution.
Runs in response to events.

Languages supported: Python, Node.js, Go, Java, C#

Ex: AWS Lambda, Azure Functions</details>
<details><summary>24. which of the deployment models have downtime and if it is having downtime why we need them ?</summary>Recreate – Yes, due to stopping old pods first

RollingUpdate – No downtime if maxUnavailable=0

Blue-Green/Canary – No downtime if routing is smooth

Downtime can be acceptable in internal/test apps where traffic isn't continuous.</details>
<details><summary>25. what is helm</summary>Helm is the package manager for Kubernetes.
Like apt for Ubuntu or yum for CentOS, but for K8s apps.

Uses Charts (templated YAML files) for deploying apps with parameters.

</details>
<details><summary>26. how will u check previous versions of helm</summary>helm history <release-name>
Shows version, status, updated time, revision, and notes.

</details>
<details><summary>27. what will helm history do</summary>It shows the rollout history (versions) of a Helm release.
You can rollback to a previous revision if needed:

bash
Copy
Edit
helm rollback <release-name> <revision-number></details>
<details><summary>28. Explain about message queues</summary>Message Queues (MQ) help decouple services. Producers send messages; consumers read them asynchronously.

Used for:

Retry mechanisms

Load buffering

Async processing

Examples:

RabbitMQ

Kafka

Azure Service Bus

AWS SQS</details>
    



Feedback : It doesn't matter how much you know, how much you are answering matters
           you know each and every concept but you don't know how to apply it
           You should be having thorough troubleshooting skills
           Needs to have good networking knowledge, you are lacking even basics
           You must know whatever u mentioned in the resume
           you have to know about scripting


Reality checking interview . ... Interviewer is from Onsite. Constructive criticism. Rejected ❌
           
