FROM blacklabelops/swarm-jdk8
MAINTAINER Steffen Bleul <sbl@blacklabelops.com>

# Need root to build image
USER root

# install web tools
RUN yum install -y epel-release && \
    yum install -y \
    unzip \
    zip \
    gzip \
    tar \
    curl \
    python-pip \
    wget && \
    yum clean all && rm -rf /var/cache/yum/* && \
    pip install --upgrade pip

# install Docker cli
ENV DOCKER_VERSION 1.9.1
ENV DOCKER_HOST tcp://docker:2375

RUN curl -fSL "https://get.docker.com/builds/Linux/x86_64/docker-$DOCKER_VERSION" -o /usr/local/bin/docker && \
    chmod +x /usr/local/bin/docker && \
    pip install docker-compose

# Switch back to user jenkins
USER $CONTAINER_UID
