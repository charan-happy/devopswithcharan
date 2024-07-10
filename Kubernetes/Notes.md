

![Kubernetes in a nutshell](image-2.png)

Content

[kubernetes Introduction]()
- Monolithic vs Microservices Architecture
- Features of Kubernetes
- Alternatives of K8s
- Docker swarm vs K8s
- Master-slave/ client-server architecture in kubernetes

[Kubernetes Architecture - Master Node]()
- API Server
- ETCD
- Controller Manager
- Scheduler
- Example

[Kubernetes Architecture - Worker node]()
- kubelet
- kube-proxy
- pods
- container engine
- Example

[Setting up minikube locally]()
- Pre-requisites
- HandsOn
- Creating your first pod
- Deploying the pod

[Kubeconfig, services deployment files]()
- kubeconfig files
- service files
- deployment files

[Deploying Nodejs application on kubernetes cluster]()

[kubernetes labels, selectors, and node selectors]()
- Labels
- Labels-selectors
- Node Selector

[ReplicationController & Replicaset]()
- ReplicationController
- ReplicaSet

[Deployment Object in Kubernetes]()
- use cases for deployment object

[Kubernetes cluster (master+workernode) using kubeadm on AWS]()
- Replication Controller
- Replicaset

[Kubernetes Networking (services)]()
- clusterIP
- Loadbalancer
- Nodeport
- ExternalName

[Kubernetes Advanced Networking(CNI and Calico)]()
- Alternatives of Calico CNI
- Key concepts and Real-time

[Kubernetes volumes and livenessprobes]()
- EmptyDir
- hostpath
- Persistent Volume
- persistent Volume claim (pvc)
- Liveness Probe (healthcheck)

[Kubenetes Configmaps & secrets]()
- configMaps
- CM from file
- CM from env file
- CM from yaml file
- secrets
- creating secrets from literal
- Secrets from file
- secrets from the env file
- CM from the yaml file

[Kubernetes jobs]()
- use cases
- Key-features

[Kubernetes INITcontainer]()
- Use cases

[Kubernetes pod lifecycle]()
- types of pod state

[Kubernetes namespace]()
- when we should consider kubernetes namespaces ?

[kubernetes ResourceQuota]()
- Limit & Request

[Kubernetes Autoscaling]()
- Types of autoscaling
- keyfeatures of Horizontal pod autoscalar

[Multi-cluster kubernetes with HAProxy]()
- HAproxy

[Kubernetes Ingress]()
- Path-based Routing
- Host-based Routing

[Kubernetes Statefulsets]()
- stateful vs stateless applications
- statefulsets vs deployment
- keyfeatures of statefulsets

[Kubernetes Daemonset]()
- Daemonset key features
- usecases

[Kubernetes network policies]()
- Network Policy
- Key Features
- use cases of network policy

[Kubernetes Operators]()
- what are operators
- Key features of operators: 1. Custom resource definition 2. custom controller 3. custom resource

[HELM & Helm charts]()
- helm 
- helm Deployment

[helm Project]()
- Deploy flask application using helm chart and other features

[AWS Elastic Kubernetes Services EKS]()
- what is AWS EKS
- Key features
- AWS EKS Costing

[Azure Kubernetes Service (AKS)]()
- What is AKS
- key features
- Azure AKS Costing

[Google Kubernetes Engine (GKE)]()
- What is GKE
- Key features

[End-To-End Devsecops Kubernetes Project]()
- Tools
- Github
- AWS (cloud)
- Jenkins
- prometheus, Node exporter, Grafana, Trivy, Sonarqube, OWASP, Kubernetes

## kubernetes Introduction
### what is Kubernetes ?

- Kubernetes also known as “K8s”, is an open-source container orchestration platform developed by google.
- It is designed to automate the deployment, scaling, and management of containerized applications across a cluster of nodes.
- Kubernetes provides a consistent and reliable way to manage applications, regardless of whether they are running on-premises, in the cloud or in the hybrid environments.

**Monolithic Architecture VS Microservices - Key differences**
- Monolithic architecture is like a single kitchen handling all tasks, while microservices
architecture is like multiple specialized restaurants working together.
- Monoliths are typically easier to set up and manage initially, while microservices offer
more flexibility and scalability.
- Monoliths can have a single point of failure, while microservices are more fault-tolerant
because a failure in one microservice doesn’t necessarily affect the others

********what is Microservices ?********

- Microservices are a software architecture pattern that structures applications as a collection of small, independently deployable services.
- Each microservice is designed to perform a specific function or business capability and communicates with other services over well-defined APIs or protocols.

why we need kubernetes and what it can do ?

1. simplify container management
2. Enhance resilencey
3. Simplify application deployment
4. Improve scalability
5. Increase automation
6. provide flexibility

Features of Kubernetes :
- Autoscaling
- Autohealing
- LoadBalancing
- Platform Independent
- Fault Tolerance
- Rollback
- Health Monitoring of containers
- Orchestration

Alternatives of Kubernetes:
- Docker Swarm
- Apache Mesos
- Openshift
- Nomad

Differences between Docker Swarm and Kubernetes 

Docker Swarm vs Kubernetes 

|context |Docker Swarm| Kubernetes| 
|---|---|---|
|Install and Configurations|quick easy and fast| complicated and time consuming|
|supports|only work with docker containers|can work with any other containers such as docker, containerd , etc|
|Data Volumes|can be shared with any other containers|can be shared to the same pod's containers|
|GUI|Not supported|Supported|
|Autoscaling|Not supported|Supported|




## Kubernetes Architecture - Master Node


**************************************************Kubernetes Architecture :**************************************************

![architecture image](image.png)

A cluster contains master node and worker nodes.

Master node/control plane is the brain of the cluster.

- A master can be a VM/EC2 instance/virtual box/physical machine/on-premises
- It contains 4 components
    - API Server
    - Controller Manager
    - Scheduler
    - ETCD

******API Server :******

- The API server is a component of the kubernetes control plane that exposes the kubernetes API. The API server is the front end for the kubernetes control plane.

********************Scheduler :********************

- Control plane component that watches for newly created pods with no assigned node and selects a node for them to run on.

****************************************Controller Manager :****************************************

- Control Plane component that runs controller processes

********************************ETCD Database :******************************** 

- consistent and highly available key value store used as kubernetes backing  store for all cluster data.

## Kubernetes Architecture - Worker node
**Worker Node Component**
![workernode components](image-1.png)

******************************kubelet :****************************** 

- An agent that runs on each node in the cluster. It make sure that containers are running in a pod.
- the Kubelet takes a set of PodSpecs that are provided through various mechanisms and ensures that the containers described in those podspecs are running and healthy. The kubelet doesn’t manage containers which were not created by Kubernetes.

**************************Kube-proxy :**************************  

- kube proxy is a network proxy that runs on each node in cluster, implementing part of the kubernetes service concept.
- Kubeproxy maintains network rules on nodes. These network rules allow network communication to your pods from network sessions inside or outside of your cluster.

container platform : 

******************************************workload components :******************************************

pods

Deployments

Services


Ingress

ConfigMaps

- A Kubernetes ConfigMap is an API object that allows you to store data as key-value pairs. Kubernetes pods can use ConfigMaps as configuration files, environment variables or command-line arguments.

ConfigMaps allow you to decouple environment-specific configurations from containers to make applications portable. However, they are not suitable for confidential data storage. ConfigMaps are not encrypted in any way, and all data they contain is visible to anyone who can access the file. You can use Kubernetes secrets to store sensitive information.

Another potential drawback of ConfigMaps is that files must be limited to 1MB. Larger datasets may require different storage methods, such as separate file mounts, file services or databases.

Creating a ConfigMap
To create a new ConfigMap, use this kubectl command:

kubectl create configmap <name> <data-source>

The <name> is the name of the ConfigMap, which should be valid for use as a DNS subdomain. The <data-source> indicates the files or values from which ConfigMap data should be obtained.

You can create ConfigMaps based on one file, several files, directories, or env-files (lists of environment variables). The basename of each file is used as the key, and the contents of the file becomes the value.

ConfigMap Data Source	Example kubectl command
Single file	kubectl create configmap app-settings --from-file=app-container/settings/app.properties
Multiple files	kubectl create configmap app-settings --from-file=app-container/settings/app.properties--from-file=app-container/settings/backend.properties
Env-file	kubectl create configmap app-env-file--from-env-file=app-container/settings/app-env-file.properties
Directory	kubectl create configmap app-settings --from-file=app-container/settings/
Viewing a ConfigMap
To view the data in a ConfigMap via console output, use the command:

kubectl describe configmaps <name>

**How to Consume Kubernetes ConfigMaps**

There are three main ways to ConfigMaps can be accessed:

Mounting a ConfigMap as a data volume
Accessing the ConfigMap remotely by pods in the same namespace
Defining a ConfigMap separately from pods and using them for other components of the Kubernetes cluster

Secrets

Namespaces

Persistent Volumes

Persistent Volume Claims

Statefulsets and more

**********pod :**********

- In kubernetes, “pod” is the smallest and most basic unit of deployment
- It represents a single instance of running process within the cluster.
- A pod encapsulates one or more containers, storage resources, network configurations, and other options required to run a specific set of containers together.
- pods are typically created and managed using higher-level abstractions such as Deployments, Replicasets or statefulsets, which provide additional features like scaling, rolling updates, and self-healing capabilities.
- Pods provide several benefits, include resource isolation, flexible deployment strategies, easy scaling and enhanced Reliability.
- 

[Troubleshooting](https://www.prodevopsguy.site/100-Kubernetes-Errors-With-Solution)



## Setting up minikube locally
##  Kubeconfig, services deployment files
##  Deploying Nodejs application on kubernetes cluster
##  kubernetes labels, selectors, and node selectors
##  ReplicationController & Replicaset
##  Deployment Object in Kubernetes
##  Kubernetes cluster (master+workernode) using kubeadm on AWS
##  Kubernetes Networking (services)
- The kubernetes network model has a few general rules to keep in mind:
  1. Every pod gets its own IP address: There is no need to create links between pods and no need to map container ports to host ports
  2. NAT is not required: pods on a node should be able to communicate with all pods on all nodes without NAT
  3. Agents get all-access passed: Agents on a node (system daemons, kubelet) can communicate with all the pods in that node
  4. shared Namespace: containers within a pod share a network namespace (IP and MAC address) so they can communicate with each other using loopback address

<details><summary>What kubernetes networking solves</summary>Kubernetes networking is designed to ensure that the different entity types within kubernetes can communicate. The layout of kubernetes infrastructure has, by design, a lot of separation. Namespaces, containers, pods are meant to keep components distinct from one another, so a highly structured plan for communication is important</details>

![Networking in kubernetes](https://github.com/charan-happy/devopswithcharan/assets/89054489/9cde00b3-6cda-4eca-b3b7-d9b9a5e72824)

#### container-to-container networking
- container-to-container networking happens through the pod network namespace. Network namespaces allows you to have separate network interface and routing tables that are isolated from the rest of the system and operate independently. Every pod has its own network namespace, and containers inside that pod share the same IP address and ports. All communication between these containers happens through localhost, as they are part of the same namespace.

#### pod-to-pod networking
- With k8s, every node has a designated CIDR Range of IPS for pods. This ensures that every pod receives a unique IP address that other pods in the cluster can see. When a new pod is created, the IP address never overlap. unlike container-to-container networking, pod-to-pod communication happpens using Real Ips, whether you deploy the pod  on the same node or a different node in the cluster.

- From the above diagram, The traffic must flow between the pod network namespace and the root network namespace. This is achieved by connecting both pod namespace and root namespace by a virtual ethernet device or veth pair (veth0 to pod namespace1 and veth1 to pod namespace2 in the diagram) . A virtual network bridge connects these virtual interfaces, allowing traffic to flow between them using Address Resolutioon Protocol(ARP).

  When the data is sent from pod1 to pod2 the flow of events is:
```
1. pod 1 traffic flows through eth0 to the root network namespace's virtual interface veth0
2. traffic then goes through veth0 to the virtual bridge, which is connected to veth1
3. Traffic goes through the virtual bridge to veth1
4. Finally, traffic reaches the eth0 interface of pod2 through veth1
```
#### pod-to-service networking
- pods are very dynamic. they may need to scale up or down based on demand. They may be created again in case of an application crash or a node failure. These events cause a pod's IP address to change, which could make networking a challenging. kubernetes solves this problem by using Service function. which does the following

![pod-to-service networking](https://github.com/charan-happy/devopswithcharan/assets/89054489/e1464d4a-802b-482f-b6f4-7d454dd42f39)

1. Assigns a static virtual IP address in the frontend to connect any backend pods associated with the service
2. Load-balances any traffic addressed to this virtual IP to the set of backend pods
3. keep track of the IP address of a pod, such that even if the pod ip address changes, the client don't have any trouble connecting to the pod because they only directly connect with the static virtual IP address of the service itself.

The In-Cluster loadbalancing occurs in two ways:
1. IPTABLES: In this mode, kube-proxy watches for changes in the API server, for each new service, it installs iptables rules, which capture traffic to the service's clusterIP and Port, then redirects traffic to the backend pod for the service. The pod is selected randomly. this mode is reliable and has a lower system overhead because linux Netfilter handles traffic without the need to switch between userspace and kernel space.
2. IPVs: IPVs is built on top of Netfilter and implements transport-layer load balancing. IPVs uses the Netfilter hook function, using the hash table as the underlying datastructure, and works in the kernel space. This means that kube-proxy in IPVS mode redirects traffic with lower latency, higher throughput and better performance than kube-proxy in Iptable mode

- The diagram above shows the package flow from Pod 1 to Pod 3 through a Service to a different node (marked in red). The package traveling to the virtual bridge would have to use the default route (eth0) as ARP running on the bridge wouldn't understand the Service. Later, the packages have to be filtered by iptables, which uses the rules defined in the node by kube-proxy. Therefore the diagram shows the path as it is.

#### Internet-to-service networking

till now above we routed within a cluster. there's another side to kubernetes networking, that is exposing an application to the external network.

![image](https://github.com/charan-happy/devopswithcharan/assets/89054489/90d0375a-3c8d-4f7a-8873-0bf808b2eedc)

- we can expose an application to an external network in two different ways:
  1. Egress: use this when you want to route traffic from your kubernetes service out to the internet. In this case, Ip tables performs the source NAT, so the traffic appears to be coming from the node and not the pod
  2. Ingress: This is the incoming traffic from the external world to services. ingress also allows and blocks particular communications with services using rules for connections. Typically there are two ingress solutions that function on different network stack regions: the service load balancer and the ingress controller.

Discovering services:

There are two ways kubernetes discovers a service:  
1. Environmental variables : The kubelet service running on the node where your pod is responsible for setting up environmental variables for each active service in the format {SVCNAME}_SERVICE_HOST and {SVCNAME}_SERVICE_PORT. you must create the service before the client pods come into existence. Otherwise, those client pods won't have their environment variables populated.
2. DNS: DNS service is implemented as a kubernetes service that maps to one or more DNS server pods, which are scheduled just like any other pod. pods in the cluster are configured to use the DNS service, with a DNS search list that includes the pod's own namespace and the cluster's default doamin. A cluster-aware DNS server, such as CoreDNS, watches the Kubernetes API for new Services and creates a set of DNS records for each one. If DNS is enabled throughout your cluster, all Pods can automatically resolve Services by their DNS name. The Kubernetes DNS server is the only way to access ExternalName Services.

ServiceTypes for publishing Services:
- kubernetes services provide you with a way of accessing a group of Pods, usually defined by using a label selector. This could be applications trying to access other applications within the cluster, or it could allow you to expose an application running in the cluster to the external world. Kubernetes ServiceTypes enable you to specify what kind of Service you want.


![image](https://github.com/charan-happy/devopswithcharan/assets/89054489/c831bf3a-14a9-4710-8ab0-4cdb0f18a0ce)


The different ServiceTypes are:

ClusterIP: This is the default ServiceType. It makes the Service only reachable from within the cluster and allows applications within the cluster to communicate with each other. There is no external access.

LoadBalancer: This ServiceType exposes the Services externally using the cloud provider's load balancer. Traffic from the external load balancer is directed to the backend Pods. The cloud provider decides how it is load-balanced.

NodePort: This allows the external traffic to access the Service by opening a specific port on all the nodes. Any traffic sent to this Port is then forwarded to the Service.

ExternalName: This type of Service maps a Service to a DNS name by using the contents of the externalName field by returning a CNAME record with its value. No proxying of any kind is set up.

## Kubernetes Advanced Networking(CNI and Calico)
## Kubernetes volumes and livenessprobes
## Kubernetes volumes and livenessprobes
## Kubernetes jobs

## Kubernetes INITcontainer

## Kubernetes pod lifecycle

## Kubernetes namespace

## kubernetes ResourceQuota

## Kubernetes Autoscaling

## Multi-cluster kubernetes with HAProxy
## Kubernetes RBAC :
-  Kubernetes RBAC is a powerful security feature that allows administrators to control who can access the kubernetes API and what actions they can perform. You can use it implement the principle of "least privilege" which means that users should have the minimum level of access necessary to perform their tasks. This approach minizes the potential for accidental or malicious misue of kubernetes system
- RBAC in kubernetes is implemented using policies that define the permissions and subjects, which are entities to which these permissions are granted. Policies are defined through Roles and Clusterroles, while subjects can be users, groups or service accounts, bound to the roles using RoleBindings or ClusterRoleBinding.
  **why is RBAC is importatnt for kubernetes ?**
  - Granular access control
  - improved security
  - Access Auditinig
  - Simplifies the management
**core components of Kubernetes RBAC**
- Role and Cluster Role
   > In k8s RBAC, Permissions are defined through two types of objects: Roles and clusterroles. A role defines permissions within a specific namespace, while a clusterrole defines permissions cluster-wide. Both type of roles allows you to specify a set of rules that define what actions can be perfomed on which resources

- RoleBinding and ClusterRoleBinding
  > To grant permissions defined in a Role or clusterrole to a user, group or service account, you use another set of objects: Rolebindings and clusterrolebindings. **A rolebinding** grants the permissions defined in a role to a user within a specific namespace. **A Clusterrolebinding** grants the permissions defined in the clusterrole to a user across the entire cluster.

**Serviceaccounts**
> Service accounts are special type of user in kubernetes, designed to be used by processes running inside pods. Like regular users, service accounts can be assigned Roles and clusterroles using Rolebindings and clusterrolebindings. This allows you to control the permissions of your applications in the same granular and secure way as your human users.

**How to use kubernetes RBAC**

<details><summary>Enabling RBAC</summary>Kubernetes RBAC is typically enabled by default in most modern Kubernetes distributions. However, if you are using an older version or a custom Kubernetes setup, you may need to manually enable RBAC. This is done by starting the Kubernetes API server with the --authorization-mode=RBAC flag.</details>

<details><summary>Creating a Role</summary></details>

```yaml
Create a new ServiceAccount processor in Namespace project-hamster. Create a Role and RoleBinding, both named processor as well. These should allow the new SA to only create Secrets and ConfigMaps in that Namespace.

A ClusterRole|Role defines a set of permissions and where it is available, in the whole cluster or just a single Namespace.
A ClusterRoleBinding|RoleBinding connects a set of permissions with an account and defines where it is applied, in the whole cluster or just a single Namespace.
Because of this there are 4 different RBAC combinations and 3 valid ones:
1. Role + RoleBinding (available in single Namespace, applied in single Namespace)
2. ClusterRole + ClusterRoleBinding (available cluster-wide, applied cluster-wide)
3. ClusterRole + RoleBinding (available cluster-wide, applied in single Namespace)
4. Role + ClusterRoleBinding (NOT POSSIBLE: available in single Namespace, applied cluster-wide)

To the solution
We first create the ServiceAccount:


➜ k -n project-hamster create sa processor
serviceaccount/processor created
Then for the Role:


k -nproject-hamster create role -h# examples
So we execute:


k -nproject-hamster create role processor \
  --verb=create \
  --resource=secret \
  --resource=configmap
Which will create a Role like:


# kubectl -n project-hamster create role processor --verb=create --resource=secret --resource=configmap
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: processor
  namespace: project-hamster
rules:
- apiGroups:
  - ""
  resources:
  - secrets
  - configmaps
  verbs:
  - create
Now we bind the Role to the ServiceAccount:


k -nproject-hamster create rolebinding -h# examples
So we create it:


k -nproject-hamster create rolebinding processor \
  --roleprocessor \
  --serviceaccountproject-hamster:processor
This will create a RoleBinding like:


# kubectl -n project-hamster create rolebinding processor --role processor --serviceaccount project-hamster:processor
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: processor
  namespace: project-hamster
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: processor
subjects:
- kind: ServiceAccount
  name: processor
  namespace: project-hamster
To test our RBAC setup we can use kubectl auth can-i:


k auth can-i -h# examples
Like this:


➜ k -n project-hamster auth can-i create secret \
  --as system:serviceaccount:project-hamster:processor
yes

➜ k -n project-hamster auth can-i create configmap \
  --as system:serviceaccount:project-hamster:processor
yes

➜ k -n project-hamster auth can-i create pod \
  --as system:serviceaccount:project-hamster:processor
no

➜ k -n project-hamster auth can-i delete secret \
  --as system:serviceaccount:project-hamster:processor
no

➜ k -n project-hamster auth can-i get configmap \
  --as system:serviceaccount:project-hamster:processor
no
```
- Creating a role in Kubernetes involves defining a Role object in a YAML file. The Role object includes the API group, the resources, and the verbs (actions) that are allowed. For example, the following role only allows ‘get’ and ‘list’ actions on pods in the core API group

```yaml
apiVersion: rbac.authorization.k8s.io/v1

kind: Role

metadata:

  namespace: default

  name: pod-reader

rules:

- apiGroups: [""]

  resources: ["pods"]

  verbs: ["get", "list"]

```
- Once you have defined the Role object, you can create the role in your Kubernetes cluster by running the following command (assuming the YAML file was saved as role.yaml):

`kubectl apply -f role.yaml`

Keep in mind that roles in Kubernetes are namespace-specific. This means that the permissions granted by a role apply only within a specific namespace. If you want to grant permissions across all namespaces, you will need to create a` ClusterRole`

<details><summary>Creating a clusterrole</summary>A ClusterRole is similar to a Role, except that it grants permissions across all namespaces in your Kubernetes cluster. This is useful for granting permissions to cluster-wide resources such as nodes and persistent volumes.

Creating a ClusterRole involves defining a ClusterRole object in a YAML file. Like a Role object, a ClusterRole object includes the API group, the resources, and the verbs that are allowed. Here is an example of a ClusterRole:

```yaml
apiVersion: rbac.authorization.k8s.io/v1

kind: ClusterRole

metadata:

  name: pod-reader-global

rules:

- apiGroups: [""]

  resources: ["pods"]

  verbs: ["get", "list"]
```
- You can create the ClusterRole in your Kubernetes cluster by running the following command (assuming the YAML file was saved as clusterrole.yaml):

`kubectl apply -f clusterrole.yaml`

</details>
<details><summary>creating a Rolebinding</summary>A RoleBinding is an object that binds a Role to a subject. The subject can be a user, a group, or a service account. The RoleBinding grants the permissions defined in the Role to the subject.

To create a RoleBinding, you define a RoleBinding object in a YAML file. For example:

```yaml
apiVersion: rbac.authorization.k8s.io/v1

kind: RoleBinding

metadata:

  name: read-pods

  namespace: default

subjects:

- kind: User

  name: "janedoe"

  apiGroup: rbac.authorization.k8s.io

roleRef:

  kind: Role

  name: pod-reader

  apiGroup: rbac.authorization.k8s.io
```
- You can create the RoleBinding in your Kubernetes cluster by running this command (again, assuming the YAML file is saved as rolebinding.yaml):

`kubectl apply -f rolebinding.yaml`

Once the RoleBinding is created, the subject will have the permissions granted by the Role in the namespace where the RoleBinding is created
</details>

<details><summary>Creating a clusterrolebinding</summary> a clusterolebinding is simmilar to rolebinding, but it binds a clusterrole to a subject. this grants cluster-wide permissions to the subject.

you define the clusterolebinding in a yaml file, simmilar to Rolebinding. For ex:

```yaml
apiVersion: rbac.authorization.k8s.io/v1

kind: ClusterRoleBinding

metadata:

  name: read-pods-global

subjects:

- kind: User

  name: "janedoe"

  apiGroup: rbac.authorization.k8s.io

roleRef:

  kind: ClusterRole

  name: pod-reader-global

  apiGroup: rbac.authorization.k8s.io
```
- To create the ClusterRoleBinding run this comment (assuming the YAML file is saved in clusterrolebinding.yaml):

`kubectl apply -f clusterrolebinding.yaml`
</details>

**Common challenges and solutions in kubernetes RBAC**
<details><summary>Complex permission mapping</summary>The first challenge that many administrators face with Kubernetes RBAC is the complexity of permissions. Kubernetes, by design, offers a granular level of access control, which can quickly become overwhelming. The way roles, role bindings, and cluster role bindings work together to control who can access what in a cluster is a complex matrix that requires careful management.

To simplify this process, start by mapping out your application’s functionalities and the necessary permissions for each role. This will provide a clear overview of the permissions matrix for your application and help you manage the roles more effectively.</details>

<details><summary>RBAC Misconfigurations</summary>RBAC misconfigurations are another common issue. These can occur when permissions are not properly set, leading to either excessive permissions or insufficient permissions. Both scenarios pose significant risks. Excessive permissions can lead to unauthorized access or actions, while insufficient permissions can hinder the functionality of your application.

To avoid RBAC misconfigurations, ensure you thoroughly understand the principle of least privilege  and apply it diligently. Regular auditing of your RBAC configurations and rigorous testing can also help identify and rectify misconfigurations. In addition, it is critical to test TBAC configurations in a test environment before deploying in production.</details>

<details><summary>Managing Serviceaccount credentials</summary> ServiceAccounts in Kubernetes are meant to provide an identity for processes that run in a pod. However, managing these ServiceAccount credentials can become a challenge as your applications grow and scale.

To manage ServiceAccount credentials effectively, consider automating the process where possible. Kubernetes provides several tools and APIs that can help automate the management of ServiceAccount credentials. These tools will not only save you time but also reduce the risk of human error.

It is critical to regularly review and audit the use of ServiceAccounts. They should be refreshed periodically and must be deactivated as soon as they are no longer needed.</details>
<details><summary>Difficulty Troubleshooting Access Issues</summary>troubleshooting access issues in Kubernetes RBAC can be a complex task due to the granularity of the permissions and roles. Often, you may find yourself sifting through numerous policies and bindings to identify the root cause of an access issue.

To simplify troubleshooting, consider using logging and monitoring tools that provide a comprehensive view of your access control system. These tools can help identify patterns and pinpoint issues more quickly and accurately.</details>

**Best practices of using kubernetes RBAC**
> principle of Least privilege
> Regularly audit permissions
> Use Namespaces wisely
> Limit Use of clusterAdmin



## Kubernetes Ingress

## Kubernetes Statefulsets

## Kubernetes Daemonset

## Kubernetes network policies

## Kubernetes Operators
- In Kubernetes, an operator is an application-specific controller that can help you package, deploy, and manage a Kubernetes application.

Ordinarily, you run and manage Kubernetes applications via the Kubernetes application programming interface (API) and kubectl tooling. Operators lets you extend the functionality of the Kubernetes API, enabling it to configure, create, and manage instances of applications automatically using a structured process.

Operators use the basic capabilities of Kubernetes controllers and resources, but add application-specific or domain knowledge to automate the entire lifecycle of the application it manages.

**why are kubernetes operators important ?**
<details><summary>operators extend kubernetes functionality</summary>A Kubernetes operator is designed to extend the capabilities of Kubernetes, and also simplify application management. This is especially useful for stateful applications, which include persistent storage and other elements external to the application, and may require extra work to manage and maintain.

Kubernetes operators enable you to easily extend Kubernetes capabilities for specific software and use cases. For example, database operators let a Kubernetes user securely deploy and manage specific databases.</details>

<details><summary>Improve Management of Hybrid Environments</summary>Operators allow developers to create powerful tools that can be used on any infrastructure with Kubernetes installed. This is very important for organizations running Kubernetes both on-premises and on one or more public clouds. An operator can provision applications in a consistent manner, across multiple environments, while adhering to the best practices for each installation.

Applications based on operators retain flexibility, and can be managed using kubectl and other Kubernetes native tools. Creating a new instance of an application is as simple as using kubectl to create an instance of an operator-defined custom resource.

In the past, Kubernetes administrators had to have a detailed understanding of each application to manage it. By moving this domain knowledge into the operator and automating it, administrators can focus on the Kubernetes side and treat every application as a standard workload.</details>
<details><summary>Making kubernetes automation seamless</summary>Kubernetes lets you automate the infrastructure required to run containerized applications as well as management and operational tasks. This level of automation is a must if you want to run containerized applications at scale in a production environment.

Automating an IT environment means converting human knowledge and effort (usually a painful effort) into software. This is what Kubernetes operators do, taking all known information and the application lifecycle and then systematizing the info into an automated form. Kubernetes can then handle these tasks for you</details>

**How does a kubernetes operator work ?**
- operators use controllers that monitor kubernetes objects. These controllers are slightly different from regular kubernetes controllers, because they track custom objects, known as custom resource definitions (CRDs). A CRD is an extension of the kubernetes API that provides a place to store and retrieve structured data (the desired application state)
- Operators track cluster events related to specific types of custom resources. These custom resources can three types of events - add, update and delete
- When the operator receives the information, it takes action to bring the kubernetes cluster or external system to the desired state as part of the custom controller scaling cycle.
- To summarise a kubernetes operators workflow:
  > 1. user makes changes to CRD
  > 2. The operator tracks the CRD and identifies change events
  > 3. The operator reconsiles the CRD state with the desired state
  > 4. The operator adjusts cluster state to the desired state

top 6 kubernetes operators :

1. RBAC Manager operator
2. HPA Kubernetes operator
3. Istio operator
4. Elastic Cloud on kubernetes
5. Grafana operator
6. starboard operator
## HELM & Helm charts

## helm Project

## AWS Elastic Kubernetes Services EKS

## Azure Kubernetes Service (AKS)

## Google Kubernetes Engine (GKE)

## End-To-End Devsecops Kubernetes Project
