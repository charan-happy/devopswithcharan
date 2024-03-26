Dockerfiles
--------------
- Dockerfile is a declarative way of creating our own images. Docker will give us some syntax to create our own images.

- Filename should be Dockerfile. Docker command should run where your dockerfile exists.

How to build image from Dockerfile

`docker build -t [docker-hub-uRL]/[your-username]/[image-name]:version .`

How to push image to DockerHub

`docker push [docker-hub-URL]/[your-username]/[image-name]:version`

Example:
-----------

FROM openjdk:11-jdk <br>
MAINTAINER GFG author <br>
LABEL env=production<br>
ENV apparea /data/app<br>
RUN mkdir -p $apparea<br>
ADD https://get.jenkins.io/war/2.397/jenkins.war $apparea<br>
WORKDIR $apparea<br>
EXPOSE 8080<br>
CMD ["java","-jar","jenkins.war"]<br>
