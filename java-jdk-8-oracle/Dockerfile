FROM blacklabelops/jenkins-swarm
MAINTAINER Steffen Bleul <sbl@blacklabelops.com>

# Need root to build image
USER root

# install dev tools
RUN yum install -y \
    unzip && \
    yum clean all && rm -rf /var/cache/yum/*

# install maven
ENV MAVEN_VERSION=3.3.3
ENV M2_HOME=/usr/local/maven
RUN wget --directory-prefix=/tmp \
    http://mirror.synyx.de/apache/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    tar xzf /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /usr/local && rm -rf /tmp/* && \
    cd /usr/local &&  ln -s apache-maven-${MAVEN_VERSION} maven && \
    alternatives --install /usr/bin/mvn mvn /usr/local/maven/bin/mvn 100

# install gradle
ENV GRADLE_VERSION=2.5
ENV GRADLE_HOME=/usr/local/gradle
RUN wget --no-check-certificate --directory-prefix=/tmp \
    https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip && \
    unzip /tmp/gradle-${GRADLE_VERSION}-bin.zip -d /usr/local && rm -rf /tmp/* && \
    cd /usr/local &&  ln -s gradle-${GRADLE_VERSION} gradle && \
    alternatives --install /usr/bin/gradle gradle /usr/local/gradle/bin/gradle 100

# Switch back to user jenkins
USER $CONTAINER_UID
