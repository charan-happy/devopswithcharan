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

## Triggering Workflows

## components

## Steps

## Runners
- Runners are the physical or virtual computers or containers where the steps are executed. They can be systems provided by/hosted by GitHub ( and run with their control ) or instance you set up host, and control. In either case, the systems are set up to understand how to interact with GitHub Actions framework, meaning access workflows and predefined actions, execute steps, and report back outcomes.

- Runners are defined simply via the runs-on: clause:
- `runs-on: ubuntu-latest`
- 1.11.48

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

 
