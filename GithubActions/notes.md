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


1. GitHub Actions Overview
What is GitHub Actions
Advantages of GitHub Actions over other CI platforms
Key functionalities of GitHub Actions
Actions components: Events, Triggers, Workflows, Actions
Types of Actions: JavaScript vs Container
Actions Creation: Monolithic vs Chainable
Starter workflows
GitHub Actions Syntax
Governance of GitHub Actions
Debug and Troubleshooting

2. Actions CI, CD & Release
CI Workflows structure
Matrix build
CI Workflows examples: Docker, Web Apps, etc.
CD Workflows structure
CD Workflows examples: Docker, Azure, AWS, Serverless, ECS, Kubernetes, etc.
GitHub Actions Environments overview
Protection Rules and Approvals
Deployment Logs overview
GitHub Actions Environments: creation, management, and usage

3. Self-Hosted Runners
Difference between Hosted runners and Self-hosted runners
Configure Self-hosted runners
Runner Groups and why to use them
Best practices for Self-hosted runners
Dynamically scale Self-hosted runners

4. Secret Management
GitHub Actions Secrets Overview
Type of Secrets: Organization vs Repository vs Environment
Limitation of GitHub Secrets
Secrets: creation, management, and usage
Third party actions for secrets (Azure KeyVault, and more)

5. Advanced GitHub Actions
API availability
Passing Parameters to Actions
Repository Dispatch with custom events
Control the flow of the workflow with Conditionals

Github actions >> workflows >> jobs >> steps

The core component of github actions is a **workflow**. Workflow is an automated process capable of executing one or more task. These workflows are defined in yaml files and are located in .github/workflows directory within our repository.

A repository can have multiple workflows. Each of which runs in response to specific event occuring in your repository.

Each workflow we can define one or more jobs. **A job** consists of a series of individual steps which are executed on a runner. Runner is nothing but a virtual machine. which is reponsible for executing workflows upon triggering.

Github automatically provision runners for each job based on the runs on configuration specified at a job level. 

The virtual Machines created by github are called github hosted runners. All the runners are provisioned and operated parallel

Github hosts all the linux and windows runners on Microsoft Azure and macos on its own cloud.

Even though multiple runners are created or configured for a particular workflow, All runners run parallel, once the assigned job for a particular runner is executed successfully, then it is marked as completed. Only when all the runners completed their individually assigned jobs then only the workflow is considered as completed.

- During or after job execution. We can access logs outputs and any artifacts for each step via github user interface.

- We have two types of **runners**. 1. Github hosted runners and 2. Self-hosted runners

| Github hosted runners  |  Self-hosted runners |
|---|--- |
|Github hosted & Maintained| Run on your infrastructure, such as your servers, virtual machines, or even in the cloud|
|Provides a clean VM for every job execution | can run multiple jobs on same Machine |
|cannot customize runner beyond selecting the type of runner (EX: ubuntu, windows, macos)| You have complete control over the runner's environment and can install any required software |
|Cost is as Part of github subscription with usage limits. Incurs additional charges when exceeding limits | you bear the maintenance and operational cost for your own infrastructure for self-hosted runners |


why CI/CD ?

- To stop Delayed Testing
- To stop Inefficient Deployment
- Quality Assurance Challenges

  ![image](https://github.com/Charan-happy/Learn_Devops_tools/assets/89054489/d7a85331-f0a3-4c50-a3f1-ae1958ed15df)


![image](https://github.com/Charan-happy/Learn_Devops_tools/assets/89054489/8e020fa8-a25a-4a39-a565-9c155c3b19b3)

Continuous Delivery/Deployment :

![image](https://github.com/Charan-happy/Learn_Devops_tools/assets/89054489/e3e75e01-e4c8-4a09-9b56-b8fab237ce55)


**Github Actions - Core Components**

 - It has 3 core components. 1. Workflow 2. Jobs 3. Steps

   Events: A specific activity that triggers a workflow run. For example, activity can originate from GitHub when someone pushes a commit to a repository or when an issue or pull request is created.
   
Workflows: A configurable automated process that you can set up in your repository to build, test, package, release, or deploy any project on GitHub. Workflows are made up of one or more jobs and can be scheduled or activated by an event.

Jobs: A set of steps that execute on the same runner. You can define the dependency rules for how jobs run in a workflow file. Jobs can run at the same time in parallel or run sequentially depending on the status of a previous job. For example, a workflow can have two sequential jobs build and test code, where the test job is dependent on the status of the build job. If the build job fails, the test job will not run.

Step: A step is an individual task that can run commands or actions. A job configures one or more steps. Each step in a job executes on the same runner, allowing the actions in that job to share information using the filesystem.

Action: Individual tasks that you combine as steps to create a job. Actions are the smallest portable building block of a workflow. You can create your own actions, use actions shared from the GitHub community, and customize public actions. To use an action in a workflow, you must include it as a step.

Runner: A runner waits for available jobs. When a runner picks up a job, it runs the job's actions and reports the progress, logs, and final results back to GitHub. Runners run one job at a time.

**Workflow :** 



![image](https://github.com/Charan-happy/Learn_Devops_tools/assets/89054489/0ecc40fc-2c39-4d8b-9d13-082470184521)


![image](https://github.com/Charan-happy/Learn_Devops_tools/assets/89054489/144e2312-955b-4492-a921-dd847eacfdd1)


**Actions:**

- Actions within github workflows are prebuilt, reusable automation components designed for specific tasks and these actions can be created by you or by the members of the community making it easy to share and reuse automation logic.

- 

![image](https://github.com/charan-happy/Learn_Devops_tools/assets/89054489/de200b06-8af9-4e5c-85f8-dd32a521b8e7)



Resources : [Interactive Learning](https://github-actions-hero.vercel.app/)

