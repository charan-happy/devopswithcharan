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
- Service object operates at Layer 4(according to OSI Model). This means that it only forwards TCP and UDP connections and doesn't look inside of those connections.Because of this, hosting many applications on a cluster uses many different exposed services. 
usually, for services of type : Nodeport, you'll have to have clients connect to a unique port per service. If services are of type : loadbalancer, you'll be allocating  (often expensive or scarce) cloud resources for each service. But, for HTTP (layer7) based services, we can do better.

- kubernetes calls its HTTP-based loadbalancing system **ingress**. Ingress is a kubernetes native way to implement the "virtual hosting" pattern we just discussed. One of the more complex aspects of the pattern is that the user has to manage the loadbalancer configuration file. one of the more complex aspect of the pattern is that the user has to manage the loadbalancer configuration file. 

- The ingress controller is a software system made up of two parts. The first is the **ingress proxy** which is exposed outside the cluster using a service of type loadbalancer. This proxy sends the requests to "upstream" servers. 
- The other component is the **Ingress reconciler or operator**. The ingress operator is responsible for reading and monitoring ingress objects in the kubernets API and reconfiguring the ingress proxy to route traffic as specified in the ingress resource.  

- ingress is a unique system in kubernetes.It is simply a schema, and the implementations of a controller for that schema must be installed and managed separately. But it is also critical system for exposing services to users in a practical and cost-efficient way.

## 9. Replicasets
- A replicaset acts as cluster wide manager, ensuring that the right types and number of pods are running at all times.
- pods managed by replicasets are automatically rescheduled under certain failure conditions, such as node failure and network partitions.
- The actual act of managing the replicated pods is an example of  `reconciliation loop`. 
- **reconciliation loop** is the concept which will make sure that the desired state matches with the current/observed state .
- In addition to supporting modularity, decoupling pods and replicasets enables several important behaviors, which are listed below :
Adopting Existing containers, Quaranting containers, Designing with replicasets,

Note : Usually, we can see applications use deploymnent object because it allows you to manage the release of new versions. Replicasets power deployments under the hood, and it's important to understand how they operate so that you can debug them should you need to troubleshoot.

- when the number of pods in the current state is less than the number of pods in the desired state, the replicaset controller will create new pods using a template contained in the replicaset specification.
- Replicaset uses labels to make sure the desired state matches withe the current state in our cluster. The selector in the Replicaset Spec should be a proper subset of the labels in the pod template.

- To inspect replicaset we can use `kubectl describe rs <name>`
- Sometimes, pod is also manages replicaset. To enable this kind of discovery, the replicaset controller adds an `ownerreferences` section to every pod that it creates.
`kubectl get pods <pod-name> -o=jsonpath='{.metadata.ownerReferences[0].name}'`
- we can scale replicasets up or down by updating the `spec.replicas` key on the replicaset object stored in kubernetes. we can do it imperatively too by giving `kubectl scale replicasets <image> --replicas=4`
- Horizontal autocaling involves creating additional replicas of a pod and vertical scaling involves increasing the resources required for the pod.
- Autoscaling requires the presence of `metrics-server` in your cluster. The `metrics-server` keeps track of metrics and provides an API for consuming metrics that HPA uses when making scaling decesions. To get to know about the metric-server status in our cluster, we can use `kubectl get pods --namespace=kube-system`. Here we should be able to see the pod with starting-name of  "metrics-server"
- To scale replicaset, you can run the command like the following `kubectl autoscale rs <image> --min=2 --max=5 --cpu-percent=80`
`kubectl get hpa`
`kubectl delete rs <name>` --> to delete replicaset  and `kubectl get pods` --> To see the list of pods
- if we don't want to delete the pods that the replicaset is managing, you can set the `--cascade` flag to false to ensure only replicaset object is created and not the pods. `kubectl delete rs <name> --cascade=false`

## 10. Deployments
- Using Deploymnets, we can simply and reliably rollout new software versions without downtime or errors. The actual mechanics of the software rollout performed by a deployment are controlled by a deployment controller that runs in the kubernetes cluster itself. 
```deployment.yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp
spec:
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      selector:
        matchLabels:
          run: myapp
      replicas: 1
      template:
        metadata:
          labels:
            run: myapp 
            
      containers:
      - name: myapp
        image: <Image>
        resources:
          limits:
            memory: "128Mi"
            cpu: "500m"
        ports:
        - containerPort: <Port>
```
- To create deployment, use `kubectl create -f deployment.yml`
- we know that replicasets manage pods. Deployments manage replicasets. this relationship is defined by labels and label selector. We can see label selector by looking at the deploymnet object `kubectl get deployments <name> -o jsonpath --template {.spec.selector.matchLabels}

- we can use label selector to query across replicasets to find that specific replicaset `kubectl get replicasets --selector=run=kuard`

- To resize the deployment, `kubectl scale deployments <name> --replicas=2`
- `kubectl get replicasets --selector=run=myapp` . Note that scaling deployment has also scaled the replicaset
- if we try to scale replicaset directly using `kubectl get replicasets --selector=run=myapp` no changes would be observed because replicasets is managed by its top level resource called deployment.
- if you want to manage replicasets directly, first we need to delete the deployment (remember to set --cascade to false else it will delete the replicaset and pods as well)

```
kubectl get deployments <name> -o yaml > myapp-deployment.yml
kubectl replace -f <deployment>.yml --save-config
```
- To describe the deployment, we can use `kubectl describe deployments <name>`

```
kubectl rollout status deployments <name>

kubectl get replicasets -o wide
kubectl rollout pause deployments <name>
kubectl rollout resume deployments <name>
kubectl rollout history deploymnet <name>
kubectl rollout history deployment <name> --revision=2
kubectl rollout undo deployments <name> 
```
- we can do undo both partially completed and fully completed rollouts. An undo of a rollout is actually simply a rollout in reverse (example from v2 to v1 instead of from v1 to v2)
- we can rollback to a specific revision in the history using `--to-revision` flag.
- `kubectl rollout undo ` is equal to `kubectl rollout undo --to-revision=0`
- wecan set revision history limit too by keeping `revisionHistoryLimit` property with some value that we like in the deployment specification.
**Deployment strategies**

- when it comes to change the version of the software implementing your service. some of the key kubernetes deployment strategies are :
<br>1. Rolling update (default) : It is the default one and new pods are automatically scaled up while old ones are scaled down, minimizing service disruption. It is suitable for most scenarios and suitable for most scenarios and provide balance between downtime and risk mitigation.
<br>2. Recreate : It abruptly deletes all the existing pods and creates new set of pods with updated image. It is faster than rolling updates, but it can have some downtime. it is suitable for stateless applications where downtime is acceptable
<br>3. Blue-green Deployment : This approach involving two identical environments . Where blue(running current version) and green(running new version). once the green environment is verified traffic is switched from blue to green effectively deploying the new version without downtime. These strategy is ideal for high availability applications requiring zero downtime deployments 
<br>4. Canary Deployment : This involves rolling out new version to a small subset of pods initially (canary). if the canary proves stable, the deployment is gradually rolled out to a the remaining pods. This strategy provides low risk approach to test new versions in a production environment before widespread deployment.


## 11. Daemonsets
- Daemonsets provide an easy-to-use abstraction for running a set of pods on every node in a kubernetes cluster or if the case requires it, on a subset of nodes based on labels. 
- The daemonsets provides its own controller and scheduler to ensure key services like monitoring agents are always up and running on the right nodes in your cluster.
- A deamonset is a kubernetes object, which ensures that a copy of a pod is running across a set of nodes in a kubernetes cluster.
- Daemonsets are used to deploy system daemons such a log collectors and monitoring agents. which typically must run on every node.
- Replicasets should be used when your application is completely decoupled from the node and you can run multiple copies on a given node without special consideration.
- Deamonsets should be used when a single copy of your application must run on all or subset of the nodes in the cluster.
- we can use labels to run Daemonset pods on specific nodes. For ex: you may want to run specialized intrusion-detection software on nodes that are exposed to the edge network. You can also use Daemonsets to install software on nodes in a cloud-based cluster. For many cloud services, an upgrade or scaling of a cluster can delete/recreate new virtual machines.

- Daemonsets determine which node a pod will run on at pod creation time by specifying the nodeName field in the pod spec. As a result, pods created by Daemonsets are ignored by the kubernetes scheduler.

```fluentd.yml
apiVersion: apps/v1
kind: Daemonset
metadata:
  name: fluentd
  labels:
    app: fluentd
spec:
  selector:
    matchLabels:
      app: fluentd
  template:
    metadata:
      labels:
        app: fluentd
    spec:
      containers:
        - name: fluentd
          image: fluent/fluentd:v0.14.0
          resources:
            limits:
              memory: 200Mi
            requests:
              cpu: 100m
              memory: 200Mi
          volumeMounts:
            - name:  varlog
              mountPath: /var/log
            - name: varlibdockercontainers
              mountPath: /var/lib/docker/containers
              readOnly: true
      terminationGracePeriodSeconds: 30
      volumes:
        - name: varlog
          hostPath:
            path: /var/log
        - name: varlibdockercontainers
          hostPath:
            path: /var/lib/docker/containers            
```

- Daemonsets require a unique name across all Daemonsets in a given kubernetes namespace.
- `kubectl describe daemonset fluentd` --> To describe the daemonset
- To add labels to a single node, `kubectl label nodes <node-name> ssd=true`
- `kubectl get nodes` 
- `kubectl get nodes --selector ssd=true` --> to fileter nodes based on selector
- **Nodeselectors** can be used to limit what nodes a pod can run on in  a given kubernetes cluster. 
```nginx-fast-storage.yml
apiVersion: apps/v1
kind: Daemonset
metadata:
  labels:
    name: nginx
    ssd: true
  name: nginx-fast-storage
spec:
  selector:
    matchLabels:
      app: nginx
      ssd: "true"
  template:
    metadata:
      labels:
        app: nginx
        ssd: "true"
    spec:
      nodeSelector:
        ssd: "true"
      containers:
        - name: nginx
          image: nginx:1.10.0
```
- Updating daemonset can be done vi rolling update strategy, There are two parameters that control the rolling update of a Daemonset:

`spec.minReadySeconds` - Determines how long a pod must be "ready" before the rolling update proceeds to upgrade subsequent pods.  
`spec.updateStrategy.rollingUpdate.maxUnavailable` indicates how many pods may be simultaneously updated by the rolling update.

`kubectl rollout status daemonSets <daemonset-name>` To see the status of daemonset update

- To delete a deamonset, we have to use `kubectl delete -f fluentd.yml`
- Deleting daemonset will also delete all the pods being managed by that daemonset. Set the `--cascade` flag to false to ensure only the daemonset is deleted and not the pods.


## 12. Jobs
- The job object is responsible for creating and managing pods defined in a template in the job specification. These pods generally run until successful completion. The job object coordinates running a number of pods in parallel.
- There is a chance that your job will not execute if the scheduler does not find the required resources. Also, due to the nature of distributed systems, there is a small chance that duplicate pods will be created for a specific task during certain failure scenarios.

##### Job patterns
|Type|Use case|Behaviour|completions | Parallelism |
|---|---|---|---|
|One shot|Database Migrations|A single pod running once until successful termination|1|1|
|Parallel fixed completions|Multiple pods processing a set of work in parallel|One or more Pods running one or more times until reaching a fixed completion count|1+|1+|
|Work Queue parallel jobs|Multiple pods processing from a centralized work queue|one or more pods running once until successful termination|1|2+|

**One Shot**
- A job can fail for any number of reasons, including an application error, an uncaught exception during runtime, or a node failure before the job has a chance to complete. In all cases, the job controller is responsible for re-creating the pod until a successful termination occurs.
- There are multiple ways to create a one-shot job in kubernetes. The easiest is to use kubectl command line utility
```
kubectl run -i oneshot --image=gcr.io/kuard-demo/kuard-amd64:blue --restart=onFailure --command /kuard -- --keygen-enable --keygen-exit-on-complete --keygen-num-to-gen 10
```
- To see the completed jobs in the terminal, we have to use `kubectl get jobs -a`
- Because jobs have a finite beginning and endings, users often create many of them. This makes picking unique labels more difficult and more critical. For this reason, the job object will automatically pick a unique label and use it to identify the pods it creates. IN advanced scenarios (such as swapping out a running job without killing the pods it is managing) users can choose to turn off this automatic behavior and manually specify labels and selectors.

- we can clean multiple resources at a time, by using the command `kubectl delete rs,svc,job -l chapter=jobs`

**cronjobs**
- Sometimes, we may want to schedule a job to run at a certain interval. To achieve this, you can declare a CronJob in kubernetes, which is responsible for creating a new job object at a particular interval. 
```cronjob.yml
apiVersion: batch/v1
kind: Cronjob
metadata:
  name: example-cron
spec:
  schedule: "0 */5 * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
            - name: batch-job
              image: my-batch-image
          restartPolicy: OnFailure
```
- To get details of the cronjob, we can use `kubectl describe <cron-job>`


## 13. configmaps and secrets
- configmaps are used to provide configuration information for workloads. This can be either fine-grained information like a string or a composite value in the form of a file
- Secrets are simmilar to configmaps but focus on making sensitive information available to the workload. They can be used for things like credentials or TLS certificates
- The key thing to note w.r.to. configmaps is that configmap is combined with the pod right before it is run. This means that the container image and the pod definition can be reused by many workloads just by changing the ConfigMap that is used.

`kubectl create configmap my-config --from-file=my-config.txt --from-literal=extra-param=extra-value --from-literal=another-param=another-value` 

**Using a ConfigMap**
- There are 3 main ways to use a configmap:
<br>1. Filesystem : You can mount a configMap into a pod. a file is created for each entry based on the key name. The contents of that file are set to the value
<br>2. Environment variable : A configmap can be used to dynamically set the value of an environment variable
<br>3. Command-line argument: kubernetes supports dynamically creating the command line for a container based on configMap values.

```kuard-config.yml
apiVersion: v1
kind: pod
metadata:
  name: kuard-config
spec:
  containers:
    - name: test-container
      image: gcr.io/kuard-demo/kuard-amd64:blue
      imagePullPolicy: Always
      command:
        - "/kuard"
        - "$(EXTRA_PARAM)"
      env:
        - name: ANOTHER_PARAM
          valueFrom:
            configMapKeyRef:
              name: my-config
              key: another-param
        - name: EXTRA_PARAM
          valueFrom:
            configMapKeyRef:
              name: my-config
              key: extra-param
      volumeMounts:
        - name: config-volume
          mountPath: /config
    volumes:
      - name: config-volume
        configMap:
          name: my-config
    restartPolicy: Never
```

- secretes enable container images to be created without bundling sensitive data. This allow containers to remain portable across environments. Secretes exposed to pods via explicit declaration in pod manifests and the kubernetes API. 
- In this way, kubernetes secrets API provides an application centric mechanism for exposing sensitive configuration information to applications in a way that's easy to audit and leverage native OS isolation primitives.
-  By default, kubernetes secrets are stored in plain text in the etcd storage for cluster. Depending on your requirements, this may not be sufficient security for you.
- To overcome it, in recent versions of kubernetes, support has been added for encrypting the secrets with a user-supplied key, generally integrated into a cloud key store. Additionally, most cloud keystores have integration with kubernetes secrets store CSI Driver volumes, enabling you to skip kubernetes secrets entirely and rely exclusively on the cloud provider's key store.

- First step in creating a secret is to obtain the raw data we want to store. The TLS key and certificate for the Kuard application can be downloaded by running the following commands:
```
curl -o kuard.crt https://storage.googleapis.com/kuard-demo/kuard.crt
curl -o kuard.key https://storage.googleapis.com/kuard-demo/kuard.key
```

with kuard-crt and kuard.key files stored locally, we are ready to create a secret.
`kubectl create secret generic kuard-tls --from-file=kuard.crt --from-file=kuard.key`
- kubectl describe secrets kuard-tls
- secrets can be consumed using the Kubernetes REST API by application that know how to call the API Directly. However, our goal is too keep application portable. Not only should they run well in kubernetes, but they should run, unmodified, on other platforms.
- Instead of accessing secrets through API server, we can use a `secret volume`. secret data can be exposed to pods using the Secrets volume type. Secrets volumes are managed by the kubelet and are created at pod creation time. secrets are stored on tmpfs volumes (aka RAM disks) and as such are written to disk on nodes.
- Each data element of a secret is stored in a separate file under the target mount point specified in the volume mount.

```kuard-secret.yml
apiVersion: v1
kind: pod
metadata:
  name: kuard-tls
spec:
  containers:
    - name: kuard-tls
      image: gcr.io/kuard-demo/kuard-amd64:blue
      imagePullPolicy: Always
      volumeMounts:
        - name: tls-certs
          mountPath: "/tls"
          readOnly: true
  volumes:
    - name: tls-certs
      secret:
        secretName: kuard-tls
```
`kubectl apply -f kuard-secret.yml` and to connect `kubectl port-forward kuard-tls 8443:8443`

**Private Container Registries**
- A special use case for secrets is to store access credentials for private container registries. Kubernetes supports using images stored on private registries, but access to those images requires credentials. 
- Private images can be stored across one or more private registries. This presents a challenge for managing credentials for each private registry on every possible node in the cluster.
- `Image pull secrets` leverage the secrets API to automate the distribution of private registry credentials.
- Image pull secrets are stored just like regular secrets but are consumed through the `spec.imagePullSecrets` pod specification field
`kubectl create secret docker-registry my-image-pull-secret --docker-username=<user-name> --docker-password=<password> --docker-email=<email>`

```kuard-secret-ips.yaml
apiVersion: v1
kind: pod
metadata:
  name: kuard-tls
spec:
  containers:
    - name: kuard-tls
      image: gcr.io/kuard-demo/kuard-amd64:blue
      imagePullPolicy: Always
      volumeMounts:
        - name: tls-certs
          mountPath: "/tls"
          readOnly: true
  imagePullSecrets:
    - name: my-image-pull-secret
  volumes:
    - name: tls-certs
      secret:
        secretName: kuard-tls
```
- if you are repeatedly pulling from the same registry, you can add the secrets to the default service account associated with each pod to avoid haviing to sepcify the secrets in every pod you create
- The maximum size for configMap or secret is 1 MB
- when selecting a keyname, remember that these keys can be exposed to pods via volume mount. pick a name that is going to make sense when specified on a command line or in a config file. Storing a TLS key as key.pem is clearer than tls-key when configuring applications to access secrets.

```
configMap and Secret key examples
--------------------------------
valid keyname | invalid key name
--------------------------------
.auth_token | Token...properties
--------------------------------
key.pem | auth file.json
--------------------------------
config_file | _password.txt
```

**managing ConfigMaps and Secrets**
- ConfigMaps and secrets are managed through the kubernetes API. The usual create, delete, get, describe commands work for manipulating these objects.
- `kubectl get secrets`, `kubectl get configmaps`, `kubectl describe configmap my-config`

- The easiest way to create a secret or configmap is via `kubectl create secret generic <flag>` or `kubectl create configmap <flag>`
flags can be replaced with any of the below

```
--from-file=<file-name> --> Load from the file with the secret data key that's the same as the filename
--from-file=<key>=<filename> --> load from the file with the secret data key explicitly specified
--from-file=<directory> --> load all the files in the specified directory where all the filename is an acceptable keyname
--from-literal=<key>=<value> --> use the specified key/value pair directly
```

**updating**
- we can update a configmap or secret and have it reflected in running applications. there is no need to restart if the application is configured to reread configuration values.There are 3 ways to update  
1. update from file  
2. Recreate and update: if we store the inputs into configmaps/secrets as separate files on disk (as opposed to embedded into yaml directly). we can use kubectl to re-create the manifest and then use it to update the object
```
kubectl create secret generic kuard-tls --from-file=kuard.crt --from-file=kuard.key --dry-run -o yaml | kubectl replace -f -
```

3. Edit current version  

- once the configmap or secret is updated using the API, it'll be automatically pushed to all volumes that use that configmap or secret. using this live update feature, we can update the configuration of applications without restarting them.

- currently there is no built-in way to signal an application when a new version of a configmap is deployed. It is up to the application (or some helper script) to look for the config files to change and reload them

## 14. Rolebased access control for kubernetes
- Rolebased access control provides a mechanism for restricting both access to and actions on kubernetes APIs to ensure that only authorized users have access. RBAC is a critical component to both harden access to the kubernetes cluster where you are deploying your application and (possibly more impotantly) prevent unexpected accidents where one person in the wrong namespace mistakenly takes down production when they think they are destroying their test cluster.

- Every Request to kubernetes is first `authenticated`. Authentication provides the identity of the caller issuing the request. It could be simple as saying that the request is unauthorized, or it could integrate deeply with a pluggable authentication provider (e.g., Azure Active Directory) to establish an identity within that third-party system .kubernetes doesnot have a built-in identity store, foucsing instead on integrating other identity sources within itself

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


k -n project-hamster create role processor \
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

## 15. Service meshes

## 16. Integrating storage solutions and kubernetes

## 17. Extending kubernetes

## 18. Accessing kubernetes from common programming language

## 19. Securing applications in kubernetes

## 20. policy and governance for kubernetes clusters

## 21. multicluster application deployment

## 22. organizing your application

