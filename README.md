# Jenkins Swarm Slaves.

Good news! These containers have rooted out root! Safely running inside userspace!

Perfectly working with the following container: [blacklabelops/jenkins](https://github.com/blacklabelops/jenkins)

Builds the following swarm slaves:

Jenkins Slaves with Docker:

* Documentation: [blacklabelops/swarm-dockerhost](https://github.com/blacklabelops/swarm/tree/master/dockerhost)
* Documentation: [blacklabelops/swarm-docker](https://github.com/blacklabelops/swarm/tree/master/docker) (Deprecated)

Jenkins Slave with Virtualbox and Hashicorp Tools:

* Documentation: [blacklabelops/hashicorp-virtualbox](https://github.com/blacklabelops/swarm/tree/master/hashicorp-virtualbox)

Jenkins Slave with AmazonWS Command Line Interface:

* Documentation: [blacklabelops/swarm-aws](https://github.com/blacklabelops/swarm/tree/master/amazonws)

Java Slaves with Java, Maven and Gradle:

* blacklabelops/swarm-jdk6
* blacklabelops/swarm-jdk7
* blacklabelops/swarm-jdk8

Check this project on how to configure each swarm slave: [blacklabelops/jenkins-swarm](https://github.com/blacklabelops/jenkins-swarm)

# Make It Short

This project contains jenkins swarm slaves for Jenkins CI. Start a master and connect the selected slaves.

First start a master!

~~~~
$ docker run -d -p 8090:8080 --name jenkins blacklabelops/jenkins
~~~~

> This will pull the my jenkins container ready with swarm plugin and ready-to-use!

Now swarm the place!

~~~~
$ docker run -d --link jenkins:jenkins blacklabelops/swarm-jdk6
$ docker run -d --link jenkins:jenkins blacklabelops/swarm-jdk7
$ docker run -d --link jenkins:jenkins blacklabelops/swarm-jdk8
~~~~

> This will start 3 Java JDK build slaves with JDK6/7/8, each with 4 build processors! This setup will
need no further setup as the swarm slave automatically connects to the linked jenkins.

# How It Works

All slaves are configured the same way! Check this project on how to configure jenkins swarm slaves: [blacklabelops/jenkins-swarm](https://github.com/blacklabelops/jenkins-swarm)

# Java Swarm Slaves

All containing:

* Latest respective JDK version. [Oracle Java](https://java.com/de/download/)
* Latest Maven Build system. [Maven Homepage](https://maven.apache.org/)
* Latest Gradle Build System. [Gradle Homepage](https://gradle.org/)

# Vagrant

Vagrant is fabulous tool for pulling and spinning up virtual machines like docker with containers. I can configure my development and test environment and simply pull it online. And so can you! Install Vagrant and Virtualbox and spin it up. Change into the project folder and build the project on the spot!

~~~~
$ vagrant up
$ vagrant ssh
[vagrant@localhost ~]$ cd /vagrant
[vagrant@localhost ~]$ ./scripts/build.sh
~~~~

> Builds the container with standard settings.

Vagrant does not leave any docker artifacts on your beloved desktop and the vagrant image can simply be destroyed and repulled if anything goes wrong. Test my project to your heart's content!

First install:

* [Vagrant](https://www.vagrantup.com/)
* [Virtualbox](https://www.virtualbox.org/)

# References

* [Jenkins Homepage](http://jenkins-ci.org/)
* [Jenkins Swarm Plugin Homepage](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin)
* [Docker Homepage](https://www.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/)
* [Docker Userguide](https://docs.docker.com/userguide/)
* [Oracle Java](https://java.com/de/download/)
