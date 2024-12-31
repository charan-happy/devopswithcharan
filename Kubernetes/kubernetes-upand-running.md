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

##### Cluster components

  |||
  |||
  
  
  
