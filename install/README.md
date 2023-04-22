# Install log
This documents the installation apart from just testing branch tf_2_9.

## [ade](https://gitlab.com/ApexAI/ade-cli/-/releases)
```
chmod +x ade
ade
./ade
sudo mv ade /usr/local/bin/
ade --version
ade update-cli
ade --version

mkdir -p ~/adehome
cd adehome/
touch .adehome
git clone https://gitlab.com/autowarefoundation/autoware.auto/AutowareAuto.git
d AutowareAuto/
git branch -a|grep etson
git checkout f1tenth-devel-jetson

cp ~/.bashrc ~/.bashrc.bak
mv ~/.bashrc ~/adehome/.bashrc
ln -s ~/adehome/.bashrc
cd adehome/

cd AutowareAuto/
ade start --update --enter
ade --rc .aderc-jetson-f1tenth start --update --enter  # NOT WORKING
```

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

## pwm

[x] throttle
```
donkey calibrate --bus 1 --channel 0
```
[x] steering
```
donkey calibrate --bus 1 --channel 1
```

## [hotspot](https://medium.com/@jones.0bj3/wireless-networking-for-the-jetson-nano-and-rpi-504868dd1b3a)
```
sudo -i -u rainer nmcli dev wifi hotspot ifname wlan1 ssid rbnano1-drivingnetwork password XXXXXXXX
```

```
```
cp rbnano1-drivingnetwork /etc/NetworkManager/system-connections/
nmcli c up rbnano1-drivingnetwork
nmcli c down rbnano1-drivingnetwork
```

## ROS
```
apt-cache search ros-melodic-driver-base
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

sudo apt-get install ros-melodic-driver-base
sudo apt-get install ros-melodic-desktop-full
sudo apt-get install ros-melodic-turtlebot3 
sudo apt-get install ros-melodic-joy
sudo apt-get install ros-melodic-slam-toolbox
```

## lidar
install
```
sudo apt-get install ros-melodic-rplidar-ros
sudo chmod 666 /dev/ttyUSB0
```
run
```
roslaunch rplidar_ros rplidar.launch
```


## [SLAM_TOOLBOX](https://github.com/SteveMacenski/slam_toolbox)
install
```
sudo apt install ros-melodic-slam-toolbox
```
config
```
cd /opt/ros/melodic/share/slam_toolbox/config/config.yaml
```
run
```
roslaunch slam_toolbox lifelong.launch 
roslaunch slam_toolbox online_sync.launch slam_params_file:=/path/to/your/config.yaml

roslaunch slam_toolbox online_sync.launch slam_params_file:=/home/rainer/catkin_ws/rb-slam-config.yaml

```

## rviz 
```
rosrun rviz rviz -d /path/to/your/rb_slam_config.rviz

```


