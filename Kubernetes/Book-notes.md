# 1. Kubernetes Primer
# 2. kubernetes principles of operation
# 3. Getting kubernetes
# 4. Working with pods
# 5. Virtual clusters with namesapces
# 6. kubernetes deployments
# 7. kubernetes services
# 8. ingress
# 9. wasm on kubernetes
# 10. Service Discovery deep dive
# 11. kubernetes storage
# 12. Configmaps and secrets
# 13. statefulsets
# 14. API Security and RBAC
# 15. Kubernetes API
# 16. Threat Modeling kubernetes
# 17. Real-world kubernetes security
<br>













</br>



## 1. Kubernetes Primer

**Important Kubernetes background**

- kubernetes is an orchestrator of containerized cloud-native microservices applications or
`Kubernetes deploys, scales, self-heals, and updates applications where individual application features are packaged and deployed as containers.`
- It’s open-sourced under the Apache 2.0 license and is owned and managed by the Cloud Native Computing Foundation (CNCF).
     ORCHESTRATION :
```
- An orchestrator is a system that deploys applications and dynamically responds  to changes. For ex, kubernetes can :
  1. Deploy Applications
  2. Scale them up and down based on demand
  3. Perform rollouts and rollbacks
 and a lot....
```
  CONTAINERIZATION :
```
- It is the process of packaging applications and dependencies as images and then running them as containers
```
  CLOUD-NATIVE :
```
- cloud-native applications posses cloud-like features such as auto-scaling, self-healing, automated-updates, rollbacks and more.

Simply🤭running a regular applications in the public cloud doesnot make it cloud-native
```
  MICROSERVICES :
```
- Microservices applications are built from many small, specialized, In-dependent parts that work together to form a useful application.
```

where did kubernetes come from ?🤔
- kubernetes was developed by a group of google engineers partly in response to AWS and Docker.
    - AWS changed the world when it invented modern cloud computing, and the rest of the industry needed to catch up. one of the companies catching up was google, they'd build their own cloud but needed a way to abstract the value of AWS and make it easy as possible for customers to get off AWS and onto their cloud.
     - At the sametime, Docker was taking the world by storm, and users needed help managing explosive container growth.
 
  This led a group of google engineers to take the lessons they'd learned using their Internal container management tools and create a new tool called `kubernetes`

👉 Two biggest reasons kubernetes is important to the industry is :
1. It abstracts Infrastructure (Such as AWS) and 2. It simplifies applications portability

**Kubernetes and Docker **

- All the early version of kubernetes shipped with docker as its container-runtime. Meaning kubernetes used Docker for low-level tasks such as creating, starting, and stopping containers. However, Two things happened :
  1. Docker got bloated [Excessive in size or amount ]
  2. People created lots of docker alternatives
 
As a result, K8s project created the container runtime interface (CRI) to make the runtime layer pluggable. This means now you can pick and choose the best runtimes for your needs.  For ex: some runtimes provide better isolations, some provide better performance, some work with wasm containers, and more

- K8s 1.24 finally removed support for `Docker as a runtime` as it was bloated and overkill for what kubernetes needed. Since then, most new kubernetes clusters ship with **cotnainerd** as the default runtime. Fortunately, containerd is a stripped-down version of docker optimized for kubernetes, that fully supports applications containerized by docker. In fact, Docker, containerd, and kubernetes all work with images and containers that implement the **open container initiative (OCI)** standards.

- In 2016, 2017 Docker swarm, Mesosphere DCOS, and kubernetes competed to become the industry standard conatiner orchestrator. Kubernetes won. However, Docker swarm is still being developed and is still used by small companies needing a simple alternative to kubernetes

**kubernetes - what's in the name ** 

- The word Kubernetes originates from the Greek word for **helmsman** which is the person who steers a ship. You can see this in the logo, which is a ship’s wheel.
- Some of the original engineers wanted to call kubernetes seven of nine. Because, kubernetes got inspiration from google's borg project and borg project got it's name from famous borg drone from TV series "Start Trek Voyager " is called seven of  nine. Copy right laws didn't allow this, so they gave the logo seven spokes as a subtle reference to seven of nine.
- You'll often see it shortened to k8s and pronounced as "kates". The number 8 replaces the eight characters between "K" and "S"

**Kubernetes : The operating system of the cloud**

- kubernetes is the de facto platform for cloud-native applications, and we sometimes call it the **operating system (OS) of the cloud**. This because it abstracts the differences between cloud platforms the same way that operating systems like linux and windows abstract the differences between servers :
   - linux and windows abstract server resources and schedule application processes
   - Kubernetes abstracts cloud resources and schedules application microservices

As a quick example, you can schedule applications on kubernetes with-out caring if they're running on AWS, Azure, Civo Cloud, GCP or your on-premises datacenter. This makes kubernetes a key enabler for :
- Hybrid Cloud
- Multi-cloud
- Cloud migrations

**Application Scheduling :**
- one of the main things an OS does is simplify the scheduling of work tasks.
    For ex: computers are complex collection of hardware resources such as cpu, memory, storage and networking. Thankfully modern operating systems hide most of this, making the world of application development a far friendlier place. For ex, how many developers need to care which CPU cor, memory DIMM, or flash chip their code uses ? Most of the time,  we let the OS decide.

  kubernetes does a simmilar thing with clouds and data centers.

  At high level, a cloud or data center is complex collection of resources and services. Kubernetes abstracts most of this, making the resources easier to consume. Again, how often do you care which compute node, which failure zone, or which storage volume your app uses ? Most of the time, you'll be happy to let kubernetes decide.
  


## 2. kubernetes principles of operation

**kubernetes from 40K feet**
- kubernetes is both cluster and an orchestrator .

**kubernetes : cluster **
- kubernetes is one or more nodes providing CPU, Memory and other resources for application use.

kubernetes supports two node types:
1. control plane nodes (system services)
2. Worker nodes (user apps)

- Both types can be physical servers, virtual machines, or cloud instances, and both can run on ARM and AMD64/x86-84. Control plane nodes must be linux, but worker nodes can be linux or windows.

- control plane nodes implement the kubernetes intelligence, and every cluster needs at least one. However, you should have three or five for high availability (HA)
- Every control plane node runs every control plane service. These include  the API Server, the scheduler, and the controller that implement cloud-native features such as self-healing, autoscaling and rollouts.
- Worker nodes are where you run your business applications

**kubernetes : Orchestrator**

- orchestrator is the jargon for a system that deploys and manages applications.
- Kubernetes is the industry-standard orchestrator and can intelligently deploy applications across nodes and failure zones for optimal performance and availability. It can also fix things when they break, scale things when demand changes, and manage rollouts and rollbacks.

**control plane and worker nodes**
- a kubernetes cluster is one or more control plane nodes and worker nodes.
- Almost all cloud-native apps are linux apps and require linux worker nodes. However, you'll need one or more windows worker nodes if you have cloud-native windows apps. Fortunately, a single kubernetes cluster can have a mix of linux and windows worker nodes, and kubernetes is intelligent enough to schedule apps to the correct nodes.

- The control plane is a collection of system  services that implement brains of kubernetes. It exposes the API, scheduled apps, implements self-healing, manages scaling operations, and more.
- The simplest clusters run a single control plane node and are best suited for labs and testing. For production clusters, you should run three or five control plane nodes and spread them across availability zones for high availability

Most clusters run every control plane service on every control plane node for HA.

**API Server**
- API server is the front end of kubernetes, and all commands and requests go through it. Even internal control plane services communicate with each other via the API server.
- It exposes RESTful API over HTTPS, and all requests are subjected to authentication and authorization.

For ex: Deploying or updating an app follows this process :
1. Describe the application in YAML configuration
2. post the configuration file to the API server
3. The request will be authenticated and authorized
4. The application definition will be persisted in the cluster store
5. The application's containers will be scheduled to nodes in the cluster

The cluster Store :
- The cluster store holds the desired state of all applications and cluster components, and it's the only stateful part of the control plane.
- It's based on the etcd distributed database, and most kubernetes clusters run an etcd replica on every control plane node for HA. However, large clusters that experience a high rate of change may run a separate etcd cluster for better performance.
- Note that highly available cluster store is not a substitute for backup and recovery. you still need adequate ways to recover the cluster store when things go wrong.
- Regarding availability, etcd prefers an odd number of replicas to help avoid `split brain conditions`. This is where replicas experience communication issues and cannot be sure if they have quorum (majority)
  ![image](https://github.com/user-attachments/assets/3fe5ed5d-f013-4928-945a-011dae497228)
HA and split-brain condition

What happens if split brain occurs ?
 > If split-brain occurs, etcd goes into read-only mode preventing updateds to the cluster. user applications will continue working, but kubernetes won't be able to scale or update them.

- As with all distributed databases, consistency of writes is vital. For example, multiple writes from different sources to the same can cause corruption. etcd uses the `RAFT consensus algorithm` to prevent this from happening.

**Controllers and the controller manager**
- kubernetes uses `controllers` to implement a lot of the cluster intelligence. Each controller runs as a process on the control plane, and some of the more common ones include :
```
- The deployment controller
- The statefulset controller
- The Replicaset controller
```
- Controllers ensure the cluster runs what you asked it to run. For ex: if you ask for 3 replicas of an app, a controller will ensure you have three healthy replicas and take appropriate actions if you don't.
- Kubernetes also runs a `controller manager` that is responsible for spawning and managing the individual controllers.
  
![image](https://github.com/user-attachments/assets/f50b795b-d91e-4c4d-89bf-4ff9e9f6dcf5)
controller manager and controllers

**The Scheduler**
- The scheduler watches the API server for new work tasks and assign them to healthy worker nodes

It implements the following process:

1. Watch the API Server for new tasks
2. Identify capable nodes
```
- Identify capable nodes involves predicate checks, filtering, and a ranking algorithm. It checks for taints, affinity and anti-affinity rules, network port availability and available cpu and memory. It ignores nodes in-capable of running the tasks and ranks the remaining ones according to factors such as whether it already has the required image, the amount of available CPU and memory,  and number of tasks it's currently running. Each is worth points, and the nodes with the most points are selected to run the tasks.
- The scheduler marks tasks as pending if it can't find a sutitable node
```   
3. Assign tasks to nodes

- if the cluster is configured for `node autoscaling` the pending task kicks off a cluster autoscaling event that adds a new node to the cluster and the scheduler assigns the task to the new node.

**The cloud controller manager**
- if your cluster is on a public cloud, such as AWS, Azure, GCP, or Civo Cloud, it will run a cloud controller manager that integrates the cluster with cloud services, such as instances, load balancers, and storage. 

![image](https://github.com/user-attachments/assets/ab2d3d30-7866-4d5f-930c-42cee5962bcf)


**Worker nodes :**
- worker nodes run your business applications.
  
![image](https://github.com/user-attachments/assets/ca267be6-590b-468a-b8f4-2466529e4a8e)

**kubelet**
- The kubelet is the main kubernetes agent and handles all communication with the cluster.
It performs the following key tasks :
- watches the API server for new tasks
- Instructs the appropriate runtime to execute tasks
- Reports task status to the API Server

If a task won't run, the kubelet reports the problem to the API server and lets the control plane decide what actions to take.

**Runtime**
- Every worker node has one or more runtimes for executing tasks
- Most new kubernetes clusters pre-install the `container-d` runtime and use it to execute tasks. These tasks include :
```
- pulling container images
- Managing lifecycle operations such as starting and stopping containers
```

📝 older clusters shipped with the docker runtime, but this is no longer supported. Redhat openshift clusters use the CRI-O runtime. Lots of others exist, and each has its pros and cons.

**kubeproxy**
- Every worker node runs a `kube-proxy` service that implements cluster networking and load balances traffic to tasks running on the node.

**packaging apps for kubernetes**
- kubernetes runs containers, VMs, Wasm apps and more. However, all of them need wrapping in pods before they'll run on kubernetes.
  
let's have a courier analogy
```
- Couriers allow you to ship books, clothes, food, electrical items, and more, so long as you use their approved packaging and labels. Once you've packaged and labeled your goods, you hand them to the courier for delivery. The courier then handles the complex logistics of which planes and trucks to use, secure hand-off to local delivery hubs, and eventual delivery to customers. They also provide services for tracking packages, changing delivery details, and attesting successful delivery. All you have to do is package and label the goods. 
```
Running applications on Kubernetes is similar. 
```
Kubernetes can run containers, VMs, Wasm apps, and more, as long as you wrap them in Pods. Once wrapped in a Pod, you give the Pod to Kubernetes, and Kubernetes runs it. This includes the complex logistics of choosing appropriate nodes, joining networks, attaching volumes, and more. Kubernetes even lets you query apps and make changes.
```

- you write an app in your favorite language, containerize it, push it to a registry, and wrap it in a pod. At this point, you can give the pod to kubernetes, and kubernetes will run it. However, you'll almost always deploy and manage pods via higher-level controllers. For example, you can wrap pods inside of `Deployments` for scaling, self-healing and rollouts.

- Most couriers offer additional services such as insurance for the goods you're shipping, refrigerated delivery, signature and photograhic proof of delivery, express delivery services and more.
- k8s is simmilar, It implements controllers that add value, such as ensuring the health of apps, automatically scaling when demand increases, and more

![image](https://github.com/user-attachments/assets/88a0a491-3d0e-4450-93aa-13350f1a602f)

------ object nesting -----

- The important thing to understand is that each layer of wrapping adds something :
   - The container wraps the app and provides dependencies
   - The pod wraps the container so it can run on kubernetes
   - The Deployment wraps the pod and adds self-healing, scaling and more..

You post the Deployment (YAML file) to the API Server as the `desired state` of the application, and kubernetes implements it.


**The declarative model and desired state**
- The `declarative model` and `desired state` are at the core of how kubernetes operates. They work on three basic principles: Desired state, Observed state, Reconcilliation

Desired state -> What you want
Observed state -> what you have
reconciliation -> process of keeping observed state in sync with desired state

- In kubernetes, the `declarative model` works like this:
```
1. you describe the desired state of an application in a YAML manifest file
2. you post the YAML file to the API Server
3. Kubernetes records this in the cluster store as a record of intent
4. A controller notices the observed state of the cluster doesn't match the new desired state
5. The controller makes the necessary changes to reconcile the differences
6. The controller keeps running in the background, ensuring observed state always matches desired state.
```
📝 - The `imperative model` requires complex scripts of platform-specific commands to achieve an end-state
- The `declarative model` is a simple platform-agnostic way of describing an end state

- kubernetes supports both but prefers the `declarative model`. This is because the declarative model integrates with versoin control systems and enables self-healing, autoscaling, and rolling updates.

**Pods**
- The atomic unit of scheduling in VMware is the virtual Machine (VM). In kubernetes, it's the `pod`
- The simplest configurations run a single container per pod, which is why we sometimes use the terms pod and container interchangeably. However, there are powerful use cases for multi-container pods, including :
```
    service meshes
    helper services that initialize environments
    Apps with tightly coupled helper functions such as log scrappers
```
![image](https://github.com/user-attachments/assets/63e7f4d7-5f2d-412b-8036-612878d12c8c)
Multi-container service mesh pod

- Multi-container pods also help us implement the single responsibility principle where every container performs a single task.


**Deployments**

**Services**

## 3. Getting kubernetes
## 4. Working with pods
## 5. Virtual clusters with namesapces
## 6. kubernetes deployments
## 7. kubernetes services
## 8. ingress
## 9. wasm on kubernetes
## 10. Service Discovery deep dive
## 11. kubernetes storage
## 12. Configmaps and secrets
## 13. statefulsets
## 14. API Security and RBAC
## 15. Kubernetes API
## 16. Threat Modeling kubernetes
## 17. Real-world kubernetes security
