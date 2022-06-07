#!/bin/bash

sudo -i

sleep 2

timedatectl set-timezone America/Sao_Paulo

sleep 2

apt update -y && sudo apt dist-upgrade -y && sudo apt autoremove -y 

sleep 2

fallocate -l 3G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
swapon --show
cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

sleep 2

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

sleep 2

curl -fsSL get.docker.com | sh

sleep 2

wget https://github.com/diego780705/HomeAssistant/raw/a13052d267deeccb6814d47d5f6570ba9536f4e0/os-agent_1.2.2_linux_x86_64.deb

sleep 2

dpkg -i os-agent_1.2.2_linux_x86_64.deb

sleep 2

wget https://github.com/diego780705/HomeAssistant/raw/3e54068c33895aaa14229ca0347f3dd428cfd35f/homeassistant-supervised.deb

sleep 2

dpkg -i homeassistant-supervised.deb

sleep 2

docker volume create portainer_data

sleep 2

docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer

sleep 2

systemctl enable firewalld

sleep 2

firewall-cmd --permanent --add-port=1-65535/tcp

sleep 2

firewall-cmd --reload

sleep 2

systemctl start firewalld
