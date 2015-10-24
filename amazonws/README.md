Jenkins Slave Container with Amazon WS CLI

Check this project on how to configure a swarm slave: [blacklabelops/jenkins-swarm](https://github.com/blacklabelops/jenkins-swarm)

# Make It Short!

In short, you can use AmazonWS CLI commands inside a Jenkins slave.

First start a master!

~~~~
$ docker run -d -p 8090:8080 --name jenkins_jenkins_1 blacklabelops/jenkins
~~~~

> This will pull the my jenkins container ready with swarm plugin and ready-to-use!

Now start the build slave!

~~~~
$ docker run  \
    -e "AWS_ACCESS_KEY_ID=YOUR_AWS_ACCESS_KEY" \
    -e "AWS_SECRET_ACCESS_KEY=YOUR_SECRET_ACCESS_KEY" \
    --link jenkins_jenkins_1:jenkins \
    blacklabelops/aws
~~~~

> CLI commands will be available when you specify the correct aws credentials.

# References

* [Docker Homepage](https://www.docker.com/)
* [Docker Userguide](https://docs.docker.com/userguide/)
* [Amazon WS CLI](https://aws.amazon.com/de/cli/)
