Desktop Setup Roles
=========
[![Gnome test](https://github.com/philnewm/setup_automation/actions/workflows/gnome-role-tdd.yml/badge.svg)](https://github.com/philnewm/setup_automation/actions/workflows/gnome-role-tdd.yml)
[![SMB mount test](https://github.com/philnewm/setup_automation/actions/workflows/smb-tdd.yml/badge.svg?branch=smb-tdd&event=push)](https://github.com/philnewm/setup_automation/actions/workflows/smb-tdd.yml)


This is a collection of roles meant to assemble my complete desktop workstation setup using Ansible.

Structure
=========

Right now every role just got it's own directory since it's a learning project in the first place and this makes it easier for me to apply structural changes to multiple roles in one go.
While gaining more knowledge on how to create a role blueprint which fits my needs just right.

Upcoming
========

Currently the smb_mount and gnome_setup role a pretty far developed even tho there will be further optimizations especially regarding the automated molecule testing environment since it's still quite redundant in it's current state.

Long-Term
=========
To use these roles effectivly with Ansible Galaxy they will be moved into their own repos at some later point in time to accelerate the setup automation through AWX

License
-------

MIT
