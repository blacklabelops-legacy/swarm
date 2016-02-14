FROM blacklabelops/hashicorp-tools
MAINTAINER Steffen Bleul <sbl@blacklabelops.com>

# Need root to build image
USER root

# install Virtualbox (Example version: 5.0.14_105127_el7-1)
RUN export VIRTUALBOX_VERSION=latest && \
    mkdir -p /opt/virtualbox && \
    cd /etc/yum.repos.d/ && \
    wget http://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo && \
    yum install -y \
      dkms \
      kernel-devel && \
    yum -y groupinstall "Development Tools" && \
    if  [ "${VIRTUALBOX_VERSION}" = "latest" ]; \
      then yum install -y VirtualBox-5.0 ; \
      else yum install -y VirtualBox-5.0-${VIRTUALBOX_VERSION} ; \
    fi && \
    yum autoremove -y \
      tar \
      unzip \
      wget && \
    yum clean all && rm -rf /var/cache/yum/*

# Switch back to user jenkins
USER $CONTAINER_UID
