Problem Statement 1:
Title: Containerisation and Deployment of Wisecow Application on Kubernetes
Project Repository: https://github.com/nyrahul/wisecow Wisecow App
Objective: To containerize and deploy the Wisecow application, hosted in the
above-mentioned GitHub repository, on a Kubernetes environment with secure TLS
communication.
Requirements:
Dockerization:
● Develop a Dockerfile for creating a container image of the Wisecow
application.
Kubernetes Deployment:
● Craft Kubernetes manifest files for deploying the Wisecow application
in a Kubernetes environment.
● The Wisecow app must be exposed as a Kubernetes service for
accessibility.
Continuous Integration and Deployment (CI/CD):
● Implement a GitHub Actions workflow for:
● Automating the build and push of the Docker image to a
container registry whenever changes are committed to the
repository.
● Continuous Deployment [Challenge Goal]: Automatically
deploy the updated application to the Kubernetes environment
following successful image builds.
TLS Implementation [Challenge Goal]:
● Ensure that the Wisecow application supports secure TLS
communication.
Expected Artifacts:
● A private GitHub repository containing:
● The Wisecow application source code.
● The Dockerfile for the application.
● Kubernetes manifest files for deployment.
● The CI/CD pipeline configuration.
● A GitHub Actions workflow file for facilitating Continuous Build
and Deployment (CI/CD)
Access Control:
● The GitHub repository should be set to public.
End Goal: The successful containerisation and deployment of the Wisecow
application to the Kubernetes environment with an automated CI/CD pipeline and
secured with TLS communication.