### Interview Mode
Online

### Interview Date
24/10/2026

### Work Mode
Remote (Applied via Hirist/Naukri)

---

### 1. Walk me through your profile
**Answer:**
Structure your answer chronologically and impactfully:
* **Current Role & Experience:** State your total years of experience, current title, and core domain (e.g., Cloud/DevOps Engineering).
* **Core Tech Stack:** Briefly mention your expertise across AWS/Cloud, Kubernetes/Docker, CI/CD tools (GitHub Actions, GitLab CI, Jenkins), Infrastructure as Code (Terraform), and monitoring/logging stacks (Prometheus, Grafana, ELK).
* **Key Achievements:** Highlight 1–2 major accomplishments, such as reducing deployment times, migrating workloads to cloud/Kubernetes, or improving system uptime and security posture.
* **Transition/Goal:** Conclude with why you are excited about this opportunity.

---

### 2. Let's say my storage is full not able to ssh to ec2 then how will you troubleshoot in AWS
**Answer:**
When the root volume is 100% full, the SSH daemon often cannot allocate space for session files, blocking logins. Here is how to fix it:
1. **Stop the Instance:** Go to the AWS EC2 Console and stop the affected instance.
2. **Detach the Root Volume:** Unattach the root EBS volume (`/dev/sda1` or `/dev/xvda`).
3. **Attach as a Data Volume to a Helper Instance:** Launch or use a temporary "rescue" EC2 instance in the same Availability Zone, and attach the problematic volume to it as a secondary disk (e.g., `/dev/sdf`).
4. **Mount and Clean Up:** 
   * SSH into the rescue instance.
   * Mount the attached volume: `sudo mount /dev/xvdf1 /mnt` (adjust partition name accordingly).
   * Navigate to `/mnt` and check disk usage (e.g., `du -sh *` or check `/var/log`, `/tmp`, or Docker layer caches).
   * Delete or truncate unnecessary logs, temporary files, or old Docker images to free up space.
5. **Unmount and Reattach:** Unmount the volume (`sudo umount /mnt`), detach it from the rescue instance, reattach it back to the original instance as the root volume with the correct device name, and start the instance.

---

### 3. Difference between deployment vs statefulset
**Answer:**

| Feature | Deployment | StatefulSet |
| :--- | :--- | :--- |
| **Pod Identity** | Pods have random, interchangeable hashes (e.g., `nginx-56d9f-abc1`). | Pods have unique, sticky, ordinal identifiers (e.g., `mysql-0`, `mysql-1`). |
| **Storage (PVC)** | Uses standard PVCs where all pods typically share or mount independently without persistence guarantees tied to identity. | Uses `volumeClaimTemplates` providing each pod with its own dedicated, persistent storage that follows it if rescheduled. |
| **Scaling & Ordering** | Pods are created/destroyed in parallel and randomly. | Pods are deployed, scaled, and deleted sequentially in strict ordinal order ($0$ to $n-1$). |
| **Use Case** | Stateless applications (web servers, APIs, microservices). | Stateful applications requiring stable network IDs and storage (Databases, Kafka, ZooKeeper). |

---

### 4. One pod in node A how connected to one pod in node B
**Answer:**
Kubernetes networking relies on a flat cluster network model where every pod gets a unique IP address and can communicate with every other pod without NAT. The connection happens via a **Container Network Interface (CNI)** plugin (like Calico, Flannel, or AWS VPC CNI):
1. **Source Packet Creation:** Pod A (on Node A) sends a packet destined for Pod B's IP address.
2. **Node A Routing:** The Linux kernel on Node A checks its routing table. The CNI has configured routes telling it that Pod B's IP lives on Node B's subnet or physical node IP.
3. **Encapsulation / Direct Routing:** 
   * *Overlay Networks (e.g., VXLAN/Flannel):* Node A wraps the packet in a UDP envelope, adds Node B's IP as the destination, and sends it over the physical network.
   * *Underlay/VPC Networks (e.g., AWS VPC CNI):* The packet is sent directly across the VPC network without encapsulation because the cloud provider routes pod IPs natively.
4. **Node B Delivery:** Node B receives the packet, strips any encapsulation if applicable, and passes it through its bridge/veth pair directly into **Pod B's** network namespace.

---

### 5. Difference between network loadbalancer and application load balancer when we use what, why ?
**Answer:**
* **Application Load Balancer (ALB - Layer 7):**
  * Operates at the application layer (HTTP/HTTPS).
  * Offers content-based routing (path-based like `/images` vs `/api`, host-based routing, header/query parameter routing, and HTTP redirect capabilities).
  * **Use when:** You need smart HTTP/HTTPS routing, microservice path routing, or SSL termination at the load balancer level.
* **Network Load Balancer (NLB - Layer 4):**
  * Operates at the transport layer (TCP/UDP/TLS).
  * Handles millions of requests per second with ultra-low latency and static IP support per AZ.
  * **Use when:** You require extreme performance, TCP/UDP traffic routing, static IP addresses for client allowlisting, or compatibility with gaming/streaming protocols.

---

### 6. How will u give permission to /opt/app read only access to deploy user
**Answer:**
You can achieve this using standard Linux file permissions and Access Control Lists (ACLs):
1. **Change Ownership (if applicable):** Ensure the directory is owned by a privileged user/group:
   `sudo chown -R root:root /opt/app`
2. **Set Base Permissions:** Ensure others or the group have read and execute (`r-x`) permissions:
   `sudo chmod -R 755 /opt/app` *(Owner: rwx, Group: r-x, Others: r-x)*
3. **Using POSIX ACLs (for fine-grained control):** If the `deploy` user shouldn't inherit standard group permissions, grant explicit read/execute ACLs:
   `sudo setfacl -R -m u:deploy:r-x /opt/app`
   `sudo setfacl -R -d -m u:deploy:r-x /opt/app` *(ensures default inheritance for future files)*

---

### 7. In next 30 days if I ask u to move to EKS if we are currently in ec2 what will you do and how will u proceed ?
**Answer:**
Moving from raw EC2 instances to Amazon EKS within 30 days requires a structured, phased approach focusing on containerization and declarative infrastructure:
* **Phase 1: Containerization & Base Manifests (Days 1–10):**
  * Containerize all running EC2 applications into optimized Docker images.
  * Write Kubernetes manifests (`Deployment`, `Service`, `ConfigMap`, `Secret`, `Ingress`) or Helm charts for the applications.
* **Phase 2: Infrastructure Provisioning (Days 11–20):**
  * Provision the EKS cluster and Node Groups using Terraform or eksctl.
  * Set up cluster essentials: AWS Load Balancer Controller, ExternalDNS, Cert-Manager, and CNI/storage classes (EBS/EFS CSI drivers).
* **Phase 3: CI/CD & GitOps Integration (Days 21–25):**
  * Update CI pipelines to build images, push them to Amazon ECR, and deploy manifests to EKS (via Helm/ArgoCD).
* **Phase 4: Testing & Cutover (Days 26–30):**
  * Run staging validations, performance tests, and security scans.
  * Execute DNS cutover (Route 53) to point traffic to the new EKS ingress, followed by decommissioning old EC2 instances.

---

### 8. Docker compose vs ECS and why ?
**Answer:**
* **Docker Compose:**
  * A local orchestration tool running containers on a single Docker host using a single YAML file.
  * **Why use:** Perfect for local development, testing, and simple single-server deployments.
* **Amazon ECS (Elastic Container Service):**
  * A fully managed AWS container orchestration service that scales containers across multiple EC2 instances or serverless infrastructure (AWS Fargate).
  * **Why use:** Production-ready, highly available, integrates natively with AWS IAM, VPCs, CloudWatch, and Load Balancers without managing your own control plane.

---

### 9. There is no cicd, monitoring, and all deployments through ec2 ssh by developer only. No staging environment for a hipaa compliant, health care platform what will you in first 90 days and in which order , why only in that order
**Answer:**
In a regulated, healthcare environment (HIPAA compliance), security, auditability, and risk mitigation are paramount. Here is the strict chronological order:

1. **Days 1–30: Auditability, Access Control & Monitoring (Visibility & Compliance)**
   * *Why first?* You cannot secure or fix what you cannot see, and HIPAA mandates strict access tracking and audit logs.
   * *Action:* Revoke direct developer SSH access to production. Implement IAM roles, AWS CloudTrail, and centralized log aggregation/monitoring (e.g., CloudWatch, Prometheus/Grafana) to establish a secure baseline and audit trail.
2. **Days 31–60: Implement CI/CD & Secure Staging Environment (Risk Reduction)**
   * *Why second?* Eliminating manual SSH deployments stops human error. A staging environment mirrors production to validate code changes safely.
   * *Action:* Build automated CI/CD pipelines (e.g., GitHub Actions/GitLab CI) that perform automated vulnerability/secrets scanning and deploy to a mirrored HIPAA-compliant Staging environment.
3. **Days 61–90: Automated Production Deployments & Guardrails (Stability & Scale)**
   * *Why last?* Once visibility, audit logs, and staging verification are mature, automate the production deployment pipeline.
   * *Action:* Transition production deployments from manual SSH to gated, automated pipeline triggers with approval gates and robust rollback strategies.

---

### 10. `-rwxr-x---` - explain this in Linux
**Answer:**
This is a 10-character file permission string representing user, group, and other permissions:
* **`[-]`**: File type (dash `-` indicates a regular file; `d` would mean a directory).
* **`[rwx]`**: **User (Owner) permissions**—Read (`r`), Write (`w`), and Execute (`x`).
* **`[r-x]`**: **Group permissions**—Read (`r`), No Write (`-`), and Execute (`x`).
* **`[---]`**: **Others (World) permissions**—No permissions at all.

---

### 11. I have docker file as below Tell me what's not here
```dockerfile
From node:latest
Copy . /app
Run npm install
Env db_password=xyz@123
CMD node start
```
---
Issues / Missing Best Practices:

Working Directory (WORKDIR): WORKDIR /app is missing before COPY and RUN, meaning commands might execute in root.

Insecure Secret Hardcoding: ENV db_password=xyz@123 hardcodes sensitive credentials directly into image layers. Secrets should be injected securely at runtime.

Non-Root User: Running as the default root user inside the container violates security best practices.

Unpinned Base Image Tag: Using node:latest is non-deterministic; use a specific pinned version (e.g., node:20-alpine).

Missing .dockerignore / Build Context Optimization: Copying everything (. /app) before installing dependencies invalidates cache layers whenever any code file changes.

Incorrect CMD Syntax: CMD node start passes a space-separated string rather than JSON array format (CMD ["node", "start"]), which fails to forward Linux signals cleanly.

### 12. What is your understanding about layering cache in the above
**Answer:**

How Docker Caching Works: Docker builds images layer by layer. If a layer and its preceding context haven't changed, Docker reuses the cached layer instead of re-executing it.

The Flaw in the Example: Because COPY . /app comes before RUN npm install, every single time any source file changes, Docker invalidates the cache for that step and forces npm install to re-download all node modules from scratch, slowing down builds.

The Fix: Copy only package.json and package-lock.json first, run npm install, and then copy the rest of the application files.

### 13. Why we need quotes or [ ] in the CMD above ?
**Answer:**

Exec Form ["executable", "param"] vs Shell Form executable param:

When using the exec form (brackets and double quotes), Docker runs the command directly as PID 1 inside the container. This ensures that Linux signals like SIGTERM (sent during container stops/graceful shutdowns) are properly received by the application process.

When using the raw shell form, Docker wraps execution in a shell (/bin/sh -c), meaning your application runs as a child process of the shell, which can swallow or ignore shutdown signals and lead to unclean application terminations.

### 14. Rediness probe vs liveness probe when we use what and why ? what happens if liveness probe fails
**Answer:**

Liveness Probe:

Purpose: Checks if the container is still healthy and running properly.

What happens if it fails: Kubernetes assumes the container is broken or deadlocked and kills/restarts the pod.

Readiness Probe:

Purpose: Checks if the container is ready to accept incoming traffic/requests.

What happens if it fails: Kubernetes does not restart the pod; instead, it removes the pod's IP address from the endpoints of all associated Services so no traffic is routed to it until it recovers.

When to use: Use Liveness to catch deadlocked processes that require a restart; use Readiness to prevent traffic from hitting pods that are still starting up or loading caches.

### 15. what is CNI and what it will do , which cni you have used ?
**Answer:**

What is CNI & What it does: CNI (Container Network Interface) is a Cloud Native Computing Foundation (CNCF) standard specification that dictates how networking interfaces are configured for Linux containers. It is responsible for allocating IP addresses to pods, setting up network namespaces, managing routing tables, and handling inter-pod communication across nodes.

Commonly used CNI: Calico (frequently used for advanced Network Policies and high-performance overlay/non-overlay routing) or AWS VPC CNI (used natively in EKS to assign VPC IP addresses directly to Kubernetes pods).

### 16. Any questions to me ?
**Answer:**
Recommended questions to ask the interviewer:

"What does your current deployment frequency and incident recovery look like on this team?"

"Could you share more about the tech stack maturity and what major cloud/Kubernetes migration roadmap items are planned for the upcoming quarters?"

"How does the engineering team handle cross-functional collaboration between developers and operations (DevSecOps culture)?"

**Result : ** Interviewer directly told, we will have 2nd round which we can have with our CTO

