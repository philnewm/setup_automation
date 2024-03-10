Basic SMB Server for testing
=========

This basic SMB server is only intended for testing smb mount setups on the testing clients.
I only creates a single user based on y provided secrets file.

Requirements
------------

This role requires the samba package to be installed.

Role Variables
--------------

- defaults.yml
  - smb_server_config_path: provides the smb config file path, default: "/etc/samba/smb.conf"

- vars.yml
  - smb_server_install_rpm_packages: install necessary packages for rhel based distros using the dnf package manager
  - smb_server_install_deb_packages: install necessary packages for debian based distros using the apt package manager

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