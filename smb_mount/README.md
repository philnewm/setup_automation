SMB mount setup based on systemd mount files
=========

This creates the required systemd mount files to mount smb shares on boot.
The role only creates a single smb user based on the provided secrets.yml file.
This role has a state variable called `smb_mount_state`. It controlls if the features of this role should be setup or removed.

Requirements
------------

This role requires the `cifs` package to be installed.

Role Variables
--------------

- defaults/main/common.yml
  - smb_mount_state: Defines if the roles features should be present or absent on the system, default: "present"
  - smb_mount_hosts_file_path: Location of the hosts file on the system, default: /etc/hosts
  - smb_mount_credentials_file: Name of the smb credentials file, default: .smb
  - smb_mount_file_path: Location to write the systemd mount files to, default: /etc/systemd/system
  - smb_mount_server_host_name: Servers hostname , default: "placeholder"
  - smb_mount_server_ip: Servers IP address, default: "placeholder"
  - smb_mount_hosts_entry: The combined line of `smb_mount_server_ip` and `smb_mount_server_ip` which gets written to the hosts file in `smb_mount_hosts_file_path`, not supposed to be changed
  - smb_mount_mnt_point: The top level directory to create the mount points in, default: mnt
- defaults/main/mount_file_cfg.yml
  - mount_file: Defines the systemd mount file as yaml formatted dictionary based on the variables defined in `defaults/main/common.yml`, adjust according to your needs based on the [systemd mount file docs](https://www.freedesktop.org/software/systemd/man/latest/systemd.mount.html)
- defaults/main/mount_file_cfg.yml
  - Defines the systemd automount file as yaml formatted dictionary based on the variables defined in `defaults/main/common.yml`, adjust according to your needs based on the [systemd automount file docs](https://www.freedesktop.org/software/systemd/man/latest/systemd.automount.html)

- vars.yml
  - smb_server_install_dnf_packages: install necessary packages for rhel based distros using the dnf package manager
  - smb_mount_install_apt_packages: install necessary packages for debian based distros using the apt package manager
  - smb_mount_ubuntu_packages: Ubuntu specific kernel package to support UTF-8 encoding for mounts

Dependencies
------------

This role doesn't depend on any additional ansible-galaxy roles

Example Playbook
----------------

This example shows the necessary file for the smb user credentials (secrets.yml)

```yaml
- name: Converge
  hosts: smbserver
  vars_files:
    - ../../../secrets.yml
  become: true
  tasks:
    - name: Initialize SMB server
      ansible.builtin.import_role:
        name: smb_server
        tasks_from: main.yml
```

License
-------

MIT
