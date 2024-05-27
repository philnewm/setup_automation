SMB mount setup based on systemd mount files
--------------------------------------------

This creates the required systemd mount files to mount smb shares on boot.
The role only creates a single smb user based on the provided secrets.yml file.
This role has a state variable called `smb_mount_state`. It controlls if the features of this role should be setup or removed.

Testing
-------

This role includes a full vagrant based molecule testing setup for CentOSStream9, Almalinux9, Rocky9, Debian12 and Ubuntu22.10 VMs at `smb_mount/molecule`. Each scenario uses the the `smb_server` role to enable testable mounts. Additionally the scenarios use symlinks for their `requirements.yml` and the roles directory. The `molecule.yml` file on the other hand is individual for each scenario. 

[![SMB mount test](https://github.com/philnewm/setup_automation/actions/workflows/smb-tdd.yml/badge.svg?branch=smb-tdd&event=push)](https://github.com/philnewm/setup_automation/actions/workflows/smb-tdd.yml)

Structure
---------
```
📦smb_mount
 ┣ 📂defaults
 ┃ ┗ 📂main
 ┃ ┃ ┣ 📜automount_file_cfg.yml
 ┃ ┃ ┣ 📜common.yml
 ┃ ┃ ┗ 📜mount_file_cfg.yml
 ┣ 📂handlers
 ┃ ┗ 📜main.yml
 ┣ 📂meta
 ┃ ┗ 📜main.yml
 ┣ 📂molecule
 ┃ ┣ 📂template
 ┃ ┃ ┣ 📂roles
 ┃ ┃ ┃ ┗ 📂smb_server
 ┃ ┣ 📂test_alma9
 ┃ ┣ 📂test_centosstream9
 ┃ ┣ 📂test_debian12
 ┃ ┣ 📂test_rocky9
 ┃ ┗ 📂test_ubuntu2210
 ┣ 📂tasks
 ┃ ┣ 📜absent.yml
 ┃ ┣ 📜dependencies.yml
 ┃ ┣ 📜main.yml
 ┃ ┗ 📜present.yml
 ┣ 📂vars
 ┃ ┗ 📜main.yml
 ┗ 📜README.md
```

The file `/molecule/template/converge.yml` as supposed to be used as playbook template. The tasks are split into `present.yml`, `absent.yml` - which both get included in the `main.yml`. Any external dependencies are included in dependencies.yml, which is supposed to run in a pre_task.

Requirements
------------

This role requires the `cifs` package to be installed.
This is handled inside the `tasks/dependcies.yml` file and should get executed in the pre_tasks section of a playbook.

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
- name: Converge smb mount present
  hosts: client

  vars_files:
    - smb_vars.yml

  pre_tasks:
    - name: Include dependencies
      ansible.builtin.include_role:
        name: smb_mount
        tasks_from: dependencies.yml

  tasks:
    - name: Include smb role present
      ansible.builtin.include_role:
        name: smb_mount
        tasks_from: main.yml
      vars:
        smb_mount_state: present
        smb_mount_server_host_name: "fileserver"
        smb_mount_server_ip: "192.168.56.200"
```

License
-------

MIT
