# Container Orchestration with Kubernetes

This guide will help you deploy and manage a containerized application using Kubernetes. We will set up a Kubernetes cluster using Minikube, deploy a multi-container application (a web server and a database), and ensure the application is scalable.

### Prerequisites

Install Minikube
Install kubectl

### Step 1: Setup Kubernetes Cluster

Start Minikube

Start Minikube with the following command:


`minikube start`

Enable Kubernetes Dashboard

Enable the Kubernetes dashboard:

`minikube dashboard`

### Step 2: Application Deployment

Create Kubernetes Manifests

Create a directory for your Kubernetes manifests:


mkdir k8s-manifests
cd k8s-manifests
Deployment Manifest for Web Server and Database

Create a deployment.yaml file for the web server (using Nginx) and the database (using MySQL).

```deployment.yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web-server
spec:
  replicas: 2
  selector:
    matchLabels:
      app: web
  template:
    metadata:
      labels:
        app: web
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80

---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mysql
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mysql
  template:
    metadata:
      labels:
        app: mysql
    spec:
      containers:
      - name: mysql
        image: mysql:5.7
        env:
        - name: MYSQL_ROOT_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mysql-secret
              key: mysql-root-password
        - name: MYSQL_DATABASE
          value: mydatabase
        ports:
        - containerPort: 3306
```
Service Manifests

Create a service.yaml file to expose the web server and MySQL database.

```service.yml
apiVersion: v1
kind: Service
metadata:
  name: web-service
spec:
  selector:
    app: web
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: NodePort

---
apiVersion: v1
kind: Service
metadata:
  name: mysql-service
spec:
  selector:
    app: mysql
  ports:
    - protocol: TCP
      port: 3306
      targetPort: 3306
```
ConfigMap and Secret

Create a configmap.yaml file for configuration data and a secret.yaml file for sensitive data.


# configmap.yaml
```configmap.yml
apiVersion: v1
kind: ConfigMap
metadata:
  name: web-config
data:
  welcome-message: "Hello, Kubernetes!"

---
# secret.yaml
apiVersion: v1
kind: Secret
metadata:
  name: mysql-secret
type: Opaque
data:
  mysql-root-password: cGFzc3dvcmQ=  # base64 encoded value of 'password'
```
Apply the Manifests

Apply the Kubernetes manifests to deploy the application.

```
kubectl apply -f configmap.yaml
kubectl apply -f secret.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```
### Step 3: Scaling the Application

Auto-Scaling Configuration

Create an autoscale.yaml file to configure auto-scaling for the web server.

```autoscale.yml
apiVersion: autoscaling/v1
kind: HorizontalPodAutoscaler
metadata:
  name: web-server-autoscaler
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: web-server
  minReplicas: 2
  maxReplicas: 10
  targetCPUUtilizationPercentage: 50
```
Apply the Auto-Scaling Configuration

Apply the auto-scaling configuration.


kubectl apply -f autoscale.yaml

### Step 4: Documentation

Deployment Process

Start Minikube: minikube start
Enable Dashboard: minikube dashboard

Apply Manifests:

kubectl apply -f configmap.yaml
kubectl apply -f secret.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
Apply Auto-Scaling: kubectl apply -f autoscale.yaml
Scaling the Application

The Horizontal Pod Autoscaler will automatically adjust the number of pods based on CPU utilization. You can manually scale the application using the following command:


kubectl scale deployment web-server --replicas=3

### Step 5: Screenshots

Running Application

Open the Kubernetes dashboard: minikube dashboard
Include screenshots showing the running deployments and services.
Kubernetes Dashboard

Include a screenshot of the Kubernetes dashboard showing the web server and MySQL deployments.

By following this guide, you will have a fully functional Kubernetes setup for deploying and managing a multi-container application with auto-scaling capabilities.
