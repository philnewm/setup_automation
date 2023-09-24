#!/bin/bash

user_name="remote_control"
password="5Xc5jqE_wqpMr&"

if id "$user_name" &>/dev/null; then
    echo "User '$user_name' already exists."
    exit 1
fi

sudo useradd -m "$user_name"
sudo echo "$user_name:$password" | chpasswd

sudo usermod -aG wheel "$user_name"

echo "User '$user_name' has been created and added to the sudoers group."
