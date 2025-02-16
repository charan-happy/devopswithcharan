Practice GitHub Actions with the project below:

1) Create a GitHub Repo

2) Create a GitHub Actions Workflow
      • Inside your repo, create the directory .github/workflows/.
      • Add a new file: .github/workflows/docker-ci.yml.

3) Define Workflow Triggers
      • Trigger the workflow on push to main branch.
      • Allow manual triggers using workflow_dispatch.

4) Checkout the Repo
      • Use the actions/checkout@v4 action to fetch your latest code.

5) Set Up Docker Build Environment
      • Use ubuntu-latest as the runner.
      • Install dependencies like Docker

6) Log in to Docker Hub
      • Use docker/login-action with DOCKER_USERNAME and DOCKER_PASSWORD (stored in GitHub Secrets).

7) Build & Tag Docker Image
      • Use docker build and tag the image with latest and commit SHA.

8) Push Image to Docker Hub
      • Use docker push to upload the built image.

9) Notify Team on Success/Failure
      • Send Slack notifications with deployment status.

Bonus: 
1) Add vulnerability scanning (trivy)
2) test reports
3) rollback strategies
4) build validation on pull request
