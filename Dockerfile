FROM eclipse-temurin:25
# https://github.com/adoptium/containers/blob/main/22/jdk/ubuntu/noble/Dockerfile

RUN apt-get update && apt-get install -y  \
    curl  \
    apt-utils \
    nano \
    net-tools \
    apt-transport-https \
    iputils-ping \
    gettext \
    iproute2

RUN mkdir /home/ubuntu/app && chown -R ubuntu:ubuntu /home/ubuntu/app
WORKDIR /home/ubuntu/app
