## Python Automation Project: Automated Deployment Pipeline
Project Overview

Create an automated deployment pipeline using Python and popular DevOps tools. This project will simulate a continuous integration and continuous deployment (CI/CD) pipeline. You’ll use Python to automate tasks such as code testing, building, and deployment. This project will help you demonstrate your ability to integrate Python with DevOps tools and practices.

### Tools and Technologies

Python: For scripting and automation.
Git: Version control system.
Docker: Containerization platform.
Jenkins: Automation server for building CI/CD pipelines.
Flask: Simple web application framework for demonstration purposes.

### Project Steps

Set Up a Simple Flask Application
Create a basic Flask application that returns a “Hello, World!” message. This will be the application you deploy.

```hello-world.py
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
```
Dockerize the Flask Application
Create a Dockerfile to containerize the Flask application.
```dockerfile
FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

CMD ["python", "app.py"]
```
Create a requirements.txt file with Flask as a dependency.

Flask==2.0.1
Set Up a Git Repository
Initialize a Git repository and commit your Flask application and Dockerfile.
```
git init
git add .
git commit -m "Initial commit"
Configure Jenkins for CI/CD
```
Install Jenkins and set it up on your local machine or a server.

Create a new Jenkins job to automate the build and deployment process.
Configure the job to:

Pull the latest code from your Git repository.
Build the Docker image.
Run tests (if any).
Deploy the Docker container.
Automate the Deployment Process

Write a Python script to automate the deployment process. This script can be triggered by Jenkins as part of the pipeline.
```main.py
import subprocess

def build_docker_image():
    subprocess.run(['docker', 'build', '-t', 'flask-app', '.'])

def run_docker_container():
    subprocess.run([
        'docker', 'run', '-d', '-p', '5000:5000', '--name', 'flask-app', 'flask-app'
    ])

if __name__ == '__main__':
    build_docker_image()
    run_docker_container()
```
### Test the Deployment

Push changes to your Git repository.

Trigger the Jenkins job to ensure the pipeline works as expected.
Access the Flask application via http://localhost:5000 to verify deployment.

### Learning Outcomes

Understand the basics of CI/CD pipelines.
Gain experience with Docker and containerization.
Learn how to integrate Python scripts with Jenkins for automation.
Practice using Git for version control.
