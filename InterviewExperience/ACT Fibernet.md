Interview Date : 11/03/2025 Time : 5.30 PM 

Job Description :
----------------
- Key Responsibilities
1. Data Center Management
• Managing Data Centre team – To ensure smooth operations, and prompt resolution of incidents. Expected to manage team working in shifts 24*7
• Ensuring daily, weekly and monthly reports preparation and submission
• Coordinate with all stakeholders and management of projects related to data centre
• Vendor coordination – OEMs and system integrators - on AMC renewals, new equipment purchases
• Team management / Leadership skills 
• Continuous efforts on process improvement related to data centre operations

2. DevOps and Automation
Implement and manage CI/CD pipelines for efficient code deployment and infrastructure changes.
Leverage tools such as Ansible, Terraform, and Kubernetes to automate infrastructure provisioning and management.
Promote the adoption of Infrastructure-as-Code (IaC) practices.
Collaborate with development teams to optimize system performance and troubleshoot application issues.
Integrate monitoring and logging tools like Prometheus, Grafana, and ELK for proactive incident management and performance tuning.

3. Leadership and Collaboration
Lead, mentor, and develop a team of data center and DevOps engineers.
Act as the point of escalation for critical technical issues, providing expert guidance and resolution.
Foster collaboration between operations, development, and security teams to implement a DevSecOps culture.
Define and track KPIs for team performance, data center uptime, and system reliability.

4. Continuous Improvement
Research and adopt emerging technologies in data center and DevOps spaces to improve scalability and reliability.
Ensure documentation of processes, configurations, and incident resolution for operational transparency.

Required Skills and Qualifications
Technical Skills
Expertise in DevOps tools like Kubernetes, Docker, Git, Terraform, and Ansible.
Experience with monitoring and observability tools (e.g., Prometheus, Grafana, ELK).

Leadership Skills
Proven experience leading technical teams and managing projects.
Strong communication and interpersonal skills to collaborate with cross-functional teams and stakeholders.
Ability to prioritize tasks, delegate responsibilities, and ensure timely delivery of projects.
Problem-solving mindset with a focus on root cause analysis and long-term solutions.

Experience
1+ years of experience of team managing
2+ years of experience in DevOps practices and tools.
2+ years of experience of Data Center operations.
Certifications in relevant areas (Kubernetes CKA/CKAD) are a plus.
Should have expertise in Site Reliability Engineering (SRE).

---

### Interview Questions & Answers

### 1. Tell me about yourself?
**Answer:**
Structure your self-introduction chronologically and impactfully:
* **Current Role & Experience:** State your total years of experience, current title, and core domain (e.g., Cloud/DevOps & Data Center Operations Engineering).
* **Core Tech Stack:** Briefly mention your expertise across AWS/Cloud, Kubernetes/Docker, Infrastructure as Code (Terraform, Ansible), and monitoring stacks (Prometheus, Grafana, ELK).
* **Leadership & Operations:** Highlight experience managing data center operations, team leadership, vendor coordination, and driving uptime/reliability KPIs.
* **Key Achievements & Goal:** Conclude with a major accomplishment in process improvement or automation and why you are excited about this opportunity.

---

### 2. What are you going to do in your CI/CD process and what are different pipelines you have in your organization?
**Answer:**
* **What we do in CI/CD:** Automate the entire software delivery lifecycle—from code commit to production deployment. This includes automated code linting, unit/integration testing, security and vulnerability scanning, container image building, pushing to a secure registry (like ECR/DockerHub), and automated or gated deployments using GitOps or deployment pipelines.
* **Different Pipelines:**
  1. **CI (Continuous Integration) Pipeline:** Triggered on pull requests/commits; runs tests, builds artifacts, and performs static code analysis.
  2. **CD (Continuous Deployment/Delivery) Pipeline:** 
     * *Staging Pipeline:* Automatically deploys verified builds to a staging/QA environment for acceptance testing.
     * *Production Pipeline:* Deploys to production following manual approval gates, using rolling updates or blue/green deployment strategies for zero downtime.
  3. **Infrastructure as Code (IaC) Pipeline:** Provisions and validates cloud infrastructure or data center components using Terraform/Ansible via automated pull request checks.

---

### 3. If application is not working as expected in Kubernetes cluster what you are going to do and how would you do the troubleshooting?
**Answer:**
Follow a systematic, layer-by-layer troubleshooting approach:
1. **Check Pod Status (`kubectl get pods`):** Look for error states like `CrashLoopBackOff`, `ImagePullBackOff`, `Pending`, or `OOMKilled`.
2. **Inspect Pod Details (`kubectl describe pod <pod-name>`):** Review the events section to check for scheduling issues, failed volume attachments, or resource constraints.
3. **Check Container Logs (`kubectl logs <pod-name>`):** Inspect standard output/error logs to catch application exceptions or configuration errors. If the pod has multiple containers, specify the container name (`-c <container>`).
4. **Interactive Debugging (`kubectl exec`):** Attach to the running pod (if alive) to test local connectivity, environment variables, and file paths.
5. **Network & Service Check:** Verify that services, endpoints, and ingress rules are correctly routing traffic to the right pod selectors.
6. **Resource Limits:** Check if the node or pod is hitting CPU/memory limits, leading to OOM kills.

---

### 4. What are different monitoring solutions we have for Kubernetes monitoring?
**Answer:**
* **Prometheus & Grafana:** The industry standard for metrics collection, alerting (via Alertmanager), and visual dashboards. Often paired with node-exporter and kube-state-metrics.
* **ELK Stack (Elasticsearch, Logstash, Kibana) / Grafana Loki:** For centralized log aggregation and analysis across all cluster nodes and pods.
* **Datadog / Dynatrace / New Relic:** Comprehensive commercial APM (Application Performance Monitoring) and observability platforms providing out-of-the-box Kubernetes cluster maps, tracing, and metrics.
* **AWS CloudWatch Container Insights:** Native AWS solution for monitoring, logging, and diagnosing containerized applications running on EKS.

---

### 5. Let's say, if deployment and services are done and what we have to do to make that application accessible to the end users?
**Answer:**
To expose a Kubernetes deployment externally to end users, you need the following routing layers:
1. **Expose via a Service (ClusterIP, NodePort, or LoadBalancer):**
   * If running on cloud providers (like AWS), creating a Service of type `LoadBalancer` automatically provisions an external cloud load balancer (ALB/NLB).
2. **Configure Ingress / Ingress Controller:**
   * Set up an Ingress resource (along with an Ingress Controller like NGINX, Traefik, or AWS Load Balancer Controller) to manage external HTTP/HTTPS traffic routing, handle path-based routing (e.g., `/api`), and manage SSL/TLS termination.
3. **DNS Configuration (Route 53 / ExternalDNS):**
   * Map your domain name (e.g., `app.example.com`) to the external Load Balancer IP address or DNS name so users can access the application via a standard browser URL.

---

They asked some other questions but i don't remember whenever i remember i will keep it here
