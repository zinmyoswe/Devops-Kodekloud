Day 35 Install Docker Packages and Start Docker Service
The Nautilus DevOps team aims to containerize various applications following a recent meeting with the application development team. They intend to conduct testing with the following steps:


Install docker-ce and docker compose packages on App Server 1.


Initiate the docker service.

Solution:


G=> docker Install
https://docs.docker.com/engine/install/centos/

sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

#install latest version
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo systemctl enable --now docker
sudo systemctl status docker

#add docker to current user
sudo usermod -aG docker tony
su - tony

docker ps
docker compose

