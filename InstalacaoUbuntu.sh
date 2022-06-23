#!/bin/bash

sudo -i

apt dist-upgrade && apt update -y && apt upgrade -y && apt autoremove -y && apt autoclean -y

timedatectl set-timezone America/Sao_Paulo

fallocate -l 3G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
swapon --show
cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

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

curl -fsSL get.docker.com | sh
wget https://github.com/diego780705/HomeAssistant/raw/a13052d267deeccb6814d47d5f6570ba9536f4e0/os-agent_1.2.2_linux_x86_64.deb
dpkg -i os-agent_1.2.2_linux_x86_64.deb
wget https://github.com/diego780705/HomeAssistant/raw/3e54068c33895aaa14229ca0347f3dd428cfd35f/homeassistant-supervised.deb
dpkg -i homeassistant-supervised.deb

systemctl enable firewalld
firewall-cmd --permanent --add-port=1-65535/tcp
firewall-cmd --reload
systemctl start firewalld
