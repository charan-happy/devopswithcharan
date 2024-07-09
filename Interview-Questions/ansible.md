<details>
<summary>what is ansible architecture</summary></details>

<details><summary>
  How a normal yaml file is different from ansible playbook
</summary></details>
<details><summary>
  what is ansible playbook, define all terms in playbook
</summary></details>
<details><summary>
  what is handlers and notifiers
</summary></details>
<details><summary>
  what are registeries
</summary></details>
<details><summary>
  what are various modules you have used in ansible
</summary></details>
<details><summary>
  how to used when condition and loops in ansible
</summary></details>
<details><summary>
  write a playbook to start a service, stop a service, and check the health check of service
</summary></details>
<details><summary>
  what are ansible adhoc commands
</summary></details>
<details><summary>
  what are roles and tell where you will keep the different files in different folders
</summary></details>
<details><summary>
  what is ansible vault and how you store the secret files
</summary></details>
<details><summary>
  how the ssh connectivity takes place between two server in ansible
</summary></details>
<details><summary>
what is ansible ?  
</summary></details>
<details><summary>
  


  

  

<details><summary>How have you used Ansible for automation in your previous projects?
 </summary>"I have used Ansible extensively for configuration management and automation. In one project, I automated the deployment of a web application across multiple environments, ensuring consistency and reducing manual errors. I wrote playbooks to configure servers, deploy applications, and manage updates. Additionally, I integrated Ansible with Jenkins for CI/CD pipelines, allowing for automated testing and deployment. This approach significantly reduced deployment times and improved reliability.</details>
 <details><summary> How do you integerate ansible with other devops tools like github, bamboo,jenkins</summary>"I have integrated Ansible with various DevOps tools to create automated CI/CD pipelines. For example, in a recent project, I used GitHub for source code management and Jenkins for continuous integration. I configured Jenkins to trigger Ansible playbooks stored in GitHub whenever there was a change in the repository. This setup allowed us to automate the deployment process, including code testing, infrastructure provisioning, and application deployment. Additionally, I have used Bamboo for similar purposes, creating build and deployment plans that leverage Ansible for configuration management." </details>
<details><summary> How do you eliminate one or two servers from inventory while running the play?</summary> Use Ansible ad-hoc commands with --limit to exclude specific hosts. For example, ansible-playbook playbook.yml --limit '!db_host' would run the playbook on all hosts except db_host </details>
# Join Devops
* What is ansible playbook?
* What are handlers in Ansible playbook?
* What are tags in Ansible?
* What are various modules you have used in Ansible?
* What is Ansible ad hoc command?
* How is Ansible used your organization?
* Ansible host ping is success but I am not able to execute playbooks why? 
* Have you ever used vault? how it works?
* What is ansible role?