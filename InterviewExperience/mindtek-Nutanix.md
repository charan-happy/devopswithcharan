Nutanix Interview:

interview date : 6/3/2025 duration: 1 hour time :4-5pm

<details open><summary>1. Tell me about yourself</summary>I’m a DevOps Engineer with 4 years of hands-on experience in automating infrastructure, managing CI/CD pipelines, container orchestration with Kubernetes, and cloud deployments on both AWS and Azure. I’ve worked extensively with tools like Terraform, Ansible, GitHub Actions, Jenkins, Docker, and Prometheus-Grafana for monitoring. My focus has been on reducing manual efforts, improving system reliability, and enabling faster deployments. I recently led a project that reduced deployment time by 30% using GitOps and improved infrastructure availability to 99.9% through auto-healing strategies and cost-optimized architectures.</details>

<details><summary>2. What do you meant by version controlling and give some usecase for it</summary> -- Version control is a system that helps track changes to code or configuration files over time. Git is the most widely used version control system.

Use Cases:

Collaborating across teams (multiple developers working on the same codebase)

Rollback to previous stable versions if something breaks

Code review through Pull Requests

CI/CD pipelines trigger on Git events (like push, PR)</details> 

<details><summary>3. what is containerization and how is it helpful for a software industry</summary>Containerization is the process of packaging an application with all its dependencies into a lightweight container. Docker is the most common container tool.

Benefits:

Portability across environments (dev → staging → prod)

Faster deployments and rollback

Efficient resource utilization

Consistent environments for developers and production</details>

<details><summary>4. what is the complete process of containerization from building, containers</summary>Write Dockerfile — Define dependencies, base image, and entrypoint

Build — Use docker build to create an image

Push to registry — Docker Hub or private registry

Deploy — Run containers using Docker CLI, Compose, or Kubernetes</details>

<details><summary>5. do we need any special operating system for containers ?</summary>No. Containers can run on any OS that supports a container runtime (like Docker). But they share the host OS kernel, so Linux-based containers need a Linux kernel. On Windows, Linux containers run inside a Linux VM using Docker Desktop or WSL2.</details

<details><summary>6. what is CI/CD and walk me through the process of it usecase</summary>
CI/CD = Continuous Integration + Continuous Deployment/Delivery

Flow:

Developer pushes code to Git

CI pipeline triggers:

Lint, build, test

Security scan (SonarQube, Trivy)

Create Docker image

CD pipeline:

Push image to registry

Deploy to dev/staging/prod via Helm or K8s manifests

Use Case: Automating end-to-end deployment of a Node.js app from GitHub to an EKS cluster.</details>

<details><summary>7. If we have given a string "aabbbcccc". find the letter which is having maximum frequency</summary>
from collections import Counter
s = "aabbbcccc"
print(Counter(s).most_common(1)[0][0])
# Output: 'c'

</details>

<details><summary>8. write a simple python script which can read the file and print the data inside the file</summary>file_path = "example.txt"
with open(file_path, 'r') as file:
    print(file.read())
</details>

<details><summary>9. write a shell script where it should count all the files in a particular directory which user has given to you and another case u should ask user to give it</summary>#!/bin/bash
read -p "Enter directory path: " dir
if [ -d "$dir" ]; then
  count=$(find "$dir" -type f | wc -l)
  echo "Total files: $count"
else
  echo "Directory not found!"
fi
</details>


<details><summary>10. show me the command which will show the count of files ending with.log</summary>find . -type f -name "*.log" | wc -l
</details>


<details><summary>11. Create multiple files fl....f10 with .txt extension</summary>for i in {1..10}; do touch "f$i.txt"; done
</details>


<details><summary>12. create multiple files with a to f with.log extension</summary>for i in {a..f}; do touch "$i.log"; done
</details>

<details><summary>13. if we do 1s 1 having 14 files but inside having only 13 files why ?</summary>Check for:

Hidden files (.file)

Symbolic links

. and .. entries
Use: ls -la to inspect</details>

very good interviewer. very positive cooperative towards candidates. hello provides constructive criticism.
