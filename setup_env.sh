#!/bin/bash
# ubuntu22.04
sudo apt update
sudo apt install python3.10-venv -y
python3 -m venv ~/.venv/ansible_env/
source ~/.venv/ansible_env/bin/activate
sudo apt install virtualbox -y

# pre-rquirements ubuntu
sudo apt install python3-pip libssl-dev -y
sudo apt install docker.io
sudo chmod 666 /var/run/docker.sock
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"

# vagrant
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant -y
mkdir ~/Documents
nano ~/Documents/vault.pw

# required tools
python3 -m pip install molecule ansible-core
python3 -m pip install --upgrade --user setuptools
python3 -m pip install molecule ansible-lint
python3 -m pip install "molecule-plugins[vagrant]"

# ansible packages
ansible-galaxy collection install ansible.posix

# libvirt
sudo apt install qemu-kvm libvirt-daemon-system -y
pip install molecule-libvirt

# docker
pip install docker

