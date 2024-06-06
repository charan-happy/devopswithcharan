# **What is GitHub actions ?**
- GitHub actions is a product from **GitHub** that allows you to **automate your workflows**
     - Workflows are stored in yml files
     - Fully integrated with GitHub
     - Responds to GitHub Events
     - Live logs and visualized workflow execution
     - community-powered workflows
     - GitHub hosted or Self-hosted Runners
     - Built-in Secret store

- It is an end-to-end GitHub-centric SDLC process that provides an automation platform and framework.​​​​​​​

![image](https://github.com/charan-happy/DevopsWithCharan/assets/89054489/cdee886b-0312-473c-9bb2-43d09be3b4f2)

  <some images to add related to key components of github actions and github fitment in SDLC process>
  
 In the world of GitHub Actions, "actions" is an overused term. It refers to both:
   - the entire system for executing automated workflows in response to events
   - The actual code and related pieces that implement individual actions.

- **Automation Platform**
GitHub Actions are a way to create and execute automated workflows tied to GitHub events in the context of CI/CD. For example, we change via pull request, and GitHub kicks off a continuous delivery pipeline/workflow. Before GitHub Actions' existence, we would require an additional external tool or process to respond to a notification from GitHub that the pull request happened and then process it. After the pull request and initial notification, that external tool would have implemented the automation.
- With Actions, we now have the means to create this automation within a framework managed by and within GitHub. We can define the what, when, and how for automated responses to events such as pushes or pull requests.

For example, when a push happens in a test branch of the repository, grab the latest code and attempt to build it. If a pull request occurs for a different branch, build and test the code, and if there's a failure, update a GitHub issue. If there is no failure, proceed with putting in a new release.

We can create and store our automation definitions and workflows in the GitHub repository alongside our code. And we can edit them there as well.

- Actions make it easier to automate with/from GitHub because they are a part of GitHub. In addition, they are based on a GitHub-provided framework that adds structure and flow.

# An overview
- At a high level, the workflow involved with the GitHub Actions flow is this :

Some event happens in GitHub Repository. This event is most often associated with a unique SHA (Secure Hashing Algorithm ) 

1. Value and a GIT reference that resolves to SHA1 value (a "ref") such as a branch ref. But it may also be an event in GitHub that is not an update to ref, such as comment in a pull-request or an issue being updated.

A dedicated directory in the repository (repo) is searched for workflow files corresponding to the event. For example, if a workflow is set up to be triggered only when things happen on a particular branch unless the event happened on that branch, that workflow would not be triggered.

Corresponding workflows are identified, and a new workflow run is triggered.

A GitHub Actions workflow is made up of one or more jobs.  Each job can be as simple or as complex as needed.  Once a workflow is kicked off, the jobs begin executing. Jobs, in turn, are made up of steps.  A step calls either a shell command or an actual GitHub action.  Then the action or command in the step is executed on a runner. The runner is a server (virtual or physical) or a container that has been set up to understand how to interact with GitHub Actions.


## Triggering Workflows
- As previously described, events trigger workflows.  They serve as the signal for work to start happening if a GitHub Actions workflow is present and the triggering event matches the start conditions in the workflow. An event can be defined in several different ways.


- A person or a process does some operation in a GitHub repository, which triggers an event.
A matching external trigger happens - i.e., an event from outside of GitHub.
A schedule is set up to run a workflow at particular times or intervals.
A workflow is initiated manually - without an operation having to be done first.
An event triggered by an operation in a GitHub repository is probably the most common we would want to use and expect to see.

![image](https://github.com/charan-happy/DevopsWithCharan/assets/89054489/a22e00b8-a466-44ed-8649-7747290ed9c4)


![image](https://github.com/charan-happy/DevopsWithCharan/assets/89054489/fca18a3b-b5b3-4144-9ce6-8369a75835ab)


A common example is a GitHub pull request (PR). if you or a process initiate a pull request, a corresponding “pull request event” is triggered.

There is also a “push event” for code pushes, etc. In GitHub, there are a large number of common operations you can do. Many of these can, in turn, trigger an event that can be used with GitHub Actions

- In addition to the different ways to trigger events, there are multiple ways to govern when workflows react to events. To explain this, here’s the first piece of workflow syntax to understand - the “on:” clause.  The “on” keyword, and the lines that follow it, define under what conditions the workflow will match events and start executing. Here are some basic types and simple examples of the syntax for each.

The workflow can respond to a single event, such as when a push happens.

```
on: push
The workflow can respond to a list (multiple events)

on: [push, pull_request]
The workflow can respond to event types with qualifiers

on: 
 push:
   branches:
     - main
The workflow can execute on a specific schedule or interval (using standard cron syntax)

on:
  scheduled:
    - cron: `29 5,12 * * *`
The workflow can respond to specific manual events 
on: workflow-dispatch

on: respository-dispatch
The workflow can be called from other workflows (refered as "reuse event")

on: workflow_call
The workflow can respond to webhook events - when the webhook executes and sends a payload 

on: issue_commit

Deciding how you want your workflows to be triggered is one of the first steps to implementing functionality with GitHub Actions
```

## components
- By components, we mean the different pieces that GitHub Actions defines for you to use to build a workflow

## Steps
Steps are the basic unit of execution you deal with when working with GitHub Actions.  They consist of either invocations of a predefined action or a shell command to be run on a system. Any shell commands are executed via a run clause. And any predefined actions are pulled in via a uses clause. The steps keyword indicates the start of a series of steps to be run sequentially.

Example of two basic steps that simply check out a set of code and run a “make” command to build it. Note that steps can have a name associated with them as well.

```
steps:
- uses: actions/checkout@v3
- name: setup Go version
  uses: actions/setup-go@v2
  with:
    go-version: '1.14.0'
- run: go run helloworld.go
```
## Runners
- Runners are the physical or virtual computers or containers where the steps are executed. They can be systems provided by/hosted by GitHub ( and run with their control ) or instance you set up host, and control. In either case, the systems are set up to understand how to interact with GitHub Actions framework, meaning access workflows and predefined actions, execute steps, and report back outcomes.

- Runners are defined simply via the runs-on: clause:
- `runs-on: ubuntu-latest`

💰 Charges for GitHub Actions Runners: Public vs. Private

Here's a breakdown of charges for GitHub Actions runners, both public and private:

Public Repositories:

Standard GitHub-hosted runners: Free
Large GitHub-hosted runners: Charged by the job minute
Self-hosted runners: No charge for the runner itself, but you'll need to manage the infrastructure costs.

Private Repositories:

Standard GitHub-hosted runners: Free for the first 3,000 job minutes per month. Additional minutes are charged by the job minute.
Large GitHub-hosted runners: Charged by the job minute.
Self-hosted runners: No charge for the runner itself, but you'll need to manage the infrastructure costs.
Additional Notes:

Larger runners are charged by the job minute for both public and private repositories.
Self-hosted runners require you to manage the infrastructure costs, which can vary depending on your setup.
You can find more detailed information about pricing on the GitHub website. 

[github Docs on Billing](https://docs.github.com/en/billing/managing-billing-for-github-actions/about-billing-for-github-actions)

- Runners are of 2 types. 1. GitHub-hosted runners and 2. Self-Hosted runners

**1. GitHub Hosted Runners:**
   - These are hosted on Azure specifically and MacOs run on Mac Stadium Apple's own environment.
   - OS: ubuntu, windows or macOS
   - Ephemeral ( Lasting for a short time )
   - 2-core CPU (Mac-os: 3 cores)
   - 7 GB RAM (Mac-os: 14 GB)
   - 14 GB SSD disk space
   - software installed: wget, GH CLI, AWS CLI, Jave ....
```
  name: Super Linter workflow
  on:
    push:

  jobs:
    lint:
       name: Lint Code Base

       runs-on: windows-latest
  ```

**2. Self-Hosted Runners:**
- custom hardware config
- Run on OS not supported on Github-hosted runner
- Reference runner using custom labels
- can be grouped together
- control which organizations/repositories have access to which runner groups
- Do not use with public repositories

  ```
  name: Super Linter workflow
  on:
    push:

  jobs:
    lint:
       name: Lint Code Base

       runs-on: [self-hosted, Linux, ARM64]
  ```
  
## Jobs
Jobs aggregate steps and define which runner to execute them on. An individual job is usually targeted toward accomplishing one particular goal of the overall workflow.

Aside from the definition of the runner, a job in a workflow is like a function or procedure in a programming language.  It comprises a series of commands to run and/or predefined actions to call. This is similar to how a function or procedure in a programming language is made of individual lines of code and/or calls to other functions or procedures.

The outcome of the job is surfaced in GitHub Actions interfaces. Success or failure is displayed at the level of the job, not the individual steps.  It’s helpful to remember this when determining how much work you want any individual job to do. It’s also helpful when considering how much detail you want to know about success or failure within the workflow execution without having to drill down. If you need more granular reports of success or failure displayed at the top level, you may want to put fewer steps in a job.  Or, if you need less granular indications of whether a set of steps succeeded or failed, you might put more steps into a job.

Building on the steps and runners showed Listing 2 shows a simple job to do a build.

```
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
  - uses: actions/checkout@v3
  - name: setup Go version'
    uses: actions/setup-go@v2
    with:
      go-version: '1.14.0'
  - run: go run helloworld.go
```
## Workflow
- Workflows are like software pipelines. They can be initiated when a  triggering event occurs (like continuous integration) and they aggregate one or more jobs to accomplish their overall task. Each job in turn, aggregates one or more steps to do smaller units of work, and the execution of the steps results in success/failure outcome for the job, which feeds back into success/failure for the overall workflow.

- At a high level, it first defines the types of inputs (events) it will respond to and under what conditions it will respond to them.

- Each job declares what kind of system (operating system and version) it will run in. At the lowest level, steps can invoke predefined GitHub Actions or run simple commands on that system.
  ```
  name: simple GO Build

  on:
    push:
      branches:
        - main

  jobs:
    build:
      runs-on: ubuntu-latest
      steps:
         - uses: actions/checkout@v3
         - name: Setup GO version
           uses: actions/setup-go@v2
           with:
              go-version: `1.15.1`
         - run: go run hello-world.go
  ```  
  Note that this workflow is written in YAML format.  Here is what’s happening in this file, line by line:

Line 1. The workflow file is assigned a name

Line 3. This is the on identifier discussed in the section on events.

Lines 4-6. This workflow is triggered when a push operation is done to the branch main in this GitHub repository.

Line 8. This starts the jobs portion of the workflow.

Line 9. There is one job in this workflow, named build.

Line 10. This job will be executed on a standard ubuntu image, hosted by GitHub.

Line 11. This starts the series of steps for this job.

​​​​​​​​​​​​​​Back to GitHub Actions Home

In the world of GitHub Actions, “actions” is an overused term. It refers to both:

The entire system for executing automated workflows in response to events
The actual code and related pieces that implement individual actions
An Overview
At a high level, the workflow involved with the GitHub Actions flow is this:

Some event happens in a GitHub repository. This event is most often associated with a unique SHA1 (Secure Hashing Algorithm 1) value and a Git reference that resolves to a SHA1 value (a “ref”), such as a branch ref. But it may also be an event in GitHub that is not an update to a ref, such as a comment in a pull request or an issue being updated.

A dedicated directory in the repository (repo) is searched for workflow files corresponding to the event. For example, if a workflow is set up to be triggered only when things happen on a particular branch unless the event happened on that branch, that workflow would not be triggered.

Corresponding workflows are identified, and a new workflow run is triggered.

A GitHub Actions workflow is made up of one or more jobs.  Each job can be as simple or as complex as needed.  Once a workflow is kicked off, the jobs begin executing. Jobs, in turn, are made up of steps.  A step calls either a shell command or an actual GitHub action.  Then the action or command in the step is executed on a runner. The runner is a server (virtual or physical) or a container that has been set up to understand how to interact with GitHub Actions.


Relationship of components of GitHub Actions
Triggering Workflows
As previously described, events trigger workflows.  They serve as the signal for work to start happening if a GitHub Actions workflow is present and the triggering event matches the start conditions in the workflow. An event can be defined in several different ways.

A person or a process does some operation in a GitHub repository, which triggers an event.
A matching external trigger happens - i.e., an event from outside of GitHub.
A schedule is set up to run a workflow at particular times or intervals.
A workflow is initiated manually - without an operation having to be done first.
An event triggered by an operation in a GitHub repository is probably the most common we would want to use and expect to see.

A common example is a GitHub pull request (PR). if you or a process initiate a pull request, a corresponding “pull request event” is triggered.

There is also a “push event” for code pushes, etc. In GitHub, there are a large number of common operations you can do. Many of these can, in turn, trigger an event that can be used with GitHub Actions.

In addition to the different ways to trigger events, there are multiple ways to govern when workflows react to events. To explain this, here’s the first piece of workflow syntax to understand - the “on:” clause.  The “on” keyword, and the lines that follow it, define under what conditions the workflow will match events and start executing. Here are some basic types and simple examples of the syntax for each.

The workflow can respond to a single event, such as when a push happens.

on: push
The workflow can respond to a list (multiple events).

on: [push, pull_request]
The workflow can respond to event types with qualifiers.
on:
  push:
    branches:
      - main         
The workflow can execute on a specific schedule or interval (using standard cron syntax).
on:
  scheduled:
    - cron: '30 5,15 * * *'     
The workflow can respond to specific manual events (more about these later).
on: workflow-dispatch

on: repository-dispatch
The workflow can be called from other workflows (referred to as a “reuse event”).
on: workflow_call
The workflow can respond to webhook events - when the webhook executes and sends a payload.  (See here for more details on events and payloads in webhooks.)
on: issue_comment
Deciding how you want your workflows to be triggered is one of the first steps to implementing functionality with GitHub Actions.

To complete the picture, you need to understand more about the other parts that make up a workflow.  

Components
By components, we mean the different pieces that GitHub Actions defines for you to use to build a workflow. 

Steps
Steps are the basic unit of execution you deal with when working with GitHub Actions.  They consist of either invocations of a predefined action or a shell command to be run on a system. Any shell commands are executed via a run clause. And any predefined actions are pulled in via a uses clause. The steps keyword indicates the start of a series of steps to be run sequentially.

Example of two basic steps that simply check out a set of code and run a “make” command to build it. Note that steps can have a name associated with them as well.

steps:
- uses: actions/checkout@v3
- name: setup Go version
  uses: actions/setup-go@v2
  with:
    go-version: '1.14.0'
- run: go run helloworld.go
Runners
Runners are the physical or virtual computers or containers where the steps are executed. They can be systems provided by/hosted by GitHub (and run within their control) or instances you set up, host, and control.  In either case, the systems are set up to understand how to interact with the GitHub Actions framework, meaning access workflows and predefined actions, execute steps, and report back outcomes.

Runners are defined simply via the runs-on: clause:

runs-on: ubuntu-latest
Jobs
Jobs aggregate steps and define which runner to execute them on. An individual job is usually targeted toward accomplishing one particular goal of the overall workflow.

Aside from the definition of the runner, a job in a workflow is like a function or procedure in a programming language.  It comprises a series of commands to run and/or predefined actions to call. This is similar to how a function or procedure in a programming language is made of individual lines of code and/or calls to other functions or procedures.

The outcome of the job is surfaced in GitHub Actions interfaces. Success or failure is displayed at the level of the job, not the individual steps.  It’s helpful to remember this when determining how much work you want any individual job to do. It’s also helpful when considering how much detail you want to know about success or failure within the workflow execution without having to drill down. If you need more granular reports of success or failure displayed at the top level, you may want to put fewer steps in a job.  Or, if you need less granular indications of whether a set of steps succeeded or failed, you might put more steps into a job.

Building on the steps and runners showed Listing 2 shows a simple job to do a build.

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
  - uses: actions/checkout@v3
  - name: setup Go version'
    uses: actions/setup-go@v2
    with:
      go-version: '1.14.0'
  - run: go run helloworld.go


Workflow

A workflow is like a pipeline. At a high level, it first defines the types of inputs (events) it will respond to and under what conditions it will respond to them. This is what we talked about in the earlier section on events.  The response, if the events and conditions match, is to execute then the series of jobs that do the set of actual work items in the workflow. So, it is like a continuous integration process in that it responds to a particular kind of change and kicks off an automated sequence of work.

Listing 3 shows an example of a simple workflow for processing Go programs built on the previous definitions.

1. name: Simple Go Build
2.
3. on:
4.   push:
5.     branches:
6.       - main
7.
8. jobs:
9.   build:
10.    runs-on: ubuntu-latest
11.    steps:
12.      - uses: actions/checkout@v3
13.      - name: Setup Go version
14.        uses: actions/setup-go@v2
15.        with:
16.          go-version: '1.15.1'
17.      - run: go run hello-world.go
Note that this workflow is written in YAML format.  Here is what’s happening in this file, line by line:

Line 1. The workflow file is assigned a name

Line 3. This is the on identifier discussed in the section on events.

Lines 4-6. This workflow is triggered when a push operation is done to the branch main in this GitHub repository.

Line 8. This starts the jobs portion of the workflow.

Line 9. There is one job in this workflow, named build.

Line 10. This job will be executed on a standard ubuntu image, hosted by GitHub.

Line 11. This starts the series of steps for this job.

Line 12. The first step is done via pulling in a predefined action. Note the way this is referenced.  actions/checkout@v3 refers to the relative path after github.com, so this really says it is going to run/use the action defined at github.com/actions/checkout. 

Also notice that this is the only line in this step - no parameters need to be passed to this action because it assumes it is checking out the source from this repository since it is in this repository.

Line 13. The hyphen at the start of this line indicates this is the start of a second step.  This line is giving the new step a name.

Line 14. The step is pulling in another predefined action to setup the Go environment.

Lines 15-16. The setup-go action needs a parameter here - the version of Go to use.  The parameter is passed as an input to the action via a with clause.

Line 17. This is another step that simply runs a command as indicated by the run keyword.  The command is to execute the go run command on an example file in the repository.

To be found, matched to event conditions, and executed automatically, workflow files must be stored in a special directory in a GitHub repository - .github/workflows. So, you would save your workflow specification as a file, such as simple-go-build.yml in the workflow directory of a repository.  (Note the .yml extension denoting YAML structure and syntax.)

#  Workflow syntax
**Basic Syntax**
filename: ./.github/workflows/workflow-file-name.yml

  ```
name: Super linter workflow
on: #events
  push:
jobs: #jobs
  lint:
    name: Lint Code Base
    runs-on: ubuntu-latest
    steps: #steps
      - uses: actions/checkout@v2 #actions

      - uses: github/super-linter@v3
        env:  #secrets
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
  ```

  Events are off 3 types. <br> 1. Webhook Events [pullrequest, issues, push, release ...] <br> 2. Scheduled Events <br> 3. Manual Events

1. Webhook Events
  ```
   name: Super Linter Workflow
   on:
     issues:
       types: [closed, reopened]
  ```

- we can have multiple events and multiple workflows using same event as well.

2. Scheduled Events
   
   Note: only the cron schedule is supported
   - The Minimum interval you should set up is 5 minutes. Reason: we can't complete the job within the queue and schedule within 5 minutes.
  ```
   name: Super Linter Workflow
   on:
     schedule:
        - corn: `30 6 * * 5` # every Friday 06.30 
  ```
   
3. Manual Events
- workflow_dispatch [ It can be triggered via UI ]
- repository_dispatch [ To run a single or multiple workflows within a repository ]

 ```
   name: Super Linter Workflow
   on:
     workflow_dispatch:

  ```

 ## Workflow Execution
 Suppose you push the .github/workflows/simple-go-build.yml file and a corresponding hello-world.go file to a GitHub repository; you can see the workflow run right away.  This is because the event condition set in the workflow (“on a push to main”) would match. So, the workflow would be triggered and executed. 

 - GitHub repositories contain an Actions selection at the top of the project page.  Selecting this puts you into a graphical interface where you can see runs of workflows and jobs and drill into the execution of the various steps if needed/desired. After pushing the workflow file, if you select the Actions tab at the top, you can see the execution of your simple workflow, as shown in the example one in 

 -  Workflow run
You can also drill in and see the execution and status (indicated by the color) of any jobs that execute as part of the workflow.  Figure 3 shows the execution of the job from our simple workflow.


 Run at the job level
Later you’ll see how to use this interface to drill further into what occurs when the various steps are executed and how to debug problems when actions run using the interface.

 ## Actions

 - Reusable units of code that can be referenced in a workflow
 - GitHub runs them in node.js runtime, or in Docker containers
 - Reference in Action, or run scripts directly
 - can be referenced in three ways:
        - public repository
        - The same repository as your workflow (local actions)
        - A published Docker container image on DockerHub

```
name: Super workflow

on:
 push:
 
jobs:
  lint:
    name: Lint Code Base
    
    runs-on: ubuntu-latest
    
    steps:
      - run: echo "Hello World" #script
      #public actions
      - uses: actions/checkout@v2
      
      - uses: github/super-linter@v3
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        
      # local action  
      - uses: ./path/to/action
      # docker image
      - uses: docker://alpine:3.8
```

Quick summary :

- Events trigger workflows, EX: a push to a branch
- workflows contain one or more jobs, which contains one or more steps
- These steps can reference actions or execute commands
- The term "GitHub Actions" include all components, not just the Actions themselves

  ![image](https://github.com/charan-happy/DevopsWithCharan/assets/89054489/359608df-1445-49f5-bf73-06871800a3d8)

# GitHub MarketPlace
- Discover Opensource Actions across multiple domains
- ~9000 Actions ( and counting...)
- Blue color round check marks are Verified, Creators
- Reference these actions directly  in your workflow
- Integrated into GitHub Editor

# Advanced Syntax
|Syntax Element|Description|  
|---|---|
|permissions|Set workflow permissions for GITHUB_TOKEN|
|env| Set environmental variables for all run steps|
|defaults| Set the shell and working directory for the run |  
|concurrency|Manage workflows running concurrently|
|needs|Make jobs dependent on each other. Share outputs|
|if|check whether a job should run based on variables success() always() cancelled() failure() |
|timeout|Limit runtime|  
|continue-on-error|Handle termination of workflow|
|services|Create sidecar docker images for integration dependencies|
|container| Use a container for the execution of the step |

# function Expressions

|syntax element|Description|  
|---|---|
|contains|check if a string is contained in another|
|startWith/endsWith|Check the start/end of a string|
|format|format outputs|  
|join|join arrays into strings|
|toJSON/fromJSON|Make string JSON and JSON strings|
|hashFiles|Create a hash from an input file. Useful for caching|
|always/success/failure/canceled |Workflow statuses. useful for conditional runs|


# Environments and secrete

- controls deployment
- Add gated deployments with approvals
- control secrets
- Review all deployments to an ENV
- Navigate directly to URLs for deployments
- Fully integrated with the checks API (previously called deployment API)
- supports matrix for gated deployments

# GitHub Secret Store
- Built-in secret store
- Encrypted
  - LibSodium sealed box
- use directly from your workflow
- Redacted in workflow logs
- API support
- organization/repository/environment secrets


Types of secrets

- Environment secrets
     - Scoped to a single environment
     - The secret is not accessible by workflow unless the deployment to that environment is approved
- Repository secrets
       - Scoped to a single repository
       - can override org-level secrets
- Organization secrets
      - Managed at org level
      - can be scoped to a specific repositories

- lowest priority always takes the precedence
- 

# using secrets in workflows

- All secrets can be accessed using the same syntax: ${{ secrets.<SECRET_NAME> }}
- Every workflow run provisions a GITHUB_TOKEN secret by default
       - Scoped to a single repository
       - Granular permissions
       - Can't trigger other workflows
- Marketplace Actions exist for integration with other secret stores.

  ```
  name: pull request labeler

  on:
    pull_request:

  jobs:
     triage:
        runs-on: ubuntu-latest

        steps:
          - uses: actions/labeler#v2
            with:
               repo-token: ${{ secrets.GITHUB_TOKEN }}

           - uses: myAction@v1
             with:
                mysecret: ${{ secrets.MY_SECRET }}
  ```

## Managing Workflows & Actions

**Action Policies**
- Configure Action policies on enterprise/organization/repository level
       - which actions are allowed
       - Artifact retension period
       - Running workflows from fork PRs
       - Permissions of GITHUB_TOKEN

## sharing private actions
- Use github packages and ghcr.io to share actions using docker execution and **package registry** permissions

  use a **GitHub App** to clone actions from :
   - Actions in different repositories
   - Actions monorepo
   - Actions separate organization

```
job:
  do-something:
    runs-on: ubuntu-latest
    steps:
      - name: Generate app installation token
        id: app
        uses: peter-murray/workflow-application-token-action@v1
        with:
           application_id: ${{ secrets.APP_ID }}
           application_private_key: ${{ secrets.PRIV_KEY }}

      - name: checkout private repository
        id: checkout_repo
        uses: actions/checkout@v2
        with:
          repository: my-org/repo
          path: path/to/PrivateAction
          token: ${{ steps.app.outputs.token }}
```

## caching

Caching dependencies to speedup workflows

- caching can help with speeding up workflows when you need to install dependencies. NPM, Python, Ruby etc..these are simple examples of applications that require dependencies to be built. But there are more complex scenarios, such as java, c/c++ and modularized microservices that often require downstream artifacts
- Caching can speed up your builds when your dependencies have not changed.

Note: caching is not supported in self-hosted runners 

Optimizing your workflow performance with caching :
 - Temporarily save files between workflow runs
 - 5GB max cache size per repo
 - 7 days retention
 - scoped to key and branch
 - Avoid caching sensitive data
 - Never cache sensitive data

## Best practices on Actions in an organization
- use the **GITHUB_TOKEN** when possible, as a second option GitHub Apps
- **Limit Token Permissions**
- Run only **trusted actions**
- protect your secrets with **environments**
- create **starter workflows** for reusability
- use actions for CI/CD but also ***-ops**

## Building your own actions

**Writing your own Actions**
- 3 types of actions
       - JavaScript
       - Docker
       - Composite run step

- Metadata defined in `action.yml` file
       - inputs
       - outputs
       - Branding
       - Pre-/post-scripts

`./path/to/action/action.yaml`
```
name: "Hello Action"
description: "Greet Someone"
author: "charan-happy@github.com"

inputs:
  MY_NAME:
     description: "who to greet"
     required: true
     default: "world"

outputs:
  GREETING:
    description: "Full greeting"

runs:
  using: "docker"
  image: "Dockerfile"

branding:
  icon: "mic"
  color: "blue"
```

**Best Practices**
- Design for reusability
- write tests
- versioning
- Documentation
- proper action.yaml metadata
- github.com/actions/toolkit
- publish your action to the marketplace

  
## Using GitHub API

**REST API (v3)**
 - libraries available for most languages
 - Octokit

**GraphQL**
  - The future of the GitHub API
  - A query language allowing granular control of request and response

# Migration

**Runners**

|**GitHub Hosted**| **Self-Hosted**|
|---|---|
|Receives automatic updates for the operating system, pre-installed packages and tools and the self-hosted runner application | Receives automatic updates for the self-hosted runner application only. You are responsible updating the os and all other software|
|Are managed and maintained by GitHub|can use cloud service or local machines that you already pay for|
|Provide a clean instance for every job execution|are customizable to your hardware, operating system, software, and security requirements|
|use free minutes on your github plan with per-minute rates applied after surpassing the free minutes| Don't need to have a clean instance for every job execution|
||Are free to use with GitHub Actions but you are responsible for the cost maintaining your runner machines |

**Adding self-hosted runners**
- Configure on enterprise/organization/repository level
- Download and extract the scripts
- configure and authenticate the runners with the token
- start listening for jobs
- For GHES: Blob storage must be provided (Azure Blog storage, Amazon s3, MinIO)

**Runner Groups**
- can be set up on enterprise and/or organization level
- can be scoped to specific organizations and/or repositories
- Runners can be moved between groups
- A runner can only be in one group at a time

**Security with self-hosted runners**
- forked repositories will contain the same Actions configuration as the parent repository, including the self-hosted runners. Creates the potential for a fork to run malicious code on a runner inside your network. For this reason, it is highly recommended to use self-hosted runners only with **private** repositories

Public repositories with self-hosted runners pose potential risks:
- Malicious programs running on the machine
- Escaping the machine's runner sandbox
- Exposing access to the machine's network
- Persisting unwanted or dangerous data on the machine

**Scaling Runners**
- Auto scaling is not yet supported with GitHub-hosted runners
- open-source solutions do exist for scaling self-hosted runners 
EX: `https://github.com/actions-runner-controller/actions-runner-controller` 

`https://github.com/philips-labs/terraform-aws-github-runner`

- see `https://github.com/jonico/awesome-runners` for an open source list of options


## Basic CI Workflows
- Uses a  build matrix across multiple node versions
- Runs on the VM
  - Ubuntu in this case
- Actions are composable
  - checkout is separate
  - setup for most languages in github.com/actions
  - npm run by shell
  - Artifact uploaded successfully

```
name: Node CI

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest

    strategy:
      matrix:
        node-version: [10.x, 12.x]
    
    steps:
      - uses: actions/checkout@v2
      - name: Use Node.js ${{ matrix.node-version }}
        uses: actions/setup-node@v2
        with:
          node-version: ${{ matrix.node-version }}

      - name: Install and test
        run: |
          npm ci
          npm run build --if-present
          npm test

      - uses: actions/upload-artifact@v2
        with:
          name: artifact
          path: dist/
```

**Linting**
- Linting as part of CI runs
- See e.g. the super-linter
  `https://github.com/github/super-linter`
  - supports ~45 different languages
- Easily added as a new step to an existing workflow

```
name: Lint Code Base

on:
 push:
   branches-ignore: [main]
 pull_request:
   branches: [main]

jobs:
  build:
    name: Lint Code Base
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Code
        uses: actions/checkout@v2
        with:
          fetch-depth: 0

      - name: Lint Code Base
        uses: github/super-linter@v4
        env:
          VALIDATE_ALL_CODEBASE: false
          DEFAULT_BRANCH: main
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
**Basic CD workflow**
- starter workflows available for most cloud providers
- store the image in GITHUB
- Jobs run on different envs
    - uses the Docker Image
    - Deploys the container image to Azure

```
Build-Docker-Image:
  runs-on: ubuntu-latest
  needs: build
  name: Build image and store in GitHub Packages
  steps:
    - name: checkout
      uses: actions/checkout@v1

    - name: Download built artifact
      uses: actions/download-artifact@master
      with:
        name: webpack artifacts
        path: public
      
    - name: create image and store in packages
      uses: mattdavis0351/actions/docker-gpr@1.3.0
      with:
        repo-token: ${{secrets.GITHUB_TOKEN}}
        image_name: ${{env.DOCKER_IMAGE_NAME}}

Deploy-to-Azure:
  runs-on: ubuntu-latest
  needs: Build-Docker-Image
  name: Deploy app container to Azure
  steps:
    - name: "Login via Azure CLI"
      uses: azure/login@v1
      with:
        creds: ${{ secrets.AZURE_CREDENTIALS }}

    - uses: azure/docker-login@v1
      with: 
        login-server: ${{env.IMAGE_REGISTRY_URL}}
        username: ${{ github.actor }}
        password: ${{ secrets.GITHUB_TOKEN }}

    - name: Deploy web app container
      uses: azure/webapps-container-deploy@v1
      with:
        app-name: ${{env.AZURE_WEBAPP_NAME}}
        images: ${{env.IMAGE_REGISTRY_URL}}/${{ github.repository }}/${{env.DOCKER_IMAGE_NAME}}:${{ github.sha }}

    - name: Azure logout
      run: |
        az logout
```

