Container stuffed with Hashicorp Vagrant and Packer with Virtualbox!

This slave can be used to build Vagrant-Virtualbox boxes in several independent containers on the same host.

Requirements:

  * Centos 7.1503 dedicated server without any virtualization around.
  * Host machine must have working installation of Virtualbox.
  * Host machine must have same Virtualbox version.
  * Host machine must have same kernel version as container.

# Make It Short!

In short, you can use Vagrant and Packer inside a Jenkins slave.

First start a master!

~~~~
$ docker run -d -p 8090:8080 --name jenkins_jenkins_1 blacklabelops/jenkins
~~~~

> This will pull the my jenkins container ready with swarm plugin and ready-to-use!

Now start the build slave!

~~~~
$ docker run -d \
    --privileged=true \
    --link jenkins_jenkins_1:jenkins \
    -v /dev/vboxdrv:/dev/vboxdrv \
    blacklabelops/hashicorp-virtualbox
~~~~

> Mounts the hosts binaries. MUST use privileged mode, MUST mount host directory.

# References

* [Docker Homepage](https://www.docker.com/)
* [Docker Userguide](https://docs.docker.com/userguide/)
* [Virtualbox](https://www.virtualbox.org/)
* [Vagrant](https://www.vagrantup.com/)
* [Packer](https://www.packer.io/)
