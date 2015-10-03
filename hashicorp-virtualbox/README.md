Work in progress!

This is a container stuffed with the hashicorp toolset for Virtualbox!

Requirements:

  * Only works on dedicated server without any virtualization around.
  * Host machine must have working installation of Virtualbox.
  * Host machine should have same Virtualbox version.
  * Host machine should have same kernel version as container.

# Make It Short!

In short, you can use Vagrant and Packer inside a Jenkins slave. Just by executing:

First start a master!

~~~~
$ docker run -d -p 8090:8080 --name jenkins_jenkins_1 blacklabelops/jenkins
~~~~

> This will pull the my jenkins container ready with swarm plugin and ready-to-use!

~~~~
$ docker run -d \
    --link jenkins_jenkins_1:jenkins \
    -v /dev/vboxdrv:/dev/vboxdrv \
    blacklabelops/hashicorp-virtualbox
~~~~

> Mounts the hosts binaries.

# References

* [Docker Homepage](https://www.docker.com/)
* [Docker Userguide](https://docs.docker.com/userguide/)
* [Virtualbox](https://www.virtualbox.org/)
* [Vagrant](https://www.vagrantup.com/)
* [Packer](https://www.packer.io/)
