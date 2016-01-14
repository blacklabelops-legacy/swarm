Jenkins Slave Container with Docker

Check this project on how to configure a swarm slave: [blacklabelops/jenkins-swarm](https://github.com/blacklabelops/jenkins-swarm)

# Make It Short!

In short, you can use Docker CLI commands inside a Jenkins slave.

First start a master!

~~~~
$ docker run -d -p 8090:8080 --name jenkins blacklabelops/jenkins
~~~~

> This will pull the my jenkins container ready with swarm plugin and ready-to-use!

Then start a Docker demon container!

~~~~
$ docker run -d --privileged --name docker_demon docker
~~~~

Now start the build slave!

~~~~
$ docker run -d \
    --link jenkins:jenkins \
    --link docker_demon:docker \
    blacklabelops/swarm-docker
~~~~

> CLI commands will be available.

# References

* [Docker Homepage](https://www.docker.com/)
* [Docker Userguide](https://docs.docker.com/userguide/)
