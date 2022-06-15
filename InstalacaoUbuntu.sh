#!/bin/bash

sudo -i

sleep 1

timedatectl set-timezone America/Sao_Paulo

sleep 1

apt update -y && sudo apt dist-upgrade -y && sudo apt autoremove -y 

sleep 1

fallocate -l 3G /swapfile
sleep 1
chmod 600 /swapfile
sleep 1
mkswap /swapfile
sleep 1
swapon /swapfile
sleep 1
swapon --show
sleep 1
cp /etc/fstab /etc/fstab.bak
sleep 1
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

sleep 1

apt-get install \
jq \
wget \
curl \
udisks2 \
libglib2.0-bin \
network-manager \
iputils-ping \
firewalld \
vim \
openssh-server \
dbus -y

sleep 1

curl -fsSL get.docker.com | sh

sleep 1

wget https://github.com/diego780705/HomeAssistant/raw/a13052d267deeccb6814d47d5f6570ba9536f4e0/os-agent_1.2.2_linux_x86_64.deb

sleep 1

dpkg -i os-agent_1.2.2_linux_x86_64.deb

sleep 1

wget https://github.com/diego780705/HomeAssistant/raw/3e54068c33895aaa14229ca0347f3dd428cfd35f/homeassistant-supervised.deb

sleep 1

dpkg -i homeassistant-supervised.deb

sleep 3

docker volume create portainer_data
sleep 1
docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer

sleep 1

docker pull nextcloud
sleep 1
docker run -d -p 1010:80 nextcloud

sleep 1

systemctl enable firewalld

sleep 1

firewall-cmd --permanent --add-port=1-65535/tcp

sleep 1

firewall-cmd --reload

sleep 1

systemctl start firewalld
