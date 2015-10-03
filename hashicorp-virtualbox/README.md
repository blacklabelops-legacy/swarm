Work in progress!

This is a container stuffed with the hashicorp toolset for Virtualbox!

# Make It Short!

Requirement: Virtualbox must be installed and running on the host machine!

In short, you can run Virtualbox as a Jenkins slave. Just by executing:

~~~~
$ docker run --rm \
    -v /dev/vboxdrv:/dev/vboxdrv \
    blacklabelops/hashicorp-virtualbox
~~~~

~~~~
$ docker run --rm \
    -v /dev:/dev \
    blacklabelops/hashicorp-virtualbox
~~~~

# References

* [Docker Homepage](https://www.docker.com/)
* [Docker Userguide](https://docs.docker.com/userguide/)
* [Google Cloud](https://cloud.google.com/)
* [Google Developers Cloud Console](https://console.developers.google.com/project)
