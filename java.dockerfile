ARG JAVA_VERSION=26

FROM eclipse-temurin:${JAVA_VERSION}-jdk

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
