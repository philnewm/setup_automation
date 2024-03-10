Basic SMB Server for testing
=========

This basic SMB server is only intended for testing smb mount setups on the testing clients.
I only creates a single user based on y provided secrets file.

Requirements
------------

This role requires the samba package to be installed.

Role Variables
--------------

defaults:
smb_server_config_path: provides the smb config file path, default: "/etc/samba/smb.conf"

vars:
smb_server_install_rpm_packages: install necessary packages for rhel based distros using the dnf package manager

smb_server_install_deb_packages: install necessary packages for debian based distros using the apt package manager

Dependencies
------------

This role doesn't depend on any additional ansible-galaxy roles

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

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

License
-------

MIT

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
