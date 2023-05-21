# Install log n12

## error
```   
rainer@donkeynano12:~/dev$ sudo apt-get upgrade -y
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Calculating upgrade... Done
The following packages were automatically installed and are no longer required:
  apt-clone archdetect-deb bogl-bterm busybox-static cryptsetup-bin dpkg-repack
  gir1.2-timezonemap-1.0 gir1.2-xkl-1.0 grub-common kde-window-manager kinit kio kpackagetool5
  kwayland-data kwin-common kwin-data kwin-x11 libdebian-installer4 libkdecorations2-5v5
  libkdecorations2private5v5 libkf5activities5 libkf5attica5 libkf5completion-data
  libkf5completion5 libkf5declarative-data libkf5declarative5 libkf5doctools5
  libkf5globalaccel-data libkf5globalaccel5 libkf5globalaccelprivate5 libkf5idletime5
  libkf5jobwidgets-data libkf5jobwidgets5 libkf5kcmutils-data libkf5kcmutils5 libkf5kiocore5
  libkf5kiontlm5 libkf5kiowidgets5 libkf5newstuff-data libkf5newstuff5 libkf5newstuffcore5
  libkf5package-data libkf5package5 libkf5plasma5 libkf5quickaddons5 libkf5solid5 libkf5solid5-data
  libkf5sonnet5-data libkf5sonnetcore5 libkf5sonnetui5 libkf5textwidgets-data libkf5textwidgets5
  libkf5waylandclient5 libkf5waylandserver5 libkf5xmlgui-bin libkf5xmlgui-data libkf5xmlgui5
  libkscreenlocker5 libkwin4-effect-builtins1 libkwineffects11 libkwinglutils11
  libkwinxrenderutils11 libqgsttools-p1 libqt5designer5 libqt5help5 libqt5multimedia5
  libqt5multimedia5-plugins libqt5multimediaquick-p5 libqt5multimediawidgets5 libqt5opengl5
  libqt5quickwidgets5 libqt5sql5 libqt5test5 libxcb-composite0 libxcb-cursor0 libxcb-damage0
  os-prober python3-dbus.mainloop.pyqt5 python3-icu python3-pam python3-pyqt5 python3-pyqt5.qtsvg
  python3-pyqt5.qtwebkit python3-sip qml-module-org-kde-kquickcontrolsaddons
  qml-module-qtmultimedia qml-module-qtquick2 rdate tasksel tasksel-data
Use 'sudo apt autoremove' to remove them.
The following packages have been kept back:
  nvidia-l4t-3d-core nvidia-l4t-camera nvidia-l4t-cuda nvidia-l4t-firmware
  nvidia-l4t-graphics-demos nvidia-l4t-gstreamer nvidia-l4t-init nvidia-l4t-jetson-multimedia-api
  nvidia-l4t-multimedia nvidia-l4t-multimedia-utils nvidia-l4t-wayland nvidia-l4t-weston
  nvidia-l4t-x11 python3-software-properties software-properties-common software-properties-gtk
  ubuntu-drivers-common
0 upgraded, 0 newly installed, 0 to remove and 17 not upgraded.
1 not fully installed or removed.
After this operation, 0 B of additional disk space will be used.
Setting up nvidia-l4t-bootloader (32.5.2-20210709090126) ...
3448-300---1--jetson-nano-devkit-mmcblk0p1
Starting bootloader post-install procedure.
ERROR. Procedure for bootloader update FAILED.
Cannot install package. Exiting...
dpkg: error processing package nvidia-l4t-bootloader (--configure):
 installed nvidia-l4t-bootloader package post-installation script subprocess returned error exit status 1
Errors were encountered while processing:
 nvidia-l4t-bootloader
E: Sub-process /usr/bin/dpkg returned an error code (1)
```

## fix
The error you're encountering seems to be caused by a conflict with the information that dpkg saves during the installation process. There's a workaround suggested on the NVIDIA developer forum that involves moving some directories around and forcing an installation. Here are the steps:

Move /var/lib/dpkg/info/ to /var/lib/dpkg/backup/ and create a new /var/lib/dpkg/info/ directory:
```
sudo mv /var/lib/dpkg/info/ /var/lib/dpkg/backup/
sudo mkdir /var/lib/dpkg/info/
```

Update your repositories and force an installation:
```
sudo apt-get update
sudo apt-get -f install
```

Move the new structure from dpkg/info to the old info:
```
sudo mv /var/lib/dpkg/info/* /var/lib/dpkg/backup/
```

Remove the new dpkg structure folder and restore the old one:
```
sudo rm -rf /var/lib/dpkg/info
sudo mv /var/lib/dpkg/backup/ /var/lib/dpkg/info/
```

Please note, if these steps are not followed, the script will continue to fail during installation. This is considered a "hacky" solution and doesn't require you to flash the device again​1​.

As with any solution that involves moving system directories, please proceed with caution. Make sure you understand what each command does before executing it, and consider backing up any important data before proceeding.

