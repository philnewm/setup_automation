#!/bin/bash

repo_path="$HOME/setup_automation"
vscode_settings="$repo_path/.vscode/settings.json"

# ubuntu22.04
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install sshpass -y
sudo apt-get install jq -y
sudo apt-get install python3-pip libssl-dev -y
sudo apt-get install python3.10-venv -y

# now reload the ~/.bashrc file
source ~/.bashrc

# vagrant
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update && sudo apt-get install vagrant -y


python3 -m venv ~/.venv/ansible_env/
source ~/.venv/ansible_env/bin/activate

# add to requirements.txt for pip
# required tools
pip install -r requirements.txt
# python3 -m pip install docker
# python3 -m pip install molecule ansible-core
# python3 -m pip install molecule ansible-lint
# python3 -m pip install "molecule-plugins[vagrant]"
# python3 -m pip install jmespath

# WSL2
# pre-rquirements ubuntu
# append those two lines into ~/.bashrc
echo 'export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"' >> ~/.bashrc
echo 'export PATH="$PATH:/mnt/c/Program Files/Oracle/VirtualBox"' >> ~/.bashrc

# TODO add wsl config options to /etc/wsl-conf
# [boot]
# systemd=true
# [automount]
# options = "metadata"

vagrant plugin install virtualbox_WSL2
# vagrant plugin install vagrant-vbguest  # disabled for now since it caused rhel VMs to crach on create

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
code --install-extension github.vscode-github-actions
code --install-extension github.vscode-pull-request-github
code --install-extension gruntfuggly.todo-tree
code --install-extension shinotatwu-ds.file-tree-generator
code --install-extension mhutchie.git-graph
code --install-extension eamodio.gitlens
code
