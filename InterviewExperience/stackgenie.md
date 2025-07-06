- I got an IM from the founder itself to attend an interview via linkedin
- interview got scheduled

Some of the questions they asked me in the interview are :
- Tell me about yourself ?
<details><summary>- What is the alternative name of helm in rancher ?</summary>
In Rancher, the alternative name or interface for Helm is “Apps & Marketplace” or simply “Apps”.

📌 Internally, Rancher uses Helm charts to deploy apps onto clusters, but abstracts the process via GUI/API. So when you're deploying something from the Rancher Catalog (like Prometheus or Longhorn), it's just a Helm chart under the hood — Rancher manages the Helm lifecycle (install, upgrade, rollback) for you.

Real-world use:
When I onboarded a new customer on Rancher, they needed monitoring. I went to Apps → Monitoring → Installed Prometheus stack, which behind the scenes deployed the Prometheus Helm chart using Rancher’s controller.</details>
<details><summary>- dockerfiles for go and python</summary>🚀 Go (Statically compiled, multi-stage build)
dockerfile
Copy
Edit
# Stage 1: Build
FROM golang:1.21-alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o app

# Stage 2: Slim binary
FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/app .
EXPOSE 8080
CMD ["./app"]
Real-use: Go builds are self-contained — so I strip it down to Alpine to get a 10MB image instead of 1GB.

🐍 Python (e.g., Flask App)
dockerfile
Copy
Edit
FROM python:3.11-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
EXPOSE 5000
CMD ["python", "app.py"]
Real-use: For lighter images, I use slim, avoid pip install -r during COPY of all code (to leverage caching), and keep no-cache-dir to prevent bloat.</details>
<details><summary>- what is difference between ARG and ENV</summary>
Feature	ARG	ENV
Scope	Available only at build-time	Available at build & runtime
Visibility	Not present in container unless explicitly passed	Present in container
Use Case	Inject secrets/flags during build	App-level config/env vars

Real example:

dockerfile
Copy
Edit
ARG APP_VERSION=1.0
ENV ENVIRONMENT=prod
I use ARG for image versioning/tagging.

I use ENV for Flask config like ENV=production so the app uses proper logging levels.</details>
<details><summary>- what is the difference between CMD and Entrypoint and give me usecase of it</summary>
Feature	CMD	ENTRYPOINT
Purpose	Default command	Mandatory execution
Overridden	Easily overridden	Not overridden unless with --entrypoint
Combined	Yes, can combine	Yes

Real-world use:

I used ENTRYPOINT for a Node app to ensure the app always starts with node app.js, even if someone accidentally overrides the CMD.

I used CMD in debug images where the command can be overridden like docker run -it mydebug bash.

dockerfile
```
ENTRYPOINT ["node"]
CMD ["app.js"]
```
</details>
<details><summary>- how are you doing patching for containers</summary>
is is where many engineers fall short — I approach it like CI/CD for base images.

🧩 Real Process:
Track base image CVEs:

Use Trivy, Grype, or Docker Scout

Integrate with CI

Example:

bash
Copy
Edit
trivy image myapp:latest
Keep FROM image updated:

Use Dockerfile ARG:

dockerfile
Copy
Edit
ARG BASE_IMAGE=python:3.11-slim
FROM $BASE_IMAGE
CI runs nightly pipeline to rebuild even if app code didn’t change.

Patch dependencies:

For Python/Node/Go — use Dependabot or pip-audit/npm audit

Redeploy: Always rebuild and redeploy container image on base image change or CVE discovery.

💡 I also set up GitHub Actions to run Trivy scan → Slack alert if critical CVEs show up</details>
<details><summary>- if api-server is down and how will you troubleshoot it ?</summary>

This is critical — the API server is the heart of K8s.

Step-by-step real troubleshooting:
Check control plane nodes status:

bash
Copy
Edit
kubectl get nodes
# OR if kubectl doesn’t work
ssh into master/control-plane node
Verify API server status:

bash
Copy
Edit
sudo docker ps | grep kube-apiserver
# OR for systemd-based kubeadm:
sudo journalctl -u kube-apiserver
Common fixes:

Cert expired (renew it)

etcd down → API won’t respond

High memory/CPU → restart container

Check /var/log/kube-apiserver.log

For Rancher-managed K8s:

Go to Rancher UI → Cluster → Check health

Use Rancher shell to exec into nodes if SSH is disabled

📌 In production, I often check /etc/kubernetes/manifests/ for misconfigured static pods crashing the API server.</details>
<details><summary>- In rancher, how you build clusters</summary>

I've built clusters using both RKE2 (Rancher Kubernetes Engine) and custom node provisioning.

Two ways:
Custom Cluster (Most common):

Provision VMs (Terraform + Ansible)

Register nodes via Rancher

Rancher installs agents (rancher-agent) and bootstraps Kubernetes

RKE2 Cluster:

Use Rancher to provision cluster with node templates (AWS EC2, vSphere, etc)

RKE2 runs as systemd services

More hardened, built-in etcd, better for regulated environments

Real use: At my last company, we used Rancher to deploy multi-tenant clusters (each team gets its own) via Terraform + custom scripts. I automated HA setup for Rancher with embedded etcd + external LB.</details>
<details><summary>- How are you building infrastructure to the customers in rancher ?</summary>

Real-world flow:
Terraform Infra:

Provision VMs, VPCs, EIPs, Load Balancer

Output inventory for Ansible

Ansible Bootstrap:

Install Docker/containerd

Harden OS

Register nodes into Rancher using:

bash
Copy
Edit
curl -sfL https://<rancher-url>/v3/scripts | sh
Rancher UI/API:

Use Rancher API to create cluster

Assign node roles (controlplane, etcd, worker)

Helm Deployments:

Install core tools like:

Cert-Manager

Prometheus

External DNS

Istio

CI/CD:

Integrate with GitHub Actions for app deployment using Helm + Kustomize

</details>
<details><summary>- what are multistage builds and how are you going to build them ?</summary>

Definition: Build your app in one stage, copy only the final artifact to a clean image.

Real-life usage:
When building Go or Java apps:

Build happens in heavy base image (Maven/Go)

Final image is Alpine/Debian, with only the built binary

dockerfile
Copy
Edit
FROM node:18 AS builder
WORKDIR /app
COPY . .
RUN npm install && npm run build

FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
Benefits:

Smaller size (cut 500MB down to 40MB)

Faster deploys

Less attack surface

</details>
<details><summary>- How will you reduce size of docker images ?</summary>My DevOps tactics:

Use slim or Alpine base images

Multi-stage builds

Clean up cache (apt-get clean, pip install --no-cache-dir)

Don’t run as root

Don’t COPY full context — use .dockerignore

Use distroless images for Go/Java

Pin dependencies to avoid bloat

Example: For Python apps, I dropped from 400MB (Debian full) to 80MB using python:3.11-slim and proper .dockerignore.</details>
<details><summary>- is it possible to setup multistage builds for python applications ?</summary>

Absolutely — I’ve done it in microservices where I:

Build Python wheels in one stage

Copy only needed .pyc, .so, or built packages to final stage

dockerfile
```
FROM python:3.11-slim as base
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

FROM python:3.11-slim
WORKDIR /app
COPY --from=base /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY . .
CMD ["python", "main.py"]
```
In regulated environments where size + security + reproducibility matter — this is a must-have.

</details>


Feedback : Has to focus on fundamentals. Lacking in fundamentals. We need builders not supporters
Result : Rejection ❌
