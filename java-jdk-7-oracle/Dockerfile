FROM blacklabelops/swarm-jdk8
MAINTAINER Steffen Bleul <blacklabelops@itbleul.de>

# this envs are for maintaining java updates.
ENV JAVA_MAJOR_VERSION=7
ENV JAVA_UPDATE_VERSION=80
ENV JAVA_BUILD_NUMER=15
# install java
ENV JAVA_VERSION=1.${JAVA_MAJOR_VERSION}.0_${JAVA_UPDATE_VERSION}
ENV JAVA_TARBALL=server-jre-${JAVA_MAJOR_VERSION}u${JAVA_UPDATE_VERSION}-linux-x64.tar.gz
ENV JAVA_HOME=/opt/java/jdk${JAVA_VERSION}

RUN wget --no-check-certificate --directory-prefix=/tmp \
         --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
         http://download.oracle.com/otn-pub/java/jdk/${JAVA_MAJOR_VERSION}u${JAVA_UPDATE_VERSION}-b${JAVA_BUILD_NUMER}/${JAVA_TARBALL} && \
    mkdir -p /opt/java && \
    tar -xzf /tmp/${JAVA_TARBALL} -C /opt/java/ && \
    alternatives --remove java ${SWARM_JAVA_HOME}/bin/java && \
    alternatives --install /usr/bin/java java /opt/java/jdk${JAVA_VERSION}/bin/java 100 && \
    rm -rf /tmp/* && rm -rf /var/log/*

WORKDIR /opt/jenkins-swarm
ENTRYPOINT ["/opt/jenkins-swarm/docker-entrypoint.sh"]
CMD ["swarm"]
