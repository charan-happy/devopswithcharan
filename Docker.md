# Docker

what is Docker ?

what is container ?

Docker images ?

Basic Docker commands

Docker Networking

Docker volumes

Docker build

Docker file

Docker compose

Docker troubleshooting

Docker swarm

********************************What is docker ?********************************

→ Docker is a set of platform as a service (PaaS)  products that use OS level virtualization to deliver software packages called ********************containers********************

→ Docker is a software platform for building applications based on containers —small and lightweight execution environments that make shared use of operating system kernel but otherwise run in isolation from one another.

| Docker | virtual machine |
| --- | --- |
| Lightweight  | High weight |
| virtualizes application layer | Virtualizes OS layer |
| Runs as another application on OS | Runs as a machine |
| A app of any OS cannot run on any OS | A VM of any OS can run on any OS |
| Docker Toolbox | Virtual Box |

******************************************what is a container ?******************************************

→ container is a way to package applications with all the necessary dependencies and configuration.

→ This package is portable and easily sharable.

→ They are layers of images stacked on top of each other.

→ The base OS image would be very small in size (alpine linux)

→ on top of it we will have an application layer (configuration data)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d8e2d287-4b83-405a-82d2-95a425c7d915/Untitled.png)

**************Docker Image :**************

- A docker image is a read-only template that contains a set of instructions for creating a container that can run on the docker platform.
- It provides a convenient way to package up applications and preconfigured server environment, which you can use for your own private use or share publicly with other Docker users.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7c14e929-7b22-4cdc-af44-a55110dc7285/Untitled.png)

************************************************Docker image/container image ?************************************************

- 

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/3708d8e6-73e9-4d05-a2f0-3af94b7f6377/Untitled.png)

- Every image has layers.

docker —version —> To check docker version

docker login —> to login to dockerhub

docker logout

docker search <imagename> —> To search for a docker image in hub via cmd

docker pull —> To get images from docker hub

docker inspect —> to inspect a container/image

docker pull <imagename>:<version number> —> To download an image

[no version number mentioned, latest one will be downloaded]

docker rmi <image name.> —> To remove an image

docker images —> To see the list of images

docker ps —> To see the list of running containers

docker ps -a —> To see the list of containers along with stopped containers

docker history —> to see the history of commands

docker create <image id> —> To create a container from image

docker start <container id> —> To start container

docker run —> to run a container

docker exec -it <container id> /bin/bash —> To enter into the interactive terminal of docker

docker stop —> to stop a container

docker kill —> To kill a container

docker create - -name <custom name> <image name> —> To assign custom name to a container

****what is the difference between docker run and docker create ?****

- `docker create` is used to create a container without starting it, while `docker run` is used to create and start a container in one command.

**************************************Docker Networking :**************************************

---

- ************Bridge************
    - The bridge driver creates an internal network within a single docker host. Containers placed within this network can communicate with each other but are isolated from containers, not on the internet network. Bridge is the default driver when running single containers or when using docker-compose
- ********Host********
    - When using the host driver, the container shares the network stack of the Docker host -appearing as if the container is the host itself, from a networking perspective
- ********None********
    - The none driver simply disables networking for a container, making it isolated from other containers.
- **Overlay network**: This type of network enables communication between containers running on different Docker hosts.
- **Macvlan network**[: This type of network allows you to assign a MAC address to a container, making it appear as a physical device on your network](https://linuxcent.com/docker-networking-basics-and-the-types-of-networks/)

docker network ls —> To check network in docker

- By default docker make use of Bridge network

docker inspect network —> to inspect Docker network

docker network rm <network name>

docker run -d - -name <default image name> - -net host <image name>

docker run -d - -name <default image name> - -network=host <image name>

docker run -d - -name <default image name> - -net none <image name> —> To run container in none driver network.

****************************************************************What are the volumes in docker ?****************************************************************

To create a docker volume use the below command

---

docker volume create <volume name>

docker volume ls

docker volume inspect <volume name/id> —> To inspect docker network

Mounting a volume using  -v or - -mount

docker run -it - -name=<custom container name> - -mount source=<volume name>,destination=/data centos

docker run -it - -name <custom container name> -v <volumename>:/data centos [location where we wanted to put data  and the image name]

docker run -it - - volume-from <container name> - -name <new container name> centos /bin/bash

centos is the image above

**Mounting a host directory as a data volume**

mkdir files

cd files

touch file.txt

docker run -it -name <container name> -v “$(pwd)”:/data1 centos

**********what is the default volume location in docker ? /var/lib/docker/volumes**********

docker rm $(docker ps -a -q)—> To remove all the containers at a time

docker volume prune —> To delete all the volumes which are not used by atleast one container

docker volume rm <volume id> —> To remove the volume

****************************Docker build ?****************************

********************************************************How to build a docker image******************************************************** 

**Dockerfile** 

**********************************************************************************************************************FROM********************************************************************************************************************** defines the base image used to start the build process

******************************************************************************ADD****************************************************************************** copies the files from a source on the host into the container’s own filesystem at the set destination

************************************************************************************************************************************************************COPY************************************************************************************************************************************************************ copies the files from a source on the host into the container’s own filesystem at the set destination

********CMD******** can be used for executing a specific command within a container

********************************************************ENTRYPOINT******************************************************** sets  a default application to be used every time a container is created with the image

************************************************ENV************************************************ sets environment variables

******************EXPOSE****************** associates a specific port to enable networking between the container and to the outside

********RUN******** is the central executing directive for Dockerfiles

**************USER************** sets the UID (or Username) which is to run the container

**************VOLUME************** is used to enable access from the container to a directory on the host machine

****************WORKDIR**************** sets the path where the command, defined with CMD, to be executed

**************LABEL************** allows you to add a label to your docker image.

one we have written our docker file, we have to build it by using below commands

********************************************************docker build -t accountname/imagename .********************************************************

- . is to pick the current directorie’s docker file.

docker tag <image name> <imagename:tag>

docker push <imagename:tag> —> To push image from local to docker hub

************************************************************************************************************************what is the difference between docker add and docker copy ?************************************************************************************************************************

- If you build container images using **Dockerfiles,** you’ve most likely ****encountered the Docker instructions ADD and COPY. ADD and COPY both provide a similar function, in that they both allow you to get folders and files into your images at build time
    
    ************************Docker Add ;************************
    
    - Add uses two arguments 1. Source and 2. Destination
        - The source argument will work with all types of files and is relative to build context
        - The destination argument can be an absolute path or relative path to ****************WORKDIR.****************
    - Add also supports downloading files from remote URLs.
    - ADD can also automatically extract various types of archives into the image.
        - If the source you provide is an archive compressed with tar, gzip, bzip2, or xz, ADD will automatically extract the archive into the provided destination. It should be noted it determines the type of archive by the contents, not simply by using the file extension.
    
    ****************Docker COPY ;****************
    
    - It has two arguments as well: source and destination.
    - However, the COPY instruction is more straightforward and doesn’t have some of the extra features of ADD. COPY will not work with a URL, and
    - ****It also copies archives as-is rather than trying to extract them.

**********************************why do ADD and COPY do the same thing ?**********************************

- the greater opinion was that ADD was trying to do too much. So the new instruction COPY was added into Docker. ADD is kept as an instruction as to not break backwards compatibility — plus some developers like the additional features provided by ADD.

****************************when should you use ADD and when should you use COPY ?****************************

- You may want to use ADD for the remote URL feature or uncompressing of archives. An unintentional ADD instead of COPY instruction can mean the difference between a functional image and a “broken” one.
- For example you need to have a tar archive in your image as an archive. If you accidentally use ADD you will end up with the contents of the archive and not the actual image.
- With regards to the remote URL feature of ADD, you might be better off using a RUN instruction and providing the command curl or wget to download the file and then follow that command with a tar or unzip (if it’s an archive file), or other commands you may need to run for your image. This method results in fewer instructions and fewer instructions creates smaller images.

**************************************************Difference between CMD and ENTRYPOINT in docker file ?**************************************************

- In a dockerfile, ENTRYPOINT and CMD are two instructions that define the process running in the container.

| CMD | ENTRYPOINT |
| --- | --- |
| CMD is used to define default commands and/or parameters for a container | ENTRYPOINT is preferred when you want to define a container with a specific executable. |
| It is best to use CMD if you need a default command that users can easily override. | You cannot override an ENTRYPOINT when starting a container unless you add the - -entrypoint flag.  |
| If dockerfile has multiple CMDs only the instructions from the last one apply | combine ENTRYPOINT with CMD If you need a container with a specified executable and a default parameter that can be modified easily |

https://github.com/narayanacharan/mern_docker_demo.git

********************************************************Project : Multicontainer app********************************************************

→ Go to the docker host

→ $ docker images ; $ docker ps -a ; $ docker network ls ; $ docker volume ls ; $ mkdir docker ; $ cd docker

—> $ git clone https://github.com/narayanacharan/mern_docker_demo.git

—> $ ls

—> $ cd mern_docker_demo

—> $ docker images

—> $ docker network create library-mern-api

—> $ docker network ls

—> $ docker volume create mongodb-data

—> $ docker volume ls

—> $ docker images

—> $ docker run -dit -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password -e PWD=/  -v mongodb-data:/data/db - -name mern_library_nginx_mongodb_1 - -net library-mern-api mongo

—> $ docker images

—>$ docker ps

—>$ docker run -dit -p 8081:8081 -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin -e ME_CONFIG_MONGODB_ADMINPASSWORD=password - -net library-mern-api - -name mern_library_nginx_mongo_express_1 -e ME_CONFIG_MONGODB_SERVER=mern_library_nginx_mongodb_1 -e ME_CONFIG_BASICAUTH_USERNAME=admin -e ME_CONFIG_BASICAUTH_PASSWORD=admin123456 mongo-express

$ docker images

$ docker ps

$ ifconfig

$ docker images

$ ls

$ cd server

$ docker build -t mern_library_nginx_library-api .

$ cd client

$ ls

$ docker build -t mern_library_nginx_client .

$ docker images

$ cd ..

$ ls

$ cd nginx

$ ls

$ docker build -t mern_library_nginx_nginx .

$ cd ..

$ cd server

$ ls

$ docker run -dit -p 5000:5000 -e MONGO_URI=mongodb://admin:password@mern_library_nginx_mongodb_1 -e NODE_ENV=development -e PWD=/app -v “$(pwd)”:/app -v “$(pwd)”/node_modules:/app/node_modules - -net library-mern-api - -name library_mern_nginx mern_library_nginx_library-api

$  cd ..

$ cd client

$ ls

$ docker run -d -v “$(pwd)”:/app -v “$(pwd)”/node_modules:/app/node_modules - -net library-mern-api - -name library_mern_frontend mern_library_nginx_client

$ docker ps

$ docker run -d -p 8080:80 - -name mern_library_nginx_nginx_1 - -net library-mern-api mern_library_nginx_nginx

$ docker ps

$ docker logs mern_library_nginx_mongodb_1

$ docker ps

$ docker logs mern_librarry_nginx_nginx_1

$ docker logs library_mern_frontend

$ docker logs library_mern_nginx

************************************************What is Docker Compose ?************************************************

- Docker compose is a tool that allows you to define and run multi-container docker applications
- It allows you to define the services, networks, and volumes that make up your application in a declarative YAML file, which can then be used to spin up and manage the containers that make up your application
- Using docker compose, you can define a group of related services that can be run together in a single environment, making it easier to manage complex applications with multiple components.
- For EX: you can define a web application with a web server, a database, and a caching layer as separate services, each running in its own container.

$ apt install docker-compose —> To install docker compose

$ docker-compose - -version

filename must be docker-compose-<our choice>.yaml/yml

$ docker-compose -f filename up —>special way

ex : docker-compose -f docker-compose-file.yml up

$ docker-compose up —> Default way

```yaml
version: "3.7"

services:
	library-api:
		image: library-api
	
	mongodb:
		image: mongo

	mongo-express:
		image: mongo-express

	client:
		image: client
	
	nginx:

networks:
	library-mern-api:
		driver:bridge

volumes:
	mongodb-data:
		driver: local
```

$ docker images

$ docker ps -a

$ docker volume ls

$ docker network ls

$  docker-compose up

$ docker images

$ docker ps -a

$ docker volume ls

$ docker network ls

$ docker volume prune

$ docker network prune

$ docker rmi $(docker images -q)

**Docker Troubleshooting** 

************************Logs, Exec & Restart Policies************************

$vdocker logs <container name>

$ docker exec -it <container name> <command>

$ docker rename <old_container_name> <new_container>

—> Entry point must always run at foreground , if it runs at background then the container will be killed.

**********************Restart Policies :**********************

********no :******** The default behavior is to not start container automatically

****************always :**************** Always restart a stopped container unless the container was stopped explicitly

************unless-stopped:************ Restart the container unless the container was in stopped state before the docker daemon was stopped 

******************on-failure:****************** Restart the container if it exited with a non-zero exit code or if the docker daemon restarts.

**Docker Swarm**

********How it is different from Docker Swarm ?********

- Docker swarm is a product from Docker and it is free and opensource provides features as like kubernetes for container orchestration

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7bf26ae3-9d4e-446b-94aa-960111fc4ad3/Untitled.png)

service is a collection of multiple containers.

Task is a deployment/request

**************stack :**************

- In docker swarm, a stack is a way to define and manage a group of services that are deployed together as a single unit.
- It allows you to define an application’s services, networks, and volumes in a declarative YAML file called ************************compose file************************
- A stack is created and deployed using the docker stack deploy command, which takes a compose file as input and deploys the defined services onto the docker swam cluster
- When deploying a stack, Docker swarm orchestrates the creation and management of the services, ensuring that they are distributed across the cluster’s nodes according to the defined constraints and availability requirements.
- It handles scaling, load balancing, service discovery, and other orchestration tasks for the services within the stack

********************************Services and Tasks********************************

Docker containers are launched using services

- There are two types of service deployments, replicated and global
- For a ****************************************replicated service,**************************************** you specify the number of identical tasks you want to run, for ex: you decide to deploy an HTTP service with three replicas, each serving the same content
- A ****global service**** is a service that runs one task on every node. There is no pre-specified number of tasks. Each tiem you add a node to the swarm, the orchestration creates a task and the scheduler assigns the task to the new node.
- Good candidates for global services are monitoring agents, anti-virus scanners or other types of containers that you want to run on every node in the swarm.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b54bff15-0e10-43ce-8166-5cf02262e5c0/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a9928dd3-c3be-4c49-b5e9-e927094edc05/Untitled.png)

- A **********task********** is the atomic unit of scheduling within a swarm. when you declare a desired service state by creating or updating a service, the orchestrator realizes the desired state by scheduling tasks, for instance, you define a service that instructs the orchestrator to keep three instances of an HTTP listener running at all times.
- the orchestrator responds by creating three tasks. Each task is a slot that the scheduler fills by spawning a container. The container is the instantiation of the task.
- If an HTTP listener task subsequently fails its health check or crashes, the orchestrator creates a new replica task that spawns a new container.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9ff920e2-0f84-41f4-8a3e-4c449e18b06a/Untitled.png)

**********************************************DOCKER Swarm Features :**********************************************

- ****************************************Centralized access :**************************************** Swarm makes it very easy for teams to access and manage the environment
- **************************High Security :************************** Any communication between the manager and client nodes within the swarm is highly secure
- ************************************Autoload balancing :************************************ There is autoload balancing within your environment, and you can script that into how you write out and structure the swarm environment
- ********************************High scalability :******************************** loadbalancing converts the swarm environment into highly scalable infrastructure
- ******************************Rollback a task : swarm****************************** allows you to rollback environments to previous safe environments.

$ docker swarm init - -advertise-addr <ipaddress>

$ docker swarm join - -token <tokenid>

$ docker node ls

$ docker run -it - -rm - -name swarmpit-installer - -volume /var/run/docker.sock:/var/run/docker.sock swarmpit/install:1.9

$ docker service create - -name helloworld alpine ping docker.com

$ docker service ls

$ docker node inspect node-name - -format “{{.status.state }}”

$ docker stack deploy -c docker-compose.yml mern_stack

$ docker stack ls

$ docker stack services mern_stack

$ docker stack ps mern_stack

$ docker stack rm mern_stack

$ docker network ls

$ docker network create -d overlay network

$ docker network rm network1

$ docker stats

$ docker service logs service_name

$ docker swarm leave

$ docker node rm <node name>

$ docker swarm leave - -force - removes master

$ docker run -it - -rm - -name swarmpit-installer - -volume /var/run/docker.sock:/var/run/docker.sock swarmpit/install:1.9

$ 

**********stack********** -combination of one or more services, networks, volumes

****************services**************** - is a combination of one or more tasks

**********tasks********** -is a definition to deploy a container

********************************************************container******************************************************** -Instances of task

kuberntes is a feature rich application and it allows to integrate multiple applications /platforms.

Interview preparation

https://youtu.be/Pp4SZn2PiEo?si=EoNR7puAiASVZcwb