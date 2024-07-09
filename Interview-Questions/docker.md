what is docker architecture ?  
what is docker lifecycle ?  
what is dockerfile and docker compose file  
explain various layers in dockerfile
what is docker networking ? tell me various types of network in docker
what is default network in docker
how one container talks to another container
how to debug container
what is docker swarm
Tell some commands in docker
what is difference between ADD/COPY, CMD/ENTRYPOINT, RUN/CMD
Tell the docker file best practices
How to reduce a docker file size
How to store the docker file in jfrog/dockerhub
How to create a docker image if no internetconnectivity is there
write a docker file and state various layers and use the depends_on concept
How to save a container as image and then as a zip file
what are docker volumes

## Docker Interview Questions

- What is a Dockerfile?
- What is multi-stage in Docker?
- What is a Docker volume and how do you use it?
- How can we pass an argument to Dockerfile?
- Dockerfile runs as which user?
- How do you push the image to Docker Hub?
- Write a Dockerfile for a Java-based application.
- What is Docker Compose?
- How is Docker integrated in Jenkins?
- Please explain Docker networking.
- Can you use multiple FROM statements in a Dockerfile?
- What is the difference between RUN and CMD?
- Write a Dockerfile for an Nginx application.
- What is the difference between Docker images and Docker containers?
- What are the benefits and use cases of using multi-stage builds in Docker?
- How does Docker handle resource limitations and isolation, such as CPU, memory, and I/O?
- Docker command: COPY vs ADD.
- ENTRYPOINT vs CMD in Dockerfile.
- Tell us something about Docker Compose.

<details><summary> 1.what is the difference between Virtualization and containerization </summary> </details>

<details><summary>2. how to do the port mapping to the container </summary> we will do `docker -p [host-port]:[container-port] option</details>
<details><summary>3. How do you get the shell access of a running container </summary> we need to give docker exec -it <containerid> bash command to get inside of the container. Here t for terminal</details>
<details><summary>4. What is the difference between RUN and CMD? </summary> Run is the instruction executed at the time of image creation and CMD is the instruction executed at the time of container creation.CMD command keep container running Run is used to install package, cofnigure something at the time of image creation</details>
<details><summary>5. what is dockerfile? </summary>Dockerfile is the declarative way of creating our own images. We need ot use Dockerfile instructions to create the image. Declarative means whatever we write we will get that provided we follow correct syntax</details>
<details><summary>6. How do you build Docker images? </summary> We need to use docker build -t <repo-url>/<username>/<imagename>:version . We should have dockerfile available in the directory where we run docker build command</details>
<details><summary>7. what is the difference between ADD and COPY ? </summary>Both are doing same, COPy copies the files from local to container. But, ADD has some extra capabilities:
1, ADD can download the resources from the internet to container <br>2. ADD can directly unzip the file into the container if it is recognized format </details>
<details><summary>8. what is the difference between the CMD and ENTRYPOINT</summary>CMD and ENTRYPOINT both are useful to run the container. But there are few difference. 1. CMD can be overridden, ENTRYPOINT can't be overridden 2. If you try to override ENTRYPOINT it will go and append 3. we can mix CMD and ENTRYPOINT for best results 4. We can provide default arguments through CMD to ENTRYPOINT 5. Users can override those default arguments at runtime from the commnand line</details>
<details><summary> 9. What is the difference between ARG and ENV ?</summary></details>
<details><summary>10. What are docker volumes </summary>< Docker by 
default removes the data when it is deleted. So when we are running stateful applications like databases we need to use docker volumes that will not delete the data after the container is deleted.

```
- To create named volume `docker volume create <name-of-volume>
- docker volume ls
- docker run -v <name-of-volume>:<container-path> <image>:<version>
```
</details>
<details><summary>11. Tell us the best practices you implemented while creating docker images </summary> 1. user lightweight base images like alpine, busybox etc 2. Multistage builds, remove unncessary installations. 3. Non-root users 4. use volumes for stateful applications 5. use docker compose 6. Use env variables instead of hard coding 7. use dedicated custom networks 8. Don't keep secrets in images 9. Scan the images and fix vulnerabilities 10. Limit resources CPU, RAM 11. Configure health checks</details>
<details><summary>12. what are multi stage builds? </summary> Multistage builds are used to reduce the imagesize and remove the unncessary installations . We will have 2 Dockerfiles with one as builder and another as actual Dockerfile. 

```Dockerfile
FROM debian:10 AS build
RUN apt-get update && apt-get -y install maven
WORKDIR /opt/shipping
COPY pom.xml /opt/shipping/
RUN mvn depedency:resolve
COPY src /opt/shipping/src/
RUN mvn package

FROM openjdk:8-jre-alpine
EXPOSE 8080
WORKDIR /opt/shipping
ENV CART_ENDPOINT=cart:8080
ENV DB_HOST=mysql
COPY --from=build /opt/shipping/target/shipping-1.0.jar shipping.jar
CMD ["java", "-Xmn256m", "-Xmx768m", "-jar", "shipping.jar" ]
```
</details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>
<details><summary> </summary></details>

Roles and Responsibilitis in SonarQube Server
---------------------------------------------

Install the SonarQube Server

Configure Sonarqube Server Details in pom.xml

Creating  Users / Configure LDAP Server

Creating Groups

Create the Quality Profiles as per Project requirement.

Create the Quality Gates as per Project requirement.

Roles and Responsibilitis in Nexus Server
-----------------------------------------

Install the Nexus Server

Create the Repositories (Maven2 - hosted,Proxy and group, Docker)

Configure Nexus Repository Details in pom.xml and credentails in settings.xml
--------------------------------------------------------------------------------------
Creating  Users / Configure LDAP Server
--> docker build -t Hostname/ip ofRepo:port/Appname:version . 
ex: docker build -t 123.455.697.56:8081/appname:1 for private repo
    docker build -t vithalterdal/appname . (for docker repo)

Dockerfile
-----------
FROM tomcat:8.8.20-jre8
COPY target/*.war /user/local/tomcat/webapps/appname.war

incase of public Repo
docker login -u vithalterdal -p *****


incase of Private Repo
docker login -u vithalterdal -p ***** <URL> 
Ex: docker login -u admin -p admin123 nexus.tcs.com
Ex: docker login -u admin -p admin123 198.789.321.12:8083

Qtn: How can you move your image from 1 server to another server without repository

Ans:(docker save to docker load and SCP)
1) Create tar file with command
docker save imagename -o newimagename.tar
2) SCP from 1server to another server
3) docker load -i newimagename.tar

Qtn: What is dangling images
 Ans : The images which is not taged to any repository it contains only image name is called danglig images

Qtn:Home directory of docker ?
Ans : /var/lib/docker
Commands
docker logs container_name
docker inspect container_name

Qtn: How to trouble shoot the containers?
Ans: Docker logs container_id
by system error and system out we will find the errors
and check docker proccess
docker top container_id--to check process on which container
docker stats container_id to see cpu utilization it will show max and used memory and cpu utilization defualt merory is 983mb~1Gb

Qtn: How to execute some commands on running container
Ans: docker exec container_name linuxcommand
     docker exec appname ls / ----->tocheck root directory
     docker exec appname ls
     docker exec appname pwd
     docker exec appname cat /etc/*release
  **all the containers uses system kurnels
Qtn: How to login into a container
Ans: docker exec -it container_name /bin/bash

If some containers not having bash then
     docker exec -it container_name /bin/sh
Qtn:  How to copy files from container to system or system to container
Ans: docker cp containername:/usr/local/tomcat/logs/catalina.out cat.out(for current directory)--cont to system
     docker cp file.txt containername:/usr/local/tomcat/logs/test.txt

Qtn: docker kill vs docker stop
Ans: docker stop will send SIGTERM and SIGKILL after grace period
     docker kill will send SIGKILL

Dockerfile--> Dockerfile is the input for the docker images.
In Dockerfile we write the instructions using docker file keywords.
Docker will process these instructions from top to bottom.

Qtn: How many FROM keywords you can have in a Dockerfile ?
Answer: yes more than 1 we can have that concept is call multistage Dockerbuild 

Qtn: What is difference between COPY and docker cp
Ans: COPY is used to copy files from local system to image
     docker cp will copy from local to container and also from container to local system
Qtn: Diff between CMD and Entrypoint
Ans: CMD commands can be overriden while creating a container.Entrypoint commands cant be overridden while creating a container
ex: CMD java -jar jarfileName.jar
--CMD commands will be execute as child process under /bin/bash or bash/sh main process .CMD command will be executed as /bin/bash -c "command"
--Entrypoint commands will be executed as main process /bin/<command>. CMD command will be executed as /bin/bash -c "command".

https://github.com/MithuntechnologiesDevops===Reffer for Dockerfiles

In which scenario we can use both CMD & Entrypoint
We can use CMD & Entrypoint together if we have to pass/overrite arguments for your entry point
 EX: sh catalina.sh 
CMD run
ENTRYPOINT ["sh","catelina.sh"]
Output = sh catelina.sh run
while creating container we can mension CMD ex
docker run imagename restart
Important QTNS.
Difference between RUN AND CMD.
Difference between ENTRYPOINT AND CMD.
CAN we can more CMD in a dockerfile
Can we have Entrypoints in a docker file
Basically CMD And Entrypoint are used to start the process while creating ours container.
WE can have more than one entrypoint and CMD but latest one will be executed.

Qtn: can we have more than one process in a container?
yes we can have but it is no recommended.bcz hole concept of docker is isolate process.
how? create shell script copy the shell Script with COPY then with CMD or Entrypoint run the shell script

VOLUMES
------------
two types
1) bind mounts
2) volume
1) bind mounts(not recomended)
-------------------
***We can't do volume mapping for running container.While creating container only we need to do volume mapping.

When we use bind mount, a file or directory on the host machine is mounted into a container.
The directory is referenced by its fill or relative path
EX: create directory 
mkdir mongodbbackup 
docker run -d --name mongo -v /home/ubuntu/mongodbbackup:/data/db --network flipkartnetwork mongo
                                 (host path)              (container path)
If u delete container data still exist and if u create a container with same volume mounting ur date retrived and attaced to the mount point 

2)Volumes
--------------
volume are prepered way for persiting data generated and used by docker containers. 
while bind mounts are dependet on the directory structure of the host system.
Volume are completely managed by docker.
volumes are easier to backup or migrate.
we can manage volumes using docker cli
volumes will work in both linux/windows
volume drivers we let us to store volumes on remote servers or cloud provider.(ex:s3,ebs,efs, nfs)

How do you take jenkins backup or jenkins job migration>
copy the /var/lib/jenkins ---working directery
install jenkins in 2nd server and reload the jobs

Same for docker /var/lib/docker migrate this folder

docker volume create -d local mongobkp
docker volume create -d local volumewithlimit --opt "size=50m" (notworking but we ca set like this)
ex: docker run -d -v volumename:containerpath --network networkname imagename
    docker run -d --name mongo -v mongobkp:/data/db --network flipkartnetwork mongo

REX-Ray (supports ebs,efs.s3)volume plugin for cloud storage to attach to container
install this plugin
docker plugin install rexray/ebs EBS_ACCESSKEY=AWS ACCESS KEY EBS_SECRETKEY=AWS SECRET KEY
docker plugin ls
docker volume create -d rexray/ebs mongoebsbkp
Volume mapping while creating a container
docker run -d --name mongo -v mongoebsbkp:/data/db --network flipkartnetwork mongo

What is monolithic VS micro-services Architechture


What is difference between global and replica mode
By default service will be created in replica mode with 1 replica if we dont mension.
docker service create --name <serviceName> -p <hostPort>:<containerPort> --replicas <NoofReplicas> <imageName>
In replica mode we can scale up amd scale the number of replicas(containers).

Global mode will create container in all the machines of docker swarm.We can't scale up and scale down the conatiners.
when you add a new machine to docker swarm container for the global mode services will be created automatically in newly added machines

docker service create --name <serviceName> --mode blobal -p <hostPort>:<containerPort> <imageName>

EX: docker service create ngnix -p 80:80 --mode global nginx

Qtn: how to place container in specific machine in docker swarms

Ans: with labels and constraints
docker service create --name javawebapp --mode global --constraint "node.role==worker" dockerhandson/java-web-app only to run in worker machine.
to constrain on the basic of application type for each node(making app and db group seperatly)
docker node update --lable-add "name=appserver" nodeID(to get node id docker node ls)
docker node update --lable-add "name=dbserver" nodeID(to get node id docker node ls) 
--now
docker service create --name mavenwebapp -p 9090:8080 --replicas 2 --constraint "node.labels.name==appserver" dockerhandson/maven-web-app.
Qtn: if this machine itself is gone down what will happen? 
Anw: application will go down it will not create another instance unless untile other macine have same condition and constraint

Qtn: what is docker stack?
stack is a collection of services .We can manage group of services using docker stack in docker swarm.

Qtn: what is docker service?
Ans: its one or more containers(replicas) specific to one image in docker swarm.

docker swarm init 
it will create default overlay network naming ingress for swarm scope.

Docker Swarm Quetions and answers
These are for two different applications for one client
Qtn: How many Docker machines you have?
Ans:30 to 40 (including jenkins docker nexus etc)
Qtn:What is the capacity of your server?
Ans: 128GB Ram ,64 core processer
     64 ram     32 core processer
     32Gb ram   12 core processer
Qtn:How many docker-swarm cluster u have?
DEV:2 managers 6 workers
QA:3 managers 10 workers
Prod:3 managers 10 workers
Qtn: How many manager and how many workers u have in your production server?
Ans: 3 manager 10 workers
Qtn: How many services you have in your application/docker swarm?
Ans: We have about 35 to 40 microservices
Qtn: How many stack?
Ans: 2 stacks
Qtn: Totally How many containers?
Ans: 200 to 250 containers
Qtn: How many containers in one machine?
Ans: depends on capacity of machine
Qtn: Load balancer in docker?
Ans: External ELB is used with docker swarm--(ELB for only load balancing)
Docker swarm will not create another server if it is down ..it orchestrate the services.


what is docker?
difference between container and vms?
difference between docker and virtualization?
difference between container and image?
how image builds?
what are image layers?
how image layers work?
what is overlayfs?
where the image layers found in which directory?
how can we check the content of the each layer?
how to check the layers stacked with image?
what is union Mount & AUFs?
why use union mount system for docker?
what are the 3 different directories in /var/lib/docker/aufs?
how to run an image?
how to tag an image?
how to link one container with another ?
how do you sequence the containers? A first then B should execute after that?
how to create a volume in docker container to store data?
how to mount a local directory into a container?
what is entry point in docker?
what is docker file?
difference between ADD & copy parameters in docker file?
how to create a bridge in container?
how a  container gets an internal IP?
can we check the process of a container inside as well as outside the container?
can we check the container process on docker host?
how kernel isolates to rin the container and how resources managed by the kernel?
what is namespace

<details><summary> Walk me through what goes into a Dockerfile based on your experience.

</summary>FROM: Base image.
RUN: Commands to install dependencies.
COPY/ADD: Copy application files.
EXPOSE: Port to be exposed.
CMD/ENTRYPOINT: Command to run the application.</details>
<details><summary> </summary> </details>
<details><summary> docker compose file for nodejs application</summary>

```docker-compose
version: '3'
services:
  app:
    image: node:14
    working_dir: /usr/src/app
    volumes:
      - .:/usr/src/app
    ports:
      - "3000:3000"
    command: npm start

```
 </details>

 <details><summary>saving changes inside a container </summary>Changes inside a running container can be committed to a new image using docker commit <container_id> <new_image_name>. </details>