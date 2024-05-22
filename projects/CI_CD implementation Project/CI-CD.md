### Install below Plugins in Jenkins

1. Eclipse Temurin Installer:
o This plugin enables Jenkins to automatically install and configure the Eclipse
Temurin JDK (formerly known as AdoptOpenJDK). o To install, go to Jenkins dashboard -> Manage Jenkins -> Manage Plugins ->
Available tab. o Search for "Eclipse Temurin Installer" and select it. o Click on the "Install without restart" button. 2. Pipeline Maven Integration:
o This plugin provides Maven support for Jenkins Pipeline. o It allows you to use Maven commands directly within your Jenkins Pipeline
scripts. o To install, follow the same steps as above, but search for "Pipeline Maven
Integration" instead. 3. Config File Provider:
o This plugin allows you to define configuration files (e.g., properties, XML, JSON) centrally in Jenkins. o These configurations can then be referenced and used by your Jenkins jobs. o Install it using the same procedure as mentioned earlier. 4. SonarQube Scanner:
o SonarQube is a code quality and security analysis tool. o This plugin integrates Jenkins with SonarQube by providing a scanner that
analyzes code during builds. o You can install it from the Jenkins plugin manager as described above. 5. Kubernetes CLI:
o This plugin allows Jenkins to interact with Kubernetes clusters using the
Kubernetes command-line tool (kubectl). o It's useful for tasks like deploying applications to Kubernetes from Jenkins
jobs.
o Install it through the plugin manager. 
6. Kubernetes:
o This plugin integrates Jenkins with Kubernetes by allowing Jenkins agents to
run as pods within a Kubernetes cluster. o It provides dynamic scaling and resource optimization capabilities for Jenkins
builds. o Install it from the Jenkins plugin manager. 7. Docker:
o This plugin allows Jenkins to interact with Docker, enabling Docker builds and
integration with Docker registries. o You can use it to build Docker images, run Docker containers, and push/pull
images from Docker registries. o Install it from the plugin manager. 8. Docker Pipeline Step:
o This plugin extends Jenkins Pipeline with steps to build, publish, and run
Docker containers as part of your Pipeline scripts. o It provides a convenient way to manage Docker containers directly from
Jenkins Pipelines. o Install it through the plugin manager like the others. After installing these plugins, you may need to configure them according to your
specific environment and requirements. This typically involves setting up
credentials, configuring paths, and specifying options in Jenkins global
configuration or individual job configurations. Each plugin usually comes with its
own set of documentation to guide you through the configuration process.

### Jenkins Pipeline
Create a new Pipeline job . 
```
pipeline {
agent any
environment {
SCANNER_HOME = tool 'sonar-scanner' }
tools {
jdk 'jdk17' maven 'maven3' }
stages {
stage('Git Checkout') {
steps {
git branch: 'main', credentialsId: 'git-cred', url: 'https://github.com/charan-happy/BoardGame.git' }
}
stage('Compile') {
steps {
sh "mvn compile"
}
}
stage('Test') {
steps {
sh "mvn test"
}
}
stage('Trivy File system scan') {
steps {
sh "trivy fs --format table -o trivy-fs-report.html ."
}
}
stage('SonarQube Analysis') {
steps {
withSonarQubeEnv('sonar') {
sh '''$SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=BoardGame - Dsonar.projectKey=BoardGame \
-Dsonar.java.binaries=. ''' }
}
}
stage('Quality Gate') {
steps {
script {
waitForQualityGate abortPipeline: false, credentialsId: 'sonar-token' }
}
}
stage('Build') {
steps {
sh "mvn package"
}
}
stage('Publish Artifacts to Nexus') {
steps {
withMaven(globalMavenSettingsConfig: 'global-settings', jdk: 'jdk17', maven: 'maven3', mavenSettingsConfig: '', traceability: true) {
sh "mvn deploy"
}
}
}
stage('Build and Tag Docker Image') {
steps {
script {
withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
sh "docker build -t charan63/boardgame:latest ."
}
}
}
}
stage('Docker Image Scan') {
steps {
script {
withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
sh "trivy image --format table -o trivy-image-report.html
charan63/boardgame:latest"
}
}
}
}
stage('Push Docker Image') {
steps {
script {
withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
sh "docker push charan63/boardgame:latest"
}
}
}
}
stage('Deploy to Kubernetes') {
steps {
withKubeConfig(caCertificate: '', clusterName: 'kubernetes', contextName: '', credentialsId: 'k8- cred', namespace: 'webapps', restrictKubeConfigAccess: false, serverUrl: 'https://172.31.8.22:6443') {
sh "kubectl apply -f deployment-service.yaml"
sh "kubectl get pods -n webapps"
}
}
}
}
post {
always {
script {
def jobName = env.JOB_NAME
def buildNumber = env.BUILD_NUMBER
def pipelineStatus = currentBuild.result ?: 'UNKNOWN' def bannerColor = pipelineStatus.toUpperCase() == 'SUCCESS' ? 'green' : 'red' def body = """ <html>
<body>
<div style="border: 4px solid ${bannerColor}; padding: 10px;">
<h2>${jobName} - Build ${buildNumber}</h2>
<div style="background-color: ${bannerColor}; padding: 10px;">
<h3 style="color: white;">Pipeline Status: ${pipelineStatus.toUpperCase()}</h3>
</div>
<p>Check the <a href="${BUILD_URL}">console output</a>.</p>
</div>
</body>
</html>
""" emailext(
subject: "${jobName} - Build ${buildNumber} - ${pipelineStatus.toUpperCase()}",
DevOps Pipeline
SHUBHAM MUKHERJEE
body: body, to: 'svumemories@gmail.com', from: 'jenkins@example.com', replyTo: 'jenkins@example.com', mimeType: 'text/html', attachmentsPattern: 'trivy-image-report.html' )
}
}
}
}

```


