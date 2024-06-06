# How i Got the Interview Call
- I got call from HR and she got my profile from naukri for the role of DevOps Engineer


  within 1 week of call, she scheduled interview for first round of technical discussion, which is for 30 minutes.


Interview data: 04/06/2024 and timing : 5 - 5.30 PM IST

## Interview Questions


<details><summary>1. Tell me about yourself</summary>I am Nagacharan Gudiyatham, a DevOps Engineer with significant experience in automating and managing infrastructure and CI/CD pipelines. I have a strong background in tools like Terraform, Ansible, Docker, and Kubernetes, as well as monitoring and logging solutions like Prometheus, Grafana, and the ELK stack. My goal is to leverage my expertise to enhance operational efficiency and streamline development workflows in a challenging role</details>
   - I gave my intro for ~3 minutes

<details><summary>2. as a followup within my self-intro, he asked me what are the regular issues you face in cicd ?</summary> In my experience, common issues include:

Build Failures: Often due to incorrect dependencies or misconfigurations in the build scripts.
Integration Problems: Incompatible code changes can cause integration issues.
Deployment Failures: Misconfigurations or insufficient resources can lead to deployment failures.
Performance Bottlenecks: Inefficient pipeline configurations or resource limitations can cause slowdowns.
Security Vulnerabilities: Issues identified during security scans need immediate attention</details>
   - I am not able to tell it clearly.
   - i mentioned pipeline broken, docker images we

<details><summary>3. what were the CI/CD tools using ?</summary> I have used Jenkins and GitHub Actions extensively to automate the build, test, and deployment processes.</details>

<details><summary>4. How you check with the logs, what was your process ? where exactly you go to the output of errors ?</summary> My process for checking logs involves:

Accessing the CI/CD tool’s interface.
Navigating to the specific pipeline run and examining the detailed logs.
Identifying error messages and stack traces.
Using integrated logging solutions like the ELK stack or CloudWatch for deeper insights into errors</details>

<details><summary>5. which point you check on jenkins</summary> In Jenkins, I check:

Pipeline Stage Status: To see which stages passed or failed.
Console Output: For detailed logs and error messages.
Build Artifacts: To ensure they are correctly generated.
Environment Variables: To verify the correct configurations are being used</details>

<details><summary>6. How good are you with troubleshooting ? i gave 2/3 out of 5 </summary> I have a methodical approach to troubleshooting, focusing on identifying the root cause and resolving issues efficiently. My experience includes diagnosing build and deployment problems, resolving dependency conflicts, and optimizing performance bottlenecks</details>
- i gave some wrong perspective like seniors not giving much work they are doing themself and give
  
<details><summary>7. which scripting language you good with ?</summary> I am proficient in Shell Scripting and Python, which I use for automating various tasks in CI/CD pipelines</details>

<details><summary>8. Have you written any scripts to automate CICD process ?</summary>Yes, I have written scripts to automate CI/CD processes, such as:

Automating build and deployment pipelines.
Writing Ansible playbooks for configuration management.
Creating Terraform scripts for infrastructure provisioning</details>

<details><summary>9. which exact purpose we are using the scripting ?</summary> Scripting helps in:

Automating repetitive tasks.
Ensuring consistent configurations.
Reducing manual errors.
Enhancing efficiency and speed of deployments</details>
- i am not able to give correct answer

<details><summary>10. can you help me with defining what are all teams/should be involved to make our cicd pipeline greener ?</summary> The teams involved typically include:

Development Team: Writing and maintaining code.
QA Team: Ensuring the quality of releases.
Operations Team: Managing infrastructure and deployments.
Security Team: Ensuring compliance and security.
Product Management: Providing requirements and priorities</details>
    - Developers, devops team and QA team and he expected something else

<details><summary>11. what is meant by greener in above question ?</summary>Greener" indicates having more successful builds and deployments, leading to a stable and reliable CI/CD pipeline</details>

<details><summary>12. what is the role of devops here in these cicd pipeline implementation ?</summary> As a DevOps Engineer, my role involves:

Designing and maintaining CI/CD pipelines.
Automating build, test, and deployment processes.
Ensuring scalable and reliable infrastructure.
Facilitating collaboration between development and operations teams.</details>

<details><summary>13. why only github ? you have infra why not keep source code on server directly ?</summary> GitHub provides:

Version control for tracking changes.
Collaboration features like pull requests and code reviews.
Integration with CI/CD tools.
Enhanced security and access control.</details>

<details><summary>14. How to merge into master branch from feature branch ?</summary>To merge into the master branch:

Ensure the feature branch is up-to-date with master.
Resolve any conflicts.
Open a pull request from the feature branch to master.
Have the pull request reviewed and approved.
Merge the pull request after approval</details>

<details><summary>15. I am a developer and i pull the code and write some random stuff on my branch and raise a merge using git merge is that the process ?</summary>Yes, the standard process involves pulling code, making changes on a feature branch, and raising a merge request (pull request)</details>

<details><summary>16. what is meant by pull request in github ?</summary>A pull request is a method of submitting contributions to a project. It allows others to review and discuss the changes before they are integrated into the main branch</details>

<details><summary>17. what happens if i raise a pull request ?</summary>When a pull request is raised:

The team is notified of the proposed changes.
Automated tests and checks are triggered.
The platform is provided for code review and discussion</details>

<details><summary>18. How the reviewer will review your pull request ? mean to say how he will get to know that he has to accept it or deny it ?</summary>Reviewers are notified of new pull requests via email or a dashboard. They review the code, run tests, and provide feedback. They can either approve the changes or request modifications</details>

<details><summary>19. As a devops engineer how you make reviewer process easier ?</summary>As a DevOps engineer, I can:

Automate tests and checks to ensure code quality.
Provide clear documentation.
Set up templates for pull requests to streamline the review process</details>

<details><summary>20. what is what in dashboard of azure pipeline ?</summary> The Azure Pipeline dashboard displays:

The status of builds and releases.
Pipeline runs.
Job details.
Logs for debugging</details>

<details><summary>21. what is white, green color in azure pipeline ?</summary> White: Indicates that the pipeline has not run or the status is unknown.
Green: Indicates a successful build or deployment.</details>

<details><summary>22. where we can see the logs of the pipeline ?</summary> <br> Pipeline logs can be viewed in the Azure Pipeline dashboard under the specific pipeline run details, where logs for each job and step are accessible for diagnosing issues</details>



### Feedback from the Interviewer: 

- You are good but you should be strong enough with the answers.

Verdict : success and after 2 days said client is not shortlisted


My questions :

<details><summary> can you please write any one of the script that you write in your organization </summary><br>
example of a shell script I wrote for automating the deployment process using Jenkins. This script is used to build a Docker image, push it to a Docker registry, and then deploy it to a Kubernetes cluster.

#### Shell-Script for CI/CD Automation

```shell
#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e  #This ensures the script exits immediately if any command fails.

# Variables - These variables store the necessary information like the Docker image name, tag, registry, Kubernetes namespace, deployment name, and paths.
DOCKER_IMAGE="myapp"
DOCKER_TAG="latest"
DOCKER_REGISTRY="docker.io/myusername"
KUBERNETES_NAMESPACE="myapp-namespace"
DEPLOYMENT_NAME="myapp-deployment"
DOCKERFILE_PATH="."
KUBERNETES_MANIFEST="k8s-deployment.yaml"

# Build Docker image 
echo "Building Docker image..."
docker build -t ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKERFILE_PATH} # This command builds the Docker image using the specified Dockerfile path

# Push Docker image to registry
echo "Pushing Docker image to registry..."
docker push ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${DOCKER_TAG} #This command pushes the built Docker image to the specified Docker registry.


# Update Kubernetes deployment
echo "Updating Kubernetes deployment..."
kubectl set image deployment/${DEPLOYMENT_NAME} ${DOCKER_IMAGE}=${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${DOCKER_TAG} -n ${KUBERNETES_NAMESPACE} #This command updates the Kubernetes deployment to use the new Docker image

# Check deployment status
echo "Checking deployment status..."
kubectl rollout status deployment/${DEPLOYMENT_NAME} -n ${KUBERNETES_NAMESPACE} #This command checks the status of the Kubernetes deployment rollout

echo "Deployment completed successfully."

# Optional: Apply Kubernetes manifest (if changes are required)
# echo "Applying Kubernetes manifest..."
# kubectl apply -f ${KUBERNETES_MANIFEST} -n ${KUBERNETES_NAMESPACE}

echo "Script execution finished." #This prints a message indicating that the script execution is finished.

```

</details>

<details><summary>can you please write any one of the script that you write in your organization in python ?</summary> Here's a Python script that automates the process of checking the status of a Jenkins job, triggering a new build, and monitoring the build progress. This script uses the Jenkins REST API and the requests library in Python

### Python script for jenkins Automation
```python
import requests
import time
import sys

# Jenkins server details 
JENKINS_URL = 'http://jenkins.example.com'
JOB_NAME = 'my-jenkins-job'
JENKINS_USER = 'your_username'
JENKINS_TOKEN = 'your_api_token'

# Function to get the status of the last build
def get_last_build_status():
    url = f"{JENKINS_URL}/job/{JOB_NAME}/lastBuild/api/json"
    response = requests.get(url, auth=(JENKINS_USER, JENKINS_TOKEN))
    
    if response.status_code == 200:
        return response.json()
    else:
        print(f"Failed to get last build status: {response.status_code}")
        sys.exit(1)

# Function to trigger a new build
def trigger_build():
    url = f"{JENKINS_URL}/job/{JOB_NAME}/build"
    response = requests.post(url, auth=(JENKINS_USER, JENKINS_TOKEN))
    
    if response.status_code == 201:
        print("Build triggered successfully.")
    else:
        print(f"Failed to trigger build: {response.status_code}")
        sys.exit(1)

# Function to monitor the build status
def monitor_build():
    while True:
        last_build = get_last_build_status()
        building = last_build.get('building')
        build_number = last_build.get('number')
        result = last_build.get('result')

        if building:
            print(f"Build {build_number} is in progress...")
            time.sleep(10)
        else:
            print(f"Build {build_number} completed with status: {result}")
            if result == 'SUCCESS':
                print("Build completed successfully.")
            else:
                print("Build failed.")
            break

if __name__ == "__main__":
    last_build = get_last_build_status()
    last_build_number = last_build.get('number')
    
    print(f"Last build number: {last_build_number}")
    print(f"Last build status: {last_build.get('result')}")

    user_input = input("Do you want to trigger a new build? (yes/no): ").strip().lower()

    if user_input == 'yes':
        trigger_build()
        monitor_build()
    else:
        print("Build not triggered.")

```
</details>
