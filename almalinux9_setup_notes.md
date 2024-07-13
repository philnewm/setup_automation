## Enbale fractional scaling on wayland
* `gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"`
* fractional scaling on Xorg tricky - ubuntu provides a patch - RnD required

## AMD GPU computing driver
* using radeon software for linux
* might be available from distro repo rith away - RnD required
* `amdgpu-install --opencl=rocr --vulkan=amdvlk`
* reasearch if proprietary vulkan has any benefits over opensource version

## System Monitor through flatpak instalaltion
* mission center as system monitor
* enforce dark theme for flatpaks
* `sudo flatpak override --env=GTK_THEME=Adwaita-dark`

## 4k Display using fractional scaling
* works only on wayland for now
* will keep desktop on wayland until issues arise

## Dynamic Wallpapers
* custom curl commands allow for content selection
* reduce installation time a lot
* only grab dynmic wallappers
* maybe some nice other too

## Installing Ulauncher dependenciesa
* `pip install xdg` - RnD for OS package
* `pip install pyxdg` - RnD for OS package
* `sudo dnf install keybinder3-devel`
* `pip install python-Levenshtein`
* `pip install pyinotify`
* check for virtual environemnt usage or creating package
* research default ulauncher install dir and how to launch it
* no provided package for alma

## Davince Resolve dependencies
* `sudo dnf install`
 * apr
 * apr-util
 * mesa-libGLU
 * xcb-util-image
 * xcb-util-keysyms
 * xcb-util-renderutil
 * xcb-util-wm
* python3 install recognized from inzternal console right away
* checks differences between alma default setup and fedora

## Houdini dependencies
* `sudo yum install libXScrnSaver`
