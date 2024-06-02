# Jenkins

[CICD End to End Process](#cicd---end-to-end-process)

[pipelines](#pipelines)

## CICD - END to END Process

Once the developers completes his work, he wil raise a PR (pull request). As soon as developers raise the PR, the local build job would be triggered.
Once the build s success. The reviewer or approver merge the code into the central repo by clickin on merge button ( merge button wil not be enabled in PR,
if the local build fails).
As soon as the merge s completed in the central repo, the Jenkins pipeline job wil be triggered. Jenkins pipeline job has 3 stages

1. Build Stage
2. Publish Stage
3. Deliver Stage
Build Stage - we move the respective folder of the micro service, which contains the dockerfile,
we build the respective docker image. Once the docker image s build then the build stage s completed.

Publish Stage - we login into the respective docker registry and push the successful artiffacts
(that s the newly build docker image, which wil be tagged with proper Jenkins build number) to docker registry.

1. First we will tag the image wit proper version.
2. Then push the image to the docker registry.

Deliver Stage - we will do the deployment on the kubernetes usin helm charts.
First we will pull the helm charts from the jfrog artiffactory then wil set the helm values for the environment variables,
then run the helm upgrade command for rollin update, if its first time run helm install.

CONTINUOUS INTEGRATION (CI): The practice of merging all developers working copies to a shared mainline several times a day.

CONTINUOUS DEPLOYMENT (CD): The practice of releasing every change to customers through an automated pipeline.

CI is the process of receiving the code from some version control management system tools like GitHub and packaging it and doing all the necessary tests and finally making it available to go with deployment at the end without any restriction.



In the Continuous Delivery process make sure that you are authenticated and also ensure that your code runs as expected.

why Jenkins?


what are plugins in Jenkins?

- Plugins in Jenkins are components that allow customization of the Jenkins environment to meet specific requirements.
- Plugins are simple software component that lets you integrate various features into existing computers or programs.
    
    ---
    
    Create a Jenkins user as per the details provided below.
    

A. Username: tony

B. Password: T0ny123

C. Full Name: Tony Hawk

---

**solution**






---

Create a List View named mylab-view in Jenkins.

---

## solution :


---

Add Maven installations in Jenkins as per the details mentioned below:

Maven Name: dev_maven

Version: 3.8.4

Installation Type: Automatic

---




and finally, click on apply



---

Install the ThinBackup Jenkins plugin.

---





**** Backup Jenkins (including plugins) under /var/lib/jenkins/jenkins_backup directory using thinBackup plugin. *************************************** create backup directory first







## Pipelines

A Jenkins file is a set of instructions to run a pipeline.

one Jenkins file with multiple stages is called a "Multi-stage Pipeline".

- A Pipeline is a definition of a job that has some stages executed respectively. Each stage has a steps section that includes commands which should be executed respectively to complete that stage. With the pipeline, we define how Jenkins should complete the CI/CD process for our applications. So to speak, the pipeline runs all processes that were run formerly by human hands.

## scripted vs declarative
- Jenkins supports two types of pipeline definition. 1- Scripted pipelines which are written in Groovy language. 2- Declarative pipelines which are written in Jenkins DSL language. We intend to talk about the Jenkins DSL language which is more readable and easy to learn. Furthermore, within this DSL language, we can write Groovy scripts too.

## Jenkins pipeline syntax Introduction

- Here is the basic pipeline syntax example :

```

```




Create a pipeline job named hello-world, it should just echo the Hello World string.

You can name the stage as per your choice.

---



*************************** Build Agents are the systems that run your entire workload. In short, Build Agents are task executors.