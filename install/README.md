# Install log
This documents the installation apart from just testing branch tf_2_9.

## [bluetooth autoconnector](https://github.com/noraworld/bluetoothctl-autoconnector.git)
```
(donkey) rainer@donkeynano10:~/dev/bluetoothctl-autoconnector$ sudo bluetoothctl
[bluetooth]# agent on
[bluetooth]# power on
[bluetooth]# scan on
Discovery started
[NEW] Device 7C:BB:8A:7A:2B:4B 7C-BB-8A-7A-2B-4B
[bluetooth]# connect 7C:BB:8A:7A:2B:4B 
Attempting to connect to 7C:BB:8A:7A:2B:4B
[CHG] Device 7C:BB:8A:7A:2B:4B Connected: yes
[CHG] Device 7C:BB:8A:7A:2B:4B Modalias: usb:v057Ep0330d0001
[CHG] Device 7C:BB:8A:7A:2B:4B UUIDs: 00001124-0000-1000-8000-00805f9b34fb
[CHG] Device 7C:BB:8A:7A:2B:4B UUIDs: 00001200-0000-1000-8000-00805f9b34fb
[CHG] Device 7C:BB:8A:7A:2B:4B ServicesResolved: yes
[Nintendo RVL-CNT-01-UC]# trust 7C:BB:8A:7A:2B:4B 
[CHG] Device 7C:BB:8A:7A:2B:4B Trusted: yes
Changing 7C:BB:8A:7A:2B:4B trust succeeded
[CHG] Device 7C:BB:8A:7A:2B:4B ServicesResolved: no
[CHG] Device 7C:BB:8A:7A:2B:4B Connected: no
[CHG] Device 7C:BB:8A:7A:2B:4B Connected: no
[bluetooth]# connect 7C:BB:8A:7A:2B:4B 
Attempting to connect to 7C:BB:8A:7A:2B:4B
[CHG] Device 7C:BB:8A:7A:2B:4B Connected: yes
Connection successful
[CHG] Device 7C:BB:8A:7A:2B:4B ServicesResolved: yes
[Nintendo RVL-CNT-01-UC]# trust 7C:BB:8A:7A:2B:4B 
Changing 7C:BB:8A:7A:2B:4B trust succeeded
```

## [joystick](https://github.com/ros-drivers/joystick_drivers/tree/main/joy)
install
```
sudo apt install joystick jstest-gtk evtest
sudo apt-get install ros-melodic-joy
git clone https://github.com/ros-drivers/joystick_drivers.git
```
launch
```
rosrun joy joy_node _dev_name:="*"
```
show
```
rostopic echo /joy
```

## store git credential
```
sudo apt-get update
sudo apt-get install libgnome-keyring-dev
cd /tmp
git clone https://github.com/git/git.git
cd git/contrib/credential/gnome-keyring
make
sudo make install
cd /tmp/
cd git/contrib/credential/gnome-keyring/
sudo cp git-credential-gnome-keyring /usr/local/bin/
git config --global credential.helper /usr/local/bin/git-credential-gnome-keyring
```

## SLAM_TOOLBOX
https://github.com/SteveMacenski/slam_toolbox
