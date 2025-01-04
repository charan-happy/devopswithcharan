Linux-cheatsheet :
--------------------
# syllabus




## 1. Introduction
- kubernetes is an open-source orchestrator for deploying containerized applications, it was originally developed by google, inspired by a decades of experience deploying scalable, reliable systems in containers via application-oriented APIs

- imperative commands define actions, declarative configurations define state
-  Below are the benefits of people come to use container and container APIs like kubernetes :
```
Development velocity
Scaling (of both software and teams)
Abstracting your infrastructure
Efficiency
Cloud native eco system
```

## 2. Creating and running containers
- Application programs are typically comprised of a language runtime, libraries and your source code
- `container images bundle a program and its dependencies into a single artifact under a root file system.`
- Docker image format is made up of a series of filesystem layers. Each layer adds, removes or modifies files from the preceding layer in the file systems.
- Container images are typically combined with container configuration file, which provides instructions on how to set up the contianer environment and execute an application entry point.
- the container configuration often includes information on how to setup networking, namespace isolation, resource constraints (cgroups) and what syscall restrictions should be placed on a running instance. The container root file system and configuration file are typically bundled using the docker iamge format.

- containers fall into two main categories : 1. system containers and 2. application containers

```
- system containers seek to mimic virtual machines and often run a full boot process. They often include a set of system services typically found in Vm, such as ssh,cron and syslog.
- Application containers differ from system conttainers in that they commonly run a single program. While running a single program per container might seem like an unnecessary constraint, it provides the perfect level of granularity for composing scalable applications and is a design philosophy that is leveraged heavily by pods.
```


#### Building Application images with docker

##### Dockerfiles
- A dockerfile can be used to automate the creation of a docker container image

- let's look at an example for containerizing a node.js app. To package it as a docker image, we need to create two additional files along with package.json and server.js they are dockerfile and .dockerignore
- - Dockerfile is a receipe for how to build the container image while .dockerignore defines the set of files that should be ignored when copying files into the image.
 
  - To create simple-node docker image let's run `docker build -t simple-node .` and to get access to the app run, `docker run --rm -p 3000:3000 simple-node`

#### optimizing image sizes
- In general, you want to order your layers from least likely to change to most likely to change in order to optimize the image size for pushing and pulling.

 .
 └── layer A: contains a base OS
    └── layer B: adds source code server.js
        └── layer C: installs the 'node' package
 versus:
 .
 └── layer A: contains a base OS
    └── layer B: installs the 'node' package
        └── layer C: adds source code server.js

##### Image security

- Never keep passwords at any layer of the image. Because, deleting file in one layer doesn't delete the file from preceding layers.
- secrets and images should never be mixed
- try to have a tight set of dependencies. This smaller set ensures that your image isn't exposed to vulnerabilities in libraries it would never use

##### Multistage image builds
-  multi-stage builds are helpful in reducing the size of the images which leads to less resources utilization

##### Storing Images in a Remote Registry
- There are 2 different kinds of registries. They are public and private.
- public registries allow anyone to download images stored in the registry. while private registries require authentication to download images

- public registries are great for sharing images with the world because they allow for easy, unauthenticated use of the container images.
- a private registry is best for storing applications that are private to your service and that you don't want the world to use.

we have to tag the image first, `docker tag <name>  <dockerhub-username>/name of our image:<tag>`
To push the image to dockerhub, `docker push <dockerhub-username>/name of the image:tag`

##### container runtime interface

- kubernetes provides an API for describing an application, but relies on a container runtime to setup an application container using the container specific APIs native to the target OS.
- on linux system that means configuring cgroups and namespaces. The interface to this container runtime is defined by the container runtime standard (CRI) standard.
- CRI API is implemented by a number of different programs, including the containerd-cri built by docker and crio implementation contributed by redhat.
- When you install docker tooling, the containerd runtime is also installed and used by docker daemon.

##### Running containers with docker
- In k8s, containers are usually launched by a daemon on each node called kubelet, however, it's easier to get started with containers using docker command line tool. the docker cli tool can be used to deploy containers.

  `docker run -d --name <name of our container> --p hostport:containerPort <image>:tag`

##### Limiting Resource Usage

- Docker enables applications to use fewer resources by exposing the underlying cgroup technology provided by the linux kernel. These capabilities are likewise used by kubernetes to limit the resources each pod uses.
 
- one of the key benefits of running applications within a container is the ability to restrict resources utilization. This allows multiple applications to coexist on the same hardware and ensure fair usage.

To stop a container `docker stop <image-name>` and to remove a container `docker rm <image>`

To start another container with appropriate flags to limit memory .
```
docker run -d --name <image-name> --p <hostport>:<containerport> --memory value --memory-swap <size> <image-name>
```

- if the program in the container uses too much memory, it will be terminated.

##### Limiting CPU resources
- Another critical resource on a machine is the CPU. We can restrict CPU utilization using `cpu-share` flag with docker run command.
- `docker run -d --name <name-of-our-app> --publish <hostport>:<containerport> --memory <value> --memory-swap <value> --cpu-share <value> <image>`

##### Cleanup
- once you are done building an image, you can delete it with a docker rmi command. `docker rmi <tag-name>` or `docker rmi <image-id>`

- docker provides a tool called `docker system prune` for doing general cleanup. This will remove all stopped containers, all untagged images, and all unused image layers cached as part of the build process. use it carefully.

- containers provide isolation between applications running on the same machine, which helps avoid dependency conflicts.

## 3. Deploying a kubernetes cluster

- we have multiple options to deploy a kubernetes cluster. 1. cloud providers usage 2. on-prem using minikube/kubeadm

##### kubernetes client
- The official kubernetes client is `kubectl` a command line tool for interacting with the kubernetes api. kubectl can be used to manage most kubernetes objects, such as pods, replicasets, and services. kubectl can also be used to explore and verify the overall health of the cluster.

  |command|usage|
  |---|---|
  |kubectl version| version of cluster that we are running|
  |kubectl get componentstatuses| To check health of the cluster|
  |kubectl get nodes| To list out nodes|
  |kubectl describe nodes <node-name>| To see basic information about the node|

- the `controller-manager` is responsible for running various controllers that regulates behaviour of the cluster.
- The `scheduler` is responsible for placing different pods onto different nodes in the clsuter.
- The `etcd` servers is the storage for the cluster where all of the API objects are stored.

##### Cluster components
- All the kubernetes components runs on the `kube-system` namespace.
- `kube-proxy` is responsible for routing network traffic to load-balanced services in the kubernetes cluster.

  |kubectl get daemonsets --namespace=kube-system kube-proxy
|To see proxies |
  |kubectl get services --namespace=kube-system
|a kubernetes service that performs loadbalancing for dns server|

|kubectl get deployments --namespace=kube-system
|To get dns serverice as a deployment data |

### 4. common kubectl commands

- kubernetes namespaces uses `namespaces` to organize objects in the cluster. by default, `kubectl` command line tool interacts with default namespace. To change namespace we can use `kubectl --namespace=something`
- if we wanted to change the default namespace permanently, then we can use `context`. This gets recorded in a kubectl configuration file, usually located at $HOME/.kube/config 
- This configuration file also stores how to both find and authenticate to your cluster.
`kubectl config set-context my-context --namespace=mystuff`
- contexts also be used to manage different clusters or different users for authenticating to those clusters using --users or --clusters flags with the set-context command 
```
kubectl config current-context
kubectl config get-contexts
kubectl config set-context my-context --namespace=charan
kubectl config get-contexts
kubectl config use-context my-context
```

- Everything contained in kubernetes is represented by a RESTful resource. These resources are refered as `kubernetes objects`.  each kubernetes objects exists at a unique HTTP path.
- The kubectl command makes HTTP requests to those URLs to access the kubernets objects that reside at these paths.
- The most basic command to view kubernetes objects via kubectl is get. if you run `kubectl get <resource-name>` we will get a listing of all resources in the current namespace
- To get specific resource, we can use `kubectl get <resource-name> <obj-name>`
- By default, kubectl uses human-readable printer for viewing the responses from the API server. To get detailed view we can use `-o wide` flag.  To view objects as raw json or yaml using -o json or -o yaml .
- A common-option for manipulating the output of kubectl is to remove headers, which is often useful when combining kubectl with unix pipes (ex: kubectl .. | awk ...) if you specify --no-headers flag, kubectl will skip the headers at the top of the human-readable table.
- Another common task for extracting specific fields from object. Kubectl uses the JSONPath query language to select fields in the returned object. 

```
kubectl get pods my-pod -o jsonpath --template={.status.podIP}
192.168.67.1
```
- we can also view multiple objects of different types by using a comma separated list of types `kubectl get pods,services`
- To get more detailed info, we can use `kubectl describe <resource-name> <obj-name>`
- To see a list of supported fields for each supported type of kubernetes object, you can use the explain command `kubectl explain pods`
- To continuously observe the state of a particular kubernetes resource to see changes to the resources when they occur. we can use `--watch` flag.
ex: `kubectl get pods --watch`

#### creating, updating, and Destroying kubernetes objects
- objects in the kubernetes API are represented as JSON or YAML files. These files are either returned by the server in response to a query or posted to the server as part of an API request.
- we can use yaml or json file to create,update or delete objects on the kubernetes server 

- let's assume that you have a simple object stored in obj.yml. you can use kubectl to create this objects in kubernetes by running `kubectl apply -f obj.yml`
and to update also same `kubectl apply -f obj.yml`
- It is idempotent meaning if the objects you are creating already exist in the cluster, it will simply exit successfully without making any changes. This makes it useful for loops where you want to ensure the state of the cluster matches the state of the filesystem.
- if you want to see what the apply command will do without actually making the change, we can use `--dry-run` flag to print the objects to the terminal without actually sending them to the server.
- if you feel like making interactive edits instead of editing a local file, you can instead use the `edit` command. `kubectl edit <resource-name> <object-name>`
- The apply command also records the history of previous configurations in an annotation within  the object. You can manipulate these records with the edit-last-applied, set-last-applied, and view-last-applied commands. for ex: `kubectl apply -f myobj.yml view-last-applied`
- To delete an object simply run `kubectl delete -f obj.yml`
- kubernetes will not prompt you to confirm the deletion. once you issue the command, object will be deleted. To delete an object using resource type and name. we can use `kubectl delete <resource-name> <obj-name>`

#### labeling and annotating objects 
- labels and annotations are tags for your objects. 
ex: To add the `color=red` label to a pod named `bar`, you can run `kubectl label pods bar color=red`
- By default, labels and annotations will not let you overwrite an existing label. to do this, you need to add the `--overwrite` flag 
- To remove a label, we can use `<label-name>-syntax`
`kubectl label pods bar color -` this will remove the color label from the pod named bar 

#### Debugging commands 
- To see the logs of a container, we can run `kubectl logs <pod-name>`
- if you have multiple containers in your pod, you can choose the container to view using `-c` flag.
- if you want to continuously stream the logs back to the terminal without exiting, you can add the `-f(follow`) command-line flag.
- you can also use the exec command to execute a command in a running container. `kubectl exec -it <pod-name> -- bash`
- if you don't have bash or someother terminal available within your container, you can always attach to the running process.
`kubectl attach -it <pod-name>`
- we can copy files to and from a container using `cp` command. `kubectl cp <pod-name>:</path/to/remote/file> </path/to/local/file>`
- if you want to access your pod via network, you can use the `port-forward` from command to forward network traffic from the local machine to the pod. This enables you to securely tunnel network traffic through to containers that might not be exposed anywhere on the public network. `kubectl port-forward <pod-name> 8080:80` this will opens-up a connection that forwards traffic from the local-machine on port 8080 to the remote container on port 80.
- we also use `port-forward` command with service also but the requests will be forwarded to a single pod in that service. They will not go through the service loadbalancer.
- if you want to view kubernetes events, you can use the `kubectl get events` 
- To see events in realtime, we can add `--watch` and to see all events in all namespaces, we can use `-A`
ex: `kubectl get events --watch -A`
- to see the resource utilization, we can use `kubectl top nodes`

#### cluster management
- `cordon` -> unscheduling pods on a particular node
- `drain` -> remove pods running currently on the machine
- `un-cordon` -> To schedule pods on a node


#### pods
- A pod is a collection of application containers and volumes running in the same execution environment. Pods are the smallest deployable artifact in a kubernetes cluster.
- Each container within a pod runs in its own cgroup, but they share a number of linux namespaces.
- Applications running in the same pod share the same IP address and port space (network namespace) have the same hostname (UTS namespace), and can communicate using native interprocess communication channels over system v IPC or POSIX message queues (IPC namespace). However, Applications in different pods are isolated from each other; they have different IP addresses, hostnames, and more. containers in different pods running on the same node might as well be on different servers

- Right question to ask when designig pod is "will these containers work correctly if they land on different machines?" if answer is no then pod is the correct grouping for containers.else go with different pods.

#### pod manifest

- pods are described in a pod manifest, which is just a text-file representation of the kubernetes API object. kubernetes is strongly believes in declarative configuration. 
- once scheduled to a node, pods don't move and must be explicitly destroyed and rescheduled.

#### Creating a pod
- The simplest way create a pod is via imperative kubectl run command. `kubectl run <pod-name> <image-name>:<tag>`
- To check the status `kubectl get pods`
- To delete it , `kubectl delete <pod-name>`

#### Creating a pod manifest 
- we can write pod manifests using yaml or json, but YAML is generally prefered due to it's human-editable nature and it supports comments.
- pod manifest include a couple of key fields and attributes namely, `metadata` section of describing the pod and its labels, a `spec` section for describing volumes, and a list of containers that will run in the pod.

```kuard-pod.yml
apiVersion: v1
kind: pod
metadata:
  name: kuard
spec:
  containers:
    - image: nginx
      name: nginx
      ports:
        - containerPort: 8080
          name: http
          protocol: TCP 
```
- To create a pod with the above manifest file, we can use `kubectl apply -f kuard-pod.yml`
- To list the pods `kubectl get pods`
- To get wide range of information, we can use `-o wide` along with our kubectl command like `kubectl get pods -o wide`
- Adding `-o json` or `-o yaml` will print out the complete objects in JSON or YAML, respectively.
- To describe pod, we can use `kubectl describe pods <pod-name>`
- To delete a pod with file, we can use `kubectl delete -f kuard-pod.yml`
- The default grace period of pod termination is 30 sec 
- To get logs of a pod, we can use `kubectl logs kuard` and kubernetes always get logs from currently running container. adding `--previous`flag will get logs from a previous instance of the container.
- Sometimes, logs are not enough to truly determine, what's going on. you need to execute commands in the context of the container itself. To do this, we can use `kubectl exec kuard -- date` To get interactive session `kubectl exec -it kuard -- ash`

#### health-check
- when you run your application as a container in kubernetes, it is automatically kep alive for you using a `process health` check. This health check simply ensures taht the main process of your application is always running. if it isn't kubernetes restarts it.
- However, in most cases, a simple process check is insufficient. For ex: if your process is deadlocked and is unable to serve requests, a process health check will still believe that your application is healthy since, it's process is still running.

```kuard-pod-health.yml
apiVersion: v1
kind: pod
metadata:
  name: kuard
spec:
  containers:
    - image: nginx
      name: nginx 
      livenessProbe:
        httpGet:
          path: /healthy
          port: 8080
        initialDelaySeconds: 5
        timeoutSeconds: 1
        periodSeconds: 10
        failureThreshold: 3
      ports:
        - containerPort: 8080
          name: http
          protocol: TCP
          
```
- The above pod manifest uses an `httpGet` probe to perform an `HTTPGET` request against the `/healthy` endpoint on port 8080 of the kuard container. The probe sets an `initialDelaySeconds` of 5 and thus will not be called until 5 seconds after all the containers in the Pod are created. the probe must respond within the 1-second timeout, and the HTTP status code must be equal to or greater than 200 and less than 400 to be considered successful. kubernetes will call the probe every 10 seconds. if morethan 3 consecutive probes fail, the container will fail and restart.

```
kubectl apply -f kuard-pod-health.yml
kubectl port-forward kuard 8080:8080

```
- The default behaviour of a failed liveness check is to `restart` the pod, the actual behaviour is governed by pod's `restartpolicy`. There are 3 options for restart policy: Always(the default), onFailure(restart only on liveness failure or nonzero process exit code) or Never 

##### Readiness probe 
- liveness determines if an application is running properly. Containers that fail liveness checks are restarted. Readiness describes when a container is ready to serve user requests. containers that fail readiness checks are removed from service loadbalancers.
##### startup probe 
- startup probes are introduced to kubernetes as an alternative way of managing slow starting containers. when a pod is started, the startup probe is run before any other probing of the pod is started. The startup probe proceeds until it either timeout (in which case the pod is restarted) or it succeeds, at which time the liveness probe takes over. 
- startup probes enable you to poll slowly for a slow-starting container while also enabling a responsive liveness check once the slow-starting container has initialized.
- probes in kubernetes have number of advanced options, including how long to wait after pod startup to start probing, how many failures should be considered true failure, and how many successes are necessary to reset the failure count. All of these configuration receive default values when left unspecified, but they may be necessary for more advanced use cases.
- In addition to HTTP healthchecks, kubernetes also supports tcpSocket health checks that open a TCP socket, if the connection succeeds, the probe succeds. This type of probe is useful for non-HTTP applications, such as databases or other non-HTTP based APIs.
- finally, kubernetes allows `exec` probes. These execute a script or program in the context of the container. following typical convention, if this script returns a non-zero exit code, the probe succeeds, otherwise it fails. exec scripts are often useful for custom application validation logic that doesn't fit nearly into an HTTP call.

#### Resource management
- kubernetes allows users to specify two different resource metrics. Resource `requests` specify the minimum amount of a resource required to run the application. Resource `limits` specify the maximum amount of a resource that an application can consume.
```
"400m" is 0.4 MB, not 400Mb, a significant difference.
```
- most commonly requested resources are cpu and memory, but kubernetes supports other resource types as well, such as GPUs.

```kuard-pod-resreq.yml
apiVersion: v1
kind: pod
metadata:
  name: kuard
spec:
  containers:
    - image: nginx
      name: nginx
      resources:
        requests:
          cpu: "500m"
          memory: "128Mi"
      ports:
        - containerPort: 8080
          name: http
          protocol: TCP 

```
- Resources are requested per container, not per pod. The total resources requested by the pod is the sum of all resources requested by the pod because the different containers often have very different cpu requirements.
- CPU requests are implemented using the `cpu-shares` functionality in the linux kernel.
- w.r.to Memory requests, if a container is over its memory request, the OS can't just remove memory from the process, because it's been allocated. Consequently, when the system runs out of memory, the `kubelet` terminates containers whose memory usage is greater than their requested memory. These containers are restarted automatically, but with less available memory on the machine for the container to consume.

```kuard-pod-reslim.yml
apiVersion: v1
kind: pod
metadata:
  name: kuard
spec:
  containers:
    - image: nginx
      name: kuard
      resources:
        requests:
          cpu: "500m"
          memory: "128Mi"
        limits:
          cpu: "1000m"
          memory: "256Mi"
      ports:
        - containerPort: 8080
          name: http
          protocol: TCP 

```
- when you establish limits on a containers, the kernel is configured to ensure that consumption cannot exceed these limits. A container with a CPU limit of 0.5 cores will only ever get 0.5 cores, even if the CPU is otherwise idle. A container with a memory limit of 256 MB will not be allowed additional memory; for ex: `malloc` will fail if its memory usage exceeds 256 MB.

#### Persisting data with volumes
- when a pod is deleted or container restarts, any and all data in the container's filesystem is also deleted.
- To perist data in kubernetes, we have persistent storage concept.
- To add volumes to a pod manifest, There are 2 standards to add our configuration.
1. `spec.volume` section. This array defines all of the volumes that may be accessed by containers in the pod manifest. Note that not all containers are required to mount all volumes defined in the pod.
<br>2. `volumeMounts` array in the container definition. This array defines the volumes that are mounted into a particular container and the path where each volume should be mounted. Note that two different containers in a pod can mount the same volume at different mount paths.

```kuard-pod-vol.yml
apiVersion: v1
kind: pod
metadata:
  name: kuard
spec:
  volumes:
    - name: "kuard-data"
    hostPath:
      path: "/var/lib/kuard"
  containers:
    - image: nginx
      name: nginx
      volumeMounts:
        - mountPath: "/data"
          name: "kuard-data"
      ports:
        - containerPort: 8080
          name: http
          protocol: TCP 
```

##### Different ways of using Volumes with pods
- There are variety of ways you can use data in your application. The following are the some of the ways and the recommended patterns for kubernetes:

**1. communication/synchronization**<br>
**2. cache**<br>
**3. Persistent data** <br>
**4. Mounting the host filesystem**<br>

```kuard-pod-full.yml

apiVersion: v1
kind: Pod
metadata:
  name: kuard
spec:
  volumes:
    - name:  "kuard-data"
      nfs:
        server: my.nfs.server.local
        path: "/exports"
  containers:
  - name: kuard
    image: gcr.io/kuard-demo/kuard-amd64:blue
    resources:
      requests:
        cpu: "500m"
        memory: "128Mi"
      limits:
        memory: "256Mi"
        cpu: "1000m"
    ports:
      - containerPort: 8080
        name: http
        protocol: TCP
    volumeMounts:
      - name:  "kuard-data"
        mountPath:  "/data"
    livenessProbe:
      httpGet:
        path: /healthy
        port: 8080
      initialDelaySeconds: 5
      timeoutSeconds: 1
      periodSeconds: 18
      failureThreshold: 3
    readinessProbe:
      httpGet:
        path: /ready
        port: 8080
      initialDelaySeconds: 30
      timeoutSeconds: 1
      periodSeconds: 10
      failureThreshold: 3
      
```

- kubelet daemon is responsible for the containers inside the pods creation as well as performing any health checks defined in the pod manifest.

## 6. labels and annotations
- `labels` are key/value pairs that can be attached to kubernetes objects such as pods and Replicasets. labels provide the foundation for grouping objects
- `annotations` provide a storage mechanism that resembles labels; key/value pairs designed to hold nonidentifying information that tools and libraries 

##### Labels
- labels provide identifying metadata for objects. these are fundamental qualities of the object that will be used for grouping, viewing, and operating.
- 
```
kubectl run alpaca-prod --image=nginx --replicas=2 --labels="ver=1,app=alpaca,env=prod"
kubectl run alpaca-test --image=nginx --replicas=1 --labels="ver=2,app=alpaca,env=test"

# Two deployments
kubectl get deployments --show-labels

```
- we can also apply or update labels on objects after we create them: `kubectl lable deployments alpaca-test "canary=true"`
- `kubectl get deployments -L canary` -> To show label value as a column
- we can remove label by applying a dash suffix. `kubectl label deployments alpaca-test "canary" -`

- if we want to list only pods that have the `ver` level set to `2`, we could use the `--selector` tag.
- if we specify two selectors separated by comma, only the objects that are satisfy both will be returned. This is logical AND operation.
`kubectl get pods --selector="app=bandicoot,ver=2"`

- we can also ask if a label is one of a set of values. Here we are asking for all pods where the app label is set to alpaca or bandicoot 
`kubectl get pods --selector="app in (alpaca,bandicoot)`
- we can ask if a label is set at all. Here we are asking for all the deployments with the canary label set to anything.
`kubectl get deployments --selector="canary"`

|operator|description|
|---|---|
|key=value|key is set in value|
|key!=value|key is not set to value|
|key in (value1, value2)|key is one of value1 or value2|
|key notin (value1, value2)|key is not one of value1 or value2|
|key|key is set|
|!key|key is not set|

- for ex:, asking if a key, in this case canary, is not set can look like:
`kubectl get deployments --selector="!canary"`
- you can combine positive and negative selectors: `kubectl get pods -l 'ver=2,!canary'`

##### label selectors in API Object
- A kubernetes object uses a label selector to refer to a set of other kubernetes objects. Instead of simple string as described in the previous section, we use a parsed structure.

- Most objects support a newer, more powerful set of selector operators. A selector of app=alpaca, ver in (1,2) would be converted to this:

```
selector:
  matchLabels:
    app: alpaca
  matchExpressions:
    - {key: ver, operator: In, values: [1,2]}
```

##### labels in kubernetes architecture:
- labels play a crucial role in linking various related kubernetes objects. Kubernetes purposefully a decoupled system.

- For ex: Replicasets, which create and maintain multiple replicas of a pod, find the pods that they are managing via  selector. likewise, service loadbalancer finds the pods to which it should bring traffic via selector query. when pod is created it can use a nodeselector to identify a particular set of nodes onto which it can be scheduled. when people want to restrict network traffic in their cluster, they use network policy in conjunction with specific labels to identify pods that should or should not allowed to communicate with each other.

##### Annotations
- while labels are used to identify and group objects, annotations are used to provide extra information about where an object came from, how to use it, or policy around that object.when in doubt, add information to an object as an annotation and promote it to a label if you find yourself wanting to use it in a selector
- Annotations are used to :
```
- keep track of a 'reason' for the latest update to an object
- communicate a specialized scheduling policy to a specialized scheduler
- extend data about the last tool to update the resource and how it was updated (used for detecting changes by other tools and doing smart merge)
- attach build, release or image information that isn't appropriate for labels (may include git hash, timestamp, pull request number etc)
- Enable the deployment object to keep track of replicasets that it is managing for rollouts
- provide extra data to enhance the visual quality or usability of a UI. ex: objects could include a link to an icon (or a base64-encoded version of an icon)
- prototype alpha functionality in kubernetes (instead of creating first class API field, the parameters for that functionality are encoded in an annotation)
```
- Annotations are used in various places in kubernetes, with the primary use case being rolling deployments. During rolling deployments, annotations are used to track rollout status and provide the necessary information required to rollback a deployment to previous state.

- To cleanup , `kubectl delete deployments --all`

To sum up, **labels** are used to identify and optionally group objects in kubernetes cluster. They are also used in selector queries to provide flexible runtime grouping of objects, such as pods. <br>
**Annotations** provide object-scoped key/value metadata storage used by automation tooling and client libraries. They can also be used to hold configuration data for external tools such as third-party schedulers and monitoring tools

## 7. Service Discovery
- service discovery tools help solve the problem of finding which processes are listening at which addresses for which services. a good service discovery system will enable users to resolve this information quickly and reliably.

- Real service discovery in kubernetes starts with a service object. A Service object is a way to create a named label selector. 

- To interact with services, we have to do the port-forwarding.
`kubectl port-forward <pod-name> <hostport>:<containerport>`

##### service DNS
- kubernetes provides a DNS service exposed to pods running in the cluster. This kubernetes DNS service was installed as a system component when the cluster was first created. The DNS service is, itself, managed by kubernetes and is a great example of kubernetes building on kubernetes. The kubernetes DNS Service provides DNS names for cluster IP's

- the fqdn would be in the format of <service-name>.<namespace-name>.svc.cluster.local
- By default, services are exposed inside a cluster using clusterIP. if we want to talk with external system we can use Nodeport service. 
- we can do it by adding service type as nodeport 
- `ssh <node> -L 8080:localhost:32711`

##### Load Balancer Integration
- To make service type as loadbalancer we need to make changes in the yaml file
- Creating a service of type loadbalancer exposes that service to the public internet.
- if we did it in right way, then we should be able to see `External-IP` when we give `kubectl describe service <name-of-service>`
- Internal loadbalancing of a service can be done through annotations

##### Endpoints
- some applications want to be able to use services without using a clusterIP. This is done with another type of object called an Endpoint object. For everyservice object, kubernetes creates a buddy endpoints object that contains the IP addresses for that service.
`kubectl describe endpoints <service-name>`

- kubernetes services are built on top of label selectors over pods.This means we can use the kubernetes API to do rudimentary service discovery without using a service object at all.

##### kubeproxy and clusterIP's
- clusterIPs are stable virtual IPs that loadbalance traffic across all of the endpoints in the service. This magic is performed by a component running on every node in the cluster called `kube-proxy`
![alt text](image-7.png)
- kube-proxy watches for new services in the cluster via API server. It then programs a set of `IPtables` rules in the kernel of that host to rewrite the destinations of packets so they are directed at one of the endpoints for that service.if the set of endpoints for a service changes (due to pods coming and going or due to a failed readiness check), the set of iptables rules is rewritten

- The clusterIP itself is usually assigned by API server as the service is created. But, when creating a service, the user can specify a specific cluster IP. once set, the cluster IP cannot be modified without deleting and recreating the service object.

- The kubernetes service address range is configured using the `--service-cluster-ip-range` flag on the kube-apiserver binary. The service address range should not overlap with the IP subnets and ranges assigned to each DOcker bridge or kubernetes node. In addition, any explicit cluster IP requested must come from that range and not already in use.

##### ClusterIP Environmental Variables
- while most users should be using the DNS services to find clusterIPs, there are some older mechanisms that may still be in use. One of these is injecting a set of environmental variables into pods as they start up.

- A problem with environmental variable approach is that it requires resources to be created in a specific order. The services must be created before the pods that reference them. This can introduce quite a bit of complexity when deploying a set of services that make up a larger application. In addition, using just environment variables seems strange to many users. For this reason, DNS is probably a better option.

##### Connecting to Resource outside of a cluster
- when you are connecting kubernetes to legacy resource outside of the cluster, you can use selector-less services to declare a kubernetes service with a manually assigned IP address that is outside of the cluster. That way, kubernetes service discovery via DNS works as expected, but the network traffic itself flows to an external resource.
- To create selector-less service, you remove the `spec.selector` field from your resource, while leaving metadata and the ports sections unchanged. Because your service has no selectors, no endpoints are automatically added to the service. Meaning you must add them manually.
Typically, the end point that you will add will be fixed IP address, so you only need to add it once.
- But, if the IP address that backs the service ever changes, you will need to update the corresponding endpoint resource. To create/update the endpoint resource.


##### Connecting External Resources to Services inside a cluster
- connecting external resources to kubernetes services is somewhat trickier.  
if cloud provider supports it, the easiest thing to do is to create an "internal" loadbalancer, as described above, that lives in your virtual private network and can deliver traffic from a fixed IP address into the cluster. you can then use traditional DNS to make this IP address available to the external resource.
- if an internal loadbalancer isn't available, you can use `nodeport` service to expose the service on the IP addresses of the nodes in the cluster. You can then either program a physical loadbalancer to serve traffic to those nodes, or use DNS-based loadbalancing to spread traffic between the nodes.

- If neither of those solutions works for your use case, more complex options include running the full kube-proxy on external resource and programing that machine to use the DNS server in the kubernetes cluster, such a setup is significantly more difficult to get right and should really only be used in on-premise environments.

## 8. HTTP Loadbalancing with ingress
- 

## 9. Replicasets

## 10. Deployments

## 11. Daemonsets

## 12. Jobs

## 13. configmaps and secrets

## 14. Rolebased access control for kubernetes

## 15. Service meshes

## 16. Integrating storage solutions and kubernetes

## 17. Extending kubernetes

## 18. Accessing kubernetes from common programming language

## 19. Securing applications in kubernetes

## 20. policy and governance for kubernetes clusters

## 21. multicluster application deployment

## 22. organizing your application

