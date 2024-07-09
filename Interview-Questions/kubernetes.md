what is the architecture of kubernetes ?
what does control manager, etcd, scheduker, api server do ?
what is a manifest file and what are the components of it ?
what is node affinity, pod affinity and taint tolerance ?
what is node port, cluster IP ?
what is persistent volumes and why we use it ?
describe what is pod and what is pod lifecycle ?
what are components on master and worked node ?
what is ingress controller ?
what are types of services in kubernetes ?
how one pod talks to another pod ?
How the pod healcheck is done (describe readiness, livesness)
How the monitoring is done(Integration on prometheus and grafana)
what is daemon set, replicaset, horizontal pod autoscaler ?
Write a manifest file of your own choice
what is namespace and why we use it ?
- ENTRYPOINT vs CMD in Dockerfile.
- Tell us something about Docker Compose.

## Kubernetes Interview Questions

- If I want to run a specific container in a pod in Kubernetes, how do I run it?
- ENTRYPOINT vs CMD.
- How are the pods communicating with each other?
- What will you do to make your application more secure?
- What is a namespace in Kubernetes?
- What is a pod security policy?
- How will you implement security for a running container if you find a vulnerability?
- What are the various things that can be done to increase Kubernetes security?
- What problems have you faced?
- How often do you release the product?
- What Kubernetes issues have you encountered in production?
- What is the architecture of Kubernetes?
- How is the pod health check done in Kubernetes?
- How do you use Helm charts?
- What is the Blue/Green Deployment Pattern?
- Can you explain the concept of auto-healing in Kubernetes and give examples of how it works?
- What is a label and selector in Kubernetes?
- What is the CrashLoopBackOff state in a pod?
- What is Kubernetes Ingress?
- What are Kubernetes ConfigMaps and Secrets?
- How do microservices work?
- How do you debug your existing container?
- What is a DaemonSet?
- How do you upgrade the database and cluster in Kubernetes?
- How do you design your pods to be highly available?
- What is the Kubernetes version you are using?
- What is the difference between StatefulSets and Deployments in Kubernetes?
- Have you done the backup of etcd?
<details><summary>what are helm charts and uses</summary>Helm is a package manager for Kubernetes that allows you to define, install, and upgrade even the most complex Kubernetes applications. It simplifies Kubernetes management by providing a way to package, share, and deploy applications using charts, which are collections of files that describe a related set of Kubernetes resources.</details>

<details><summary>Your application is experiencing a sudden increase in traffic. How would you ensure that Kubernetes scales the application to handle the load?" </summary>"To handle the sudden increase in traffic, I would ensure that Horizontal Pod Autoscaler (HPA) is configured for the application. HPA automatically scales the number of pods based on observed CPU utilization or other custom metrics. I would also review and adjust the resource requests and limits to ensure that the pods have enough resources to handle the increased load. Additionally, I would monitor the application's performance using tools like Prometheus and Grafana to ensure that the scaling actions are effective."</details>
<details><summary>"A pod in your Kubernetes cluster is stuck in a 'CrashLoopBackOff' state. How would you troubleshoot and resolve this issue?" </summary>"To troubleshoot a pod in a 'CrashLoopBackOff' state, I would start by checking the pod logs using kubectl logs <pod-name> to identify any error messages. If the logs don't provide enough information, I would describe the pod using kubectl describe pod <pod-name> to check for events or reasons for the failure. Common issues might include misconfigured environment variables, insufficient resources, or application-specific errors. Once the issue is identified, I would address it, redeploy the pod, and monitor it to ensure it transitions to a 'Running' state."</details>
<details><summary>"How would you perform a rolling update of a Kubernetes deployment to ensure zero downtime?" </summary> "To perform a rolling update with zero downtime, I would update the deployment manifest with the new container image or configuration changes and apply the changes using kubectl apply -f <deployment-file.yaml>. Kubernetes will gradually replace the old pods with new ones, ensuring that a minimum number of pods are always available to handle traffic. I would monitor the rollout using kubectl rollout status deployment/<deployment-name> and ensure there are no errors during the update process. If an issue arises, I can pause or roll back the deployment to a previous stable state using kubectl rollout undo deployment/<deployment-name>."</details>
<details><summary>"How would you manage persistent storage for stateful applications running in Kubernetes?" </summary>"For stateful applications, I would use PersistentVolume (PV) and PersistentVolumeClaim (PVC) resources to manage persistent storage. I would create a PV to define the storage requirements and a PVC to request the storage for the pods. For stateful sets, I would ensure that each pod has its own persistent storage by configuring volumeClaimTemplates. This setup allows each pod to have its own unique storage, which is crucial for stateful applications like databases. I would also consider using StorageClasses to dynamically provision storage based on the application's needs."</details>
<details><summary>"How would you implement network policies to restrict traffic between namespaces in a Kubernetes cluster?" </summary>"To implement network policies to restrict traffic between namespaces, I would define NetworkPolicy resources. First, I would create a default deny-all policy for the namespace to ensure no traffic is allowed by default. Then, I would create specific network policies to allow only the required traffic between namespaces. For example, I might create a policy to allow traffic from a frontend namespace to a backend namespace on specific ports. I would apply these network policies using kubectl apply -f <network-policy.yaml> and test the connectivity to ensure the policies are working as expected."</details>
<details><summary>"What steps would you take to secure sensitive information stored in Kubernetes Secrets?" </summary>"To secure sensitive information stored in Kubernetes Secrets, I would follow these best practices:
Use Kubernetes Secrets to store sensitive data rather than ConfigMaps.
Ensure that secrets are encrypted at rest by enabling encryption providers.
Use RBAC (Role-Based Access Control) to limit access to secrets to only those users and service accounts that need them.
Avoid hardcoding sensitive information in pod specifications; instead, reference the secrets in environment variables or volume mounts.
Regularly rotate secrets and update deployments to use the new values.
Implement audit logging to monitor access to secrets.
These steps help protect sensitive data from unauthorized access and ensure compliance with security policies."</details>
<details><summary> "How would you perform a Kubernetes cluster upgrade with minimal disruption to running applications?"</summary>"To upgrade a Kubernetes cluster with minimal disruption, I would follow these steps:
Review the release notes and documentation for the new Kubernetes version to understand any breaking changes or prerequisites.
Backup the cluster configuration and critical data.
Upgrade the control plane components (e.g., API server, controller manager, scheduler) by following the cloud provider's or Kubernetes distribution's upgrade process.
Upgrade the node components (e.g., kubelet, kube-proxy) by draining each node, performing the upgrade, and then uncordoning the node. This ensures that pods are rescheduled on other nodes during the upgrade.
Monitor the cluster during and after the upgrade to ensure all components are functioning correctly and applications are running smoothly.
Perform the upgrade in a staging environment first to identify and resolve any issues before applying it to the production cluster."</details>
<details><summary>what is stateful set and when would you use it ? </summary>A StatefulSet is a Kubernetes workload API object used to manage stateful applications. It ensures that the deployment and scaling of a set of Pods maintains a sticky identity for each of them. It is typically used when applications require stable, unique network identifiers, persistent storage, or ordered deployment and scaling, such as databases or other stateful services.</details>
<details><summary> Explain the concept of Persistent Volumes (PV) and Persistent Volume Claims (PVC).</summary> Persistent Volumes (PVs) are a piece of storage in the cluster that has been provisioned by an administrator or dynamically by Kubernetes using Storage Classes. Persistent Volume Claims (PVCs) are requests for storage by a user. PVCs consume PV resources, allowing users to request storage without knowing the details of the underlying infrastructure</details>
<details><summary>How does the Kubernetes scheduler work? </summary> The Kubernetes scheduler assigns Pods to nodes based on several factors, including resource requirements, node availability, and constraints such as affinity and anti-affinity rules. The scheduler looks for a node that fits the Pod's requirements and policies and then binds the Pod to that node.</details>
<details><summary>What is a DaemonSet, and how is it used? </summary>A DaemonSet ensures that a copy of a specific Pod runs on all (or some) nodes in a cluster. It is commonly used for deploying system-level services such as log collection daemons, monitoring agents, or other node-specific services.</details>
<details><summary>Describe the purpose and use of a Kubernetes Ingress. </summary>An Ingress is an API object that manages external access to services within a cluster, typically HTTP. It provides features like load balancing, SSL termination, and name-based virtual hosting. Ingress Controllers implement the Ingress API and are responsible for managing the routing rules defined in Ingress resources.</details>
<details><summary>How do you monitor a Kubernetes cluster? </summary> Monitoring a Kubernetes cluster involves using tools like Prometheus for metrics collection, Grafana for visualization, and other solutions like ELK Stack (Elasticsearch, Logstash, Kibana) for log analysis. Kubernetes also provides built-in metrics and logs that can be accessed through the API server or via tools like kubectl.</details>
<details><summary>Explain the use of configmaps and secrets ?</summary>ConfigMaps are used to store non-confidential configuration data in key-value pairs. Secrets are similar to ConfigMaps but are intended to store sensitive information, such as passwords, OAuth tokens, and SSH keys. Both ConfigMaps and Secrets can be mounted as volumes or exposed as environment variables in Pods.</details>
<details><summary>What are Kubernetes Operators, and how do they work? </summary>Operators are a method of packaging, deploying, and managing a Kubernetes application. They extend the Kubernetes API to create, configure, and manage instances of complex applications on behalf of a Kubernetes user. Operators use Custom Resource Definitions (CRDs) to define the application-specific resources and controllers to handle the lifecycle of these resources.</details>
<details><summary>How do you handle logging in a Kubernetes environment? </summary>Logging in Kubernetes can be handled by aggregating logs from all Pods and Nodes using centralized logging solutions like Fluentd, Elasticsearch, and Kibana (EFK stack) or Fluent Bit and Loki with Grafana. Logs can be collected via sidecar containers, DaemonSets, or node-level logging agents.</details>
<details><summary>What is the purpose of taints and tolerations in Kubernetes? </summary>Taints and tolerations work together to ensure that Pods are not scheduled onto inappropriate nodes. Taints are applied to nodes, and they repel all Pods that do not have a matching toleration. This mechanism allows you to dedicate nodes for specific purposes or to avoid scheduling certain workloads on specific nodes.</details>
<details><summary>How do you secure a Kubernetes cluster? </summary>Securing a Kubernetes cluster involves multiple layers:
Network Security: Use Network Policies to control traffic between Pods.
Authentication and Authorization: Implement RBAC to control access.
Pod Security Policies: Define security context and ensure proper Pod configuration.
Secrets Management: Use Kubernetes Secrets for sensitive data.
ETCD Security: Encrypt data at rest and secure ETCD access.
Image Security: Use trusted registries and scan images for vulnerabilities.
Monitoring and Auditing: Continuously monitor and audit logs and events.</details>
<details><summary>What is a Kubernetes Job, and how does it differ from a Deployment? </summary>A Kubernetes Job creates one or more Pods and ensures that a specified number of them successfully terminate. Jobs are used for tasks that need to be run to completion, such as batch processing. In contrast, a Deployment is used for long-running services and manages the desired number of replicas, ensuring they are available at all times</details>
<details><summary>Explain the concept of Kubernetes Network Policies. </summary>Network Policies are Kubernetes resources that control the network traffic between Pods. They allow you to define rules for inbound and outbound traffic at the IP address or port level, providing fine-grained control over communication within the cluster.</details>
<details><summary>How do you troubleshoot a failing Pod in Kubernetes? </summary>Check Pod Events: Use kubectl describe pod <pod-name> to view events and error messages.
Inspect Logs: Use kubectl logs <pod-name> to see container logs.
Check Resource Usage: Use kubectl top pod <pod-name> to check resource usage.
Review Configuration: Ensure that the Pod and container configurations are correct.
Check Node Status: Verify that the node where the Pod is scheduled is healthy.</details>
<details><summary>How do you handle too much traffic in a Kubernetes cluster, what would you do? </summary>Use Horizontal Pod Autoscaler (HPA) to automatically scale the number of Pods based on CPU utilization or other metrics. Ensure that your cluster has enough nodes and resources to handle the increased load.</details>
<details><summary>what is CNI and how it is used ? </summary>Container Network Interface (CNI) is a specification for configuring network interfaces in Linux containers. In Kubernetes, CNI plugins are used to set up networking for pods, enabling communication between them</details>
<details><summary>Benefits of using container orchestration platforms like Kubernetes.
 </summary>Scalability: Automatically scale applications based on demand.
High Availability: Distribute applications across nodes to ensure uptime.
Resource Efficiency: Optimize resource usage by managing container lifecycles.
Rolling Updates/Rollbacks: Seamlessly update applications with minimal downtime.</details>
<details><summary>Kubernetes Architecture </summary>Kubernetes architecture consists of a control plane (API server, etcd, controller manager, scheduler) and worker nodes (kubelet, kube-proxy, container runtime). The control plane manages the cluster, and the nodes run the containerized applications.</details>
<details><summary>Design Microservices based applications with java </summary>Microservices: Develop independent, loosely coupled services.
Containerization: Use Docker to containerize each microservice.
Orchestration: Deploy using Kubernetes for scalability and fault tolerance.
Service Discovery: Use tools like Consul or Kubernetes service.
API Gateway: Implement API Gateway for routing and security.
CI/CD Pipeline: Automate build, test, and deployment processes.
Monitoring: Implement monitoring and logging with tools like Prometheus and ELK stack.</details>
<details><summary>Migrating a monolithic application to a containerized environment </summary>Analyze Dependencies: Identify and document all dependencies.
Refactor: Break down the monolithic application into smaller microservices if possible.
Dockerize: Create Dockerfiles for each component.
Compose: Use Docker Compose for local development and testing.
Orchestration: Deploy using Kubernetes or Docker Swarm.
Testing: Ensure thorough testing in different environments.
Monitoring and Logging: Set up monitoring and logging for observability.
CI/CD Pipeline: Automate the build, test, and deployment processes</details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
