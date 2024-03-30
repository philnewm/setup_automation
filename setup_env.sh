#!/bin/bash

repo_path="$HOME/setup_automation"
vscode_settings="$repo_path/.vscode/settings.json"

# ubuntu22.04
sudo apt update && sudo apt upgrade -y
sudo apt install sshpass -y
sudo apt install jq -y
sudo apt install python3-pip libssl-dev -y
sudo apt install python3.10-venv -y

# pre-rquirements ubuntu
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

python3 -m venv ~/.venv/ansible_env/
source ~/.venv/ansible_env/bin/activate

# required tools
python3 -m pip install docker
python3 -m pip install molecule ansible-core
python3 -m pip install molecule ansible-lint
python3 -m pip install "molecule-plugins[vagrant]"

# ansible packages
ansible-galaxy collection install ansible.posix
ansible-galaxy collection install community.general

# vscode workspace settings:
mkdir -p "$repo_path/.vscode"
jq -n \
    --arg interpreterPath "~/.venv/ansible_env/bin/python" \
    --arg ansibleLintPath "~/.venv/ansible_env/bin/ansible-lint" \
    --arg ansibleConfigPath "~/.venv/ansible_env/bin/ansible-config" \
    '{
        "ansible.python.interpreterPath": $interpreterPath,
        "python.defaultInterpreterPath": $interpreterPath,
        "ansible.validation.lint.path": $ansibleLintPath,
        "ansible.ansible.path": $ansibleConfigPath,
        "ansible.lightspeed.suggestions.enabled": true,
        "ansible.lightspeed.enabled": true
    }' > "$vscode_settings"

# vault pass word file
mkdir ~/Documents
nano ~/Documents/vault.pw

ansible-vault create ~/setup_automation/secrets.yml

code --version
code --install-extension redhat.ansible
code --install-extension ms-python.python
code --install-extension njpwerner.autodocstring
code
