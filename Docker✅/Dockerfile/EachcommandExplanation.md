**FROM**

- `From`  should be the first instruction in your Dockerfile

EX: `FROM almalinux:latest`

**ADD**
- `ADD` is same as COPY. It is useful to copy files from local to container. But, it has 2 extra capabilities.

1. ADD can download the file directly from internet to the container

2. ADD can untar/unzip the file directly into the container

`FROM almalinux:latest` <br>
`ADD [SOURCE][DESTINATION]`<br>
`ADD apache-tomcat-9.0.73-embed.tar.gz /tmp/ ` 



**copy**

- COPY instruction is useful to copy the files from local to image.

`FROM almalinux:8`<br>
`RUN yum install nginx -y` <br>
`RUN rm -rf /usr/share/nginx/html/index.html` <br>
`COPY qi /usr/share/nginx/html/` <br>
`CMD ["nginx", "-g", "daemon off;"]`


`$ docker run -d -p 80:80 charanworld/copy:v1`

**CMD**

- CMD is the instruction that runs the container. It should run in foreground and it should run for infinite time.

`FROM almalinux` <br>
`RUN yum install nginx -y` <br>
`CMD ["nginx", "-g", "daemon off;"]` <br>

`# CMD ["sleep", "20"] there should be only one CMD instruction. if we give multiple the last one will be considered`

RUN vs CMD

- RUN command will execute at the time of image creation

- CMD command will execute at the time of running container



**ARG**

- ARG is used to supply few variables at the image creation.

- ARG is the only instruction you can use before FROM . ARG declared before and can't be accessed after FROM.

Using ENV and ARG for best results.

- create one env variable and assign the value of ARG to that
- then we can access ARG values through ENV both in image and container

`ARG VERSION` <br>
`FROM almalinux:${VERSION:-8}` <br>
`ARG GREETING="HI Good Morning"` <br>
`ENV GREET=${GREETING}` <br>
`RUN echo "$GREETING"` <br>
`RUN echo "$VERSION"`

**ENTRYPOINT**

- ENTRYPOINT is also used to run the container just like CMD. But there are few differences.

1. We can't override ENTRYPOINT, but we can override CMD
2. We can't override ENTRYPOINT, if you try to do so it will go and append to the ENTRYPOINT command.
3. if you use CMD and ENTRYPOINT and don't give any command from terminal. CMD acts as argument provider to ENTRYPOINT
4. CMD will supply default argument to ENTRYPOINT
5. You can always override CMD arguments from runtime
6. You can stop misusing your with other commands.

`FROM almalinux`<br>
`#CMD ["ping", "-c5", "google.com"]`<br>
`CMD ["google.com"]`<br>
`ENTRYPOINT ["ping", "-c5"]`<br>
`#ping -c5 google.com ping -c2 facebook.com`

**ENV**

- ENV is the instruction to provide environment variables to image and container. you can override env variables at runtime.

`FROM almalinux`<br>
`ENV AUTHOR="Nagacharan" \` <br>
       `DURATION="25HR" \` <br>
       `COURSE="DOCKER"`<br>

**EXPOSE**

- EXPOSE instruction is useful to tell the users of the image about the ports and protocols image/container is opening. It will not have any functionality it is used to tell the information.

`FROM almalinux` <br>
`EXPOSE 8080/tcp`

**LABEL**

- LABEL instruction is useful to give some metadata information

`FROM almalinux` <br>
`LABEL AUTHOR="Nagacharan" \` <br>
          `COURSE="DOCKER" \` <br>
          `DURATION="25 HRS"`

**ONBUILD**

- ONBUILD is used to set some hard guidelines to the image. We can control how others can use our image as their base image.

`FROM almalinux` <br>
`RUN yum install nginx -y` <br>
`# when image creator is running this below command will not run. when some one else tries to use your image then it will run`
`ONBUILD ADD simple.txt /tmp/` <br>

**RUN**

- RUN instruction is used to install software packages and other tasks. It runs at the time of image building.

`FROM almalinux` <br>
`RUN yum install nginx -y`

**STOPSIGNAL**

STOPSIGNAL is used to know how to exit the container.

- By default, docker request for exit and wait for sometime.
- If it is not exiting it can force kill
- When your container received STOPSIGNAL your application can perform

        - you can close DB connection

        - You can do some back up

**STRESS**

`FROM almalinux:8` <br>
`RUN yum update -y` <br>
`RUN yum install stress-ng -y` <br>
`CMD ["stress-ng","--help"]`

**USER**

- It is used to run the commands as a particular User

`FROM almalinux` <br>
`RUN adduser nginx` <br>
`USER nginx` <br>
`RUN touch /tmp/hello.txt` <br>

**VOLUME**

`FROM ubuntu` <br>
`RUN mkdir /myvol` <br>
`RUN echo "hello world" > /myvol/greeting` <br>
`VOLUME /myvol` <br>

**WORKDIR**

- WORKDIR is used to set the path to the image while creating

`FROM almalinux` <br>
`WORKDIR /tmp` <br>
`RUN touch hello.txt`




