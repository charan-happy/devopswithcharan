************what is Kubernetes ?************

- Kubernetes also known as “K8s”, is an open-source container orchestration platform developed by google.
- It is designed to automate the deployment, scaling, and management of containerized applications across a cluster of nodes.
- Kubernetes provides a consistent and reliable way to manage applications, regardless of whether they are running on-premises, in the cloud or in the hybrid environments.

********what is Microservices ?********

- Microservices are a software architecture pattern that structures applications as a collection of small, independently deployable services.
- Each microservice is designed to perform a specific function or business capability and communicates with other services over well-defined APIs or protocols.

****pod**** is an abstraction layer of container. 

containers are part of pod

**************************************************Kubernetes Architecture :**************************************************

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/a2be7731-103e-4bd5-ab13-8230a2fe0d79/d62c83e9-90c4-4efa-9943-a9e5d290a55e/Untitled.png)

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

******************************************Worker Node Component******************************************

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/a2be7731-103e-4bd5-ab13-8230a2fe0d79/4194bc70-d2bc-4ec6-93ce-6bc14900f2c9/Untitled.png)

******************************kubelet :****************************** 

- An agent that runs on each node in the cluster. It make sure that containers are running in a pod.
- the Kubelet takes a set of PodSpecs that are provided that are provided through various mechanisms and ensures that the containers described in those podspecs are running and healthy. The kubelet doesn’t manage containers which were not created by Kubernetes.

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