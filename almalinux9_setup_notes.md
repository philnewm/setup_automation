## Enbale fractional scaling on wayland
* `gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"`
* fractional scaling on Xorg tricky - ubuntu provides a patch - RnD required

## AMD GPU computing driver
* using radeon software for linux
* might be available from distro repo right away - RnD required
* `sudo amdgpu-install --opencl=rocr --vulkan=pro --accept-eula` (needs crb repo enabled `dnf config-manager --set-enabled crb`) 
* reasearch if proprietary vulkan has any benefits over opensource version

## System Monitor through flatpak instalaltion
* mission center as system monitor
* enforce dark theme for flatpaks
* `sudo flatpak override --env=GTK_THEME=Adwaita-dark`

## 4k Display using fractional scaling
* works only on wayland for now
* will keep desktop on wayland until issues arise

## Default back to Xorg (Can be ignored as it seems to work)
* maya's licensing manager is not yet fully able to run on wayland
* see: https://www.autodesk.com/support/technical/article/caas/tsarticles/ts/3t2VQSfCGLLvGEwb2lPn44.html

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
 * libglvnd-opengl
* python3 install recognized from inzternal console right away
* checks differences between alma default setup and fedora

## Houdini dependencies
* `sudo yum install libXScrnSaver`
* Vulkan Viewport renderer doesn#t seem to work out-of-the-box
* vulkan error:
  > Warning: Ignoring XDG_SESSION_TYPE=wayland on Gnome. Use QT_QPA_PLATFORM=wayland to run on Wayland anyway.
ERROR: failed to import VK semaphore in GL
Spawn Error: : No such file or directory
Error running xmessage
Argument list:
   0: xmessage
   1: Vulkan could not be initialized. Falling back to OpenGL.
* might be casued by SELinux - pops up denial messages

## Maya2025 Dependencies
* https://help.autodesk.com/view/MAYAUL/2024/ENU/?guid=GUID-D2B5433C-E0D2-421B-9BD8-24FED217FD7F&v=2025
* setup guide: https://help.autodesk.com/view/MAYAUL/2024/ENU/?guid=GUID-E7E054E1-0E32-4B3C-88F9-BF820EB45BE5&v=2025
* wayland not supported: https://www.autodesk.com/support/technical/article/caas/tsarticles/ts/3t2VQSfCGLLvGEwb2lPn44.html
  initla logging in license manager needs to happen on Xorg afterwards wayland works just fine

## KVM
* `systemctl restart libvirtd`
* `systemctl enable libvirtd`

## Blender dependency
* `sudo dnf install libdecor`
