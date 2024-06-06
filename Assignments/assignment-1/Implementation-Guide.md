# CI/CD Pipeline Setup with Jenkins

This guide will walk you through setting up a CI/CD pipeline using Jenkins for a simple web application. We'll use a basic Node.js application as our sample project. The pipeline will include stages for building, testing, and deploying the application using Docker.

## Prerequisites

Jenkins installed on your local machine or server
A GitHub account and repository for your project
Docker installed on your Jenkins server

### Step 1: Setup
Create a Simple Node.js Application

Initialize a Node.js project:

mkdir simple-node-app
cd simple-node-app
npm init -y
Install Express.js:
npm install express

Create an app.js file with the following content:
```app.js
const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);
});
```
Add Unit Tests

Install Mocha and Chai:

`npm install --save-dev mocha chai`

Create a test folder and add a test.js file with the following content:
```test.js
const chai = require('chai');
const chaiHttp = require('chai-http');
const app = require('../app'); // Adjust path if necessary

const should = chai.should();
chai.use(chaiHttp);

describe('GET /', () => {
  it('should return Hello World', (done) => {
    chai.request(app)
      .get('/')
      .end((err, res) => {
        res.should.have.status(200);
        res.text.should.equal('Hello World!');
        done();
      });
  });
});
```
Dockerize the Application

Create a Dockerfile with the following content:
Dockerfile
```Dockerfile
FROM node:14
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["node", "app.js"]
```
Push Code to GitHub

Initialize a Git repository, commit your code, and push to GitHub:

git init
git add .
git commit -m "Initial commit"
git remote add origin <your-repo-url>
git push -u origin master

### Step 2: Pipeline Stages

Jenkins Installation and Configuration

Install Jenkins (refer to the official Jenkins installation guide for your OS).
Install required plugins: Docker Pipeline, GitHub, NodeJS.
Create a Jenkins Pipeline Job

Open Jenkins and create a new pipeline job.
In the pipeline configuration, point it to your GitHub repository.
Jenkinsfile Definition

Create a Jenkinsfile in the root of your project with the following content:
```Jenkinsfile
pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'simple-node-app'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/your-repo-url'
            }
        }
        
        stage('Build') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }
        
        stage('Test') {
            steps {
                script {
                    docker.image(DOCKER_IMAGE).inside {
                        sh 'npm install'
                        sh 'npm test'
                    }
                }
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    docker.image(DOCKER_IMAGE).inside {
                        sh 'docker run -d -p 3000:3000 $DOCKER_IMAGE'
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
```
### Step 3: Documentation
Pipeline Stages

Checkout: Clones the repository from GitHub.
Build: Builds the Docker image for the application.
Test: Runs the unit tests inside the Docker container.
Deploy: Deploys the Docker container to a staging environment.

Setup Process

Install Jenkins and necessary plugins.
Create a pipeline job in Jenkins and configure the GitHub repository.
Define the pipeline stages in the Jenkinsfile.
Step 4: Screenshots and Logs
Successful Pipeline Execution

Screenshot of the Jenkins job configuration.
Logs showing successful checkout, build, test, and deploy stages.
Screenshot of the running application accessed via http://localhost:3000.
This setup will automate the CI/CD process for your Node.js application, ensuring continuous integration and deployment.
