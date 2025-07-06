--> Got interview call from recruiter directly, i applied through linkedin.

Good Interview experience, The interviewer is a foreigner and way of questioning/interviewer is like a conversation instead of question and answers

Company Name: Avaloq interview happened from 2-2.30 PM IST. Remote mode interview date: 14/05/2025 

<details><summary> 1. Tell me about yourself ?</summary>I'm a DevOps Engineer with 4 years of hands-on experience in building CI/CD pipelines, infrastructure automation, container orchestration, and cloud-native deployments. I’ve worked extensively with tools like Kubernetes, Docker, Helm, Terraform, Ansible, and GitHub Actions. My recent focus has been on building scalable infra using Rancher (RKE2), integrating security and observability into pipelines, and automating the release lifecycle for microservices-based apps. I specialize in reducing deployment times and ensuring high availability by building developer-centric infrastructure with best practices. </details>
<details><summary>2. what it takes to be a devops ? what does devops means to you ?</summary>To me, DevOps is not just tools—it's a cultural shift that fosters collaboration between dev, ops, and QA to deliver reliable software faster. A true DevOps engineer:

Thinks automation-first

Understands systems end-to-end (from code to infra)

Is proficient with CI/CD, scripting, cloud platforms

Is proactive in identifying bottlenecks and observability gaps

Embraces Infrastructure-as-Code and version control for everything </details>
<details><summary>3. how can we store credentials in jenkins ?</summary>Use Jenkins credentials plugin:

Navigate to: Manage Jenkins → Credentials

Store secrets as:

Secret text

Username/Password

SSH keys

Certificates
Use in pipeline:

withCredentials([string(credentialsId: 'my-secret', variable: 'SECRET')]) {
  sh 'echo $SECRET'
}
</details>
<details><summary>4. how can we configure EMAIL-NOTIFICATIONS in jenkins ?</summary> Steps:

Configure SMTP in Manage Jenkins → Configure System

Add recipient email IDs

Use emailext plugin in post-build actions:
```
post {
  failure {
    emailext to: 'devops@company.com', subject: 'Build Failed', body: 'Fix immediately'
  }
}
```
</details>
<details><summary>5. why we use ansible and how it will help ?</summary> Ansible helps automate:

Server provisioning

App deployments

Configuration enforcement (idempotent)

Compliance checks

Benefits: Agentless (SSH-based), YAML readable, reusable roles</details>
<details><summary>6. what is the most frequently faced issues as a devops engineer and how you fixed it ?</summary>Issue: Node disk pressure in Kubernetes caused pods to evict
Fix:

Investigated using kubectl describe node

Freed up /var/lib/docker with logrotate

Setup monitoring alert using Prometheus/Grafana </details>
<details><summary>7. how will you run parellel jobs in jenkins ?</summary> Use Jenkinsfile with parallel block:

```
parallel {
  stage('Lint') { steps { sh 'npm run lint' } }
  stage('Test') { steps { sh 'pytest tests/' } }
}
```
</details>
<details><summary>8. what are the automations that you did in your project ?</summary> Auto-scaling nodes using cloud-init + Terraform + Rancher API

GitHub Actions self-hosted runner provisioning

Daily Trivy scans integrated with Slack alerts

S3 log archival and rotation with lifecycle policies</details>
<details><summary>9. if there is a pod not starting in the cluster, what will be your action to fix it ?</summary>Steps:

kubectl get pod → see STATUS

kubectl describe pod <pod> → events/logs

kubectl logs <pod> → container logs

Fix causes like:

ImagePullBackOff → check image path/registry secrets

CrashLoopBackOff → check app logs

Pending → node resource issues / taints / PVC unbound </details>
<details><summary>10. How can you access a pod via IP address ?</summary> Use pod IP:
```
kubectl get pod -o wide
curl http://<pod-ip>:<port>
```
only works within cluster unless exposed via service or port-forward


</details>
<details><summary>11. what is gitworkflow ?</summary> Defines branching model:

Main: Stable

Develop: Latest integration

Feature/: New features

Hotfix/: Emergency fixes

Release/: Pre-release testing

Use pull requests + code review for merging.

Git init --> git add <filename> --> git commit -m "comment" --> git push
</details>
<details><summary>12. what is terraform.tfstate ?</summary> Tracks current state of your infrastructure. Terraform compares this file with the desired configuration to generate a plan. It’s stored locally or remotely (e.g., S3 + DynamoDB for lock).</details>
<details><summary>13. what is terraform validate ?</summary>Checks for syntax correctness and configuration integrity without reaching the cloud provider. Doesn’t check whether resources exist. </details>

and some other questions which i forgot unfortunately.

It was good interview and i felt like i am going to be selected but don't know what happened no, response from the recruiter and when i checked in portal, profile is in archieved state no rejection/selection. 

So, may be rejected ❌
