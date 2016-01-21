FROM blacklabelops/jenkins-swarm
MAINTAINER Steffen Bleul <sbl@blacklabelops.com>

# Need root to build image
USER root

# install dev tools
RUN yum install -y \
    unzip \
    wget && \
    yum clean all && rm -rf /var/cache/yum/*

# install Vagrant and Packer
ENV PACKER_VERSION=0.8.6
ENV VAGRANT_VERSION=1.8.1
ENV OTTO_VERSION=0.2.0
RUN wget --directory-prefix=/tmp https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip && \
    unzip /tmp/packer_${PACKER_VERSION}_linux_amd64.zip -d /usr/local/bin && \
    rm -f /tmp/packer_${PACKER_VERSION}_linux_amd64.zip && \
    wget --directory-prefix=/tmp https://releases.hashicorp.com/vagrant/${VAGRANT_VERSION}/vagrant_${VAGRANT_VERSION}_x86_64.rpm && \
    rpm -i /tmp/vagrant_${VAGRANT_VERSION}_x86_64.rpm && \
    wget --directory-prefix=/tmp https://releases.hashicorp.com/otto/${OTTO_VERSION}/otto_${OTTO_VERSION}_linux_amd64.zip && \
    unzip /tmp/otto_${OTTO_VERSION}_linux_amd64.zip -d /usr/local/bin

# install Virtualbox
ENV VIRTUALBOX_VERSION=5.0.12_104815_el7-1
RUN mkdir -p /opt/virtualbox && \
    cd /etc/yum.repos.d/ && \
    wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo && \
    rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm && \
    yum install -y \
    dkms \
    kernel-devel && \
    yum -y groupinstall "Development Tools" && \
    yum install -y VirtualBox-5.0-${VIRTUALBOX_VERSION} && \
    yum clean all && rm -rf /var/cache/yum/*

# Switch back to user jenkins
USER $CONTAINER_UID
