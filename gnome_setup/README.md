Gnome Setup
=========

This Roles builds a customized gnome desktop environment.
It includes a bunch of dconf settings as well as extensions and themes beeing installed all in one go.

Extensions (not available on every distro):
- drive-menu
- user-theme
- appindicator
- sound-output-device-chooser
- no-overview
- tiling-assistant
- dash-to-panel
- system-monitor

Themes:
- Shell Theme: Lavanda-Dark
- Icon Theme: Tela-circle-purple-dark
- Cursor Theme: Qogir-cursors
- Wallpaper: Dynamic_Wallpapers

Additionally this role includes a full vagrant based molecule testing setup for CentOSStream9, Almalinux9, Rocky9, Debian12 and Ubuntu22.04 VMs at `extensions/molecule/gnome_setup_test`

Requirements
------------

Currently the role expects vagrant users profile pictures to be located at `~/Documents/vagrant` by default, but this will change in future development.
The following packages are required but will also be installed by the role automatically.

**RedHat based systems**
- python3-psutil
- git
- glibc-langpack-en

**Debian based systems**
- python3-psutil
- git

Role Variables
--------------

- defaults/main/common.yml
  - user_install_dir: Custom install directory inside users home directory
  - additional_rhel_repos: Extra repositories for RedHat based distros like CentOSStream9, AlmaLinux, Rocky, ...
  - gnome_packages: Gnome default package lists per distrobution
  - obsolete_packages: Gnome default packages to remove from base install
  - gdm_config_file: Path to gdm configuration file per distribution
  - gnome_base_settings: Gnome dconf settings to change per gnome major version number
- defaults/main/extensions.yml
  - gnome_extensions: list of extensions grouped by their distro specific names, including dconf settings if required
  - gnome_extensions_2: New list for more flat structure of the original implementation (WiP)
  - ext_config: list of extension specific dconf configs for more flat structure (WiP)
  - git_ext: List of extensions to be installed from custom sources using git and their respective git realted information
  - extension_paths: directories gnome extensions should be installed in
  - obsolete_gnome_extensions: List of extensions to remove from default gnome-shell install
- defaults/main/themes.yml
  - gnome_themes: Dictionary of theme types having the names as their values and dconf dictionary
  - theme_repo: Dictionary of theme names including their git specific information
  - theme_paths: directories gnome themes should be installed in
  - picture_src_path: profile picture source path
  - picture_dest_path: profile picture destination path
  - profile_config_path: Gnome user profile config path
  - profile_pictures: Dictionary of usernames mapped to theit according profile pictures
  - valid_shells: Shell names to grab valid shell user names from

Dependencies
------------

This role doesn't depend on any additional ansible-galaxy roles

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:
```yaml
---

- name: Create and configure gnome desktop
  hosts: client
  tasks:
    - name: Include gnome role present
      ansible.builtin.include_role:
        name: gnome_setup
      vars:
        gnome_setup_state: present

...
```
License
-------

MIT
