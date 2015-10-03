FROM blacklabelops/swarm-jdk8
MAINTAINER Steffen Bleul <sbl@blacklabelops.com>

# install dev tools
RUN yum install -y \
    unzip \
    wget && \
    yum clean all && rm -rf /var/cache/yum/*

# install Vagrant and Packer
ENV PACKER_VERSION=0.8.6
ENV VAGRANT_VERSION=1.7.4
RUN wget --directory-prefix=/tmp https://dl.bintray.com/mitchellh/packer/packer_${PACKER_VERSION}_linux_amd64.zip && \
    unzip /tmp/packer_${PACKER_VERSION}_linux_amd64.zip -d /usr/local/bin && \
    rm -f /tmp/packer_${PACKER_VERSION}_linux_amd64.zip && \
    wget --directory-prefix=/tmp https://dl.bintray.com/mitchellh/vagrant/vagrant_${VAGRANT_VERSION}_x86_64.rpm && \
    rpm -i /tmp/vagrant_${VAGRANT_VERSION}_x86_64.rpm

# install Virtualbox
ENV VIRTUALBOX_VERSION=5.0
RUN mkdir -p /opt/virtualbox && \
    cd /etc/yum.repos.d/ && \
    wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo && \
    rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm && \
    yum install -y \
    dkms \
    kernel-devel && \
    yum -y groupinstall "Development Tools" && \
    yum install -y VirtualBox-${VIRTUALBOX_VERSION} && \
    yum clean all && rm -rf /var/cache/yum/*

WORKDIR /opt/jenkins-swarm
ENTRYPOINT ["/opt/jenkins-swarm/docker-entrypoint.sh"]
CMD ["swarm"]
