# **What is GitHub actions ?**
- GitHub actions is a product from **GitHub** that allows you to **automate your workflows**
     - Workflows are stored in yml files
     - Fully integrated with GitHub
     - Responds to GitHub Events
     - Live logs and visualized workflow execution
     - community-powered workflows
     - GitHub hosted or Self-hosted Runners
     - Built-in Secret store

  <some images to add related to key components of github actions and github fitment in SDLC process>
  
 In the world of GitHub Actions, "actions" is an overused term. It refers to both:
   - the entire system for executing automated workflows in response to events
   - The actual code and related pieces that implement individual actions.

# An overview
- At a high level, the workflow involved with the GitHub Actions flow is this :

## Triggering Workflows

## components
- By components, we mean the different pieces that GitHub Actions defines for you to use to build a workflow

## Steps

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

## Workflow
- Workflows are like software pipelines. They can be initiated when a  triggering event occurs (like continuous integration) and they aggregate one or more jobs to accomplish their overall task. Each job in turn, aggregates one or more steps to do smaller units of work, and the execution of the steps results in success/failure outcome for the job, which feeds back into success/failure for the overall workflow.

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
