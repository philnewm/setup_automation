#!/bin/bash
# ubuntu22.04
sudo apt update
sudo apt install python3.10-venv -y
python3 -m venv ~/.venv/ansible_env/
source ~/.venv/ansible_env/bin/activate

# worksapce settings:
{
    "ansible.python.interpreterPath": "~/.venv/ansible_env/bin/python",
    "python.defaultInterpreterPath": "~/.venv/ansible_env/bin/python"
}

# pre-rquirements ubuntu
sudo apt install python3-pip libssl-dev -y
# append those two lines into ~/.bashrc
echo 'export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"' >> ~/.bashrc
echo 'export PATH="$PATH:/mnt/c/Program Files/Oracle/VirtualBox"' >> ~/.bashrc

# now reload the ~/.bashrc file
source ~/.bashrc

# vagrant
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant -y
vagrant plugin install virtualbox_WSL2

# vault pass word file
mkdir ~/Documents
nano ~/Documents/vault.pw


# required tools
python3 -m pip install molecule ansible-core
python3 -m pip install --upgrade setuptools
python3 -m pip install molecule ansible-lint
python3 -m pip install "molecule-plugins[vagrant]"

# ansible packages
ansible-galaxy collection install ansible.posix

sudo apt install sshpass
