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