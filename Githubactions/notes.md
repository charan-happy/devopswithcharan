Contents :

**Github actions :** 

- It is powerful and flexible automation platform provided by the github.
-  It allows developers to automate tasks directly from their repositoritories.
-   you can quickly create workflows to implement a ci_cd pipeline that build test on evey pull request and deploy merged pull request to the production right beside your codebase out of box.
-   These steps can be implemented on different os like windows, mac and linux

Advantages of Github actions :

- streamline Development
- Reduce manual Errors
- Increase efficiency of your software development workflow
- To automate all kinds of repository actions by listening to events such as push event issues, PRs, github registry package events, and other trigger points such as applying labels, assign contributors, and even add reviewers etc.

Github actions >> workflows >> jobs >> steps

The core component of github actions is a **workflow**. Workflow is an automated process capable of executing one or more task. These workflows are defined in yaml files and are located in .github/workflows directory within our repository.

A repository can have multiple workflows. Each of which runs in response to specific event occuring in your repository.

Each workflow we can define one or more jobs. **A job** consists of a series of individual steps which are executed on a runner. Runner is nothing but a virtual machine. which is reponsible for executing workflows upon triggering.

Github automatically provision runners for each job based on the runs on configuration specified at a job level. 

The virtual Machines created by github are called github hosted runners. All the runners are provisioned and operated parallel

Github hosts all the linux and 


