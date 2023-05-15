# Install log n11
This documents the installation apart from just testing branch tf_2_9.

## docker
- run without sudo
```
sudo groupadd docker
sudo usermod -aG docker $USER
docker run hello-world
```
- [default nvidia runtime](https://github.com/dusty-nv/jetson-containers)
- /etc/docker/daemon.json
```
{
    "runtimes": {
        "nvidia": {
            "path": "nvidia-container-runtime",
            "runtimeArgs": []
        }
    },

    "default-runtime": "nvidia"
}
```


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

## [ROS](https://gist.github.com/Pyrestone/ef683aec160825eee5c252f22218ddb2)
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

## lidar RPlidar
install
```
sudo apt-get install ros-melodic-rplidar-ros
sudo chmod 666 /dev/ttyUSB0
```
run
```
roslaunch rplidar_ros rplidar.launch
```

## lidar D300
```
cd ~/ldlidar_ros_ws$ 
cattkin_make
source devel/setup.bash
#roslaunch ldlidar_stl_ros ld06.launch 
roslaunch ldlidar_stl_ros viewer_ld06_kinetic_melodic.launch
```

## jetson-utils
```
sudo apt-get install libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev libgstreamer-plugins-good1.0-dev libgstreamer1.0-dev
git clone https://github.com/GStreamer/gst-plugins-bad.git
cd gst-plugins-bad
git checkout 1.18.4  # Replace with the latest stable version of GStreamer
./autogen.sh --noconfigure
./configure --prefix=/usr --with-package-name="GStreamer Bad Plugins (Ubuntu)" --with-package-origin=https://ubuntu.com --disable-deprecated --disable-examples --disable-tests --disable-docs --disable-gtk-doc --disable-libnice --disable-libwebrtc --disable-lv2 --disable-modplug --disable-mpeg2enc --disable-nsf --disable-opus --disable-realtime --disable-sbc --disable-siren --disable-smoothstreaming --disable-sndfile --disable-soundtouch --disable-spandsp --disable-srtp --disable-teletext --disable-timidity --disable-vulkan --disable-wasapi --disable-wildmidi --disable-x265 --disable-zbar
make -j$(nproc)
sudo make install


Navigate to the build directory:
cd ~/workspace/jetson-utils/build
Remove any previous build artifacts:
rm -rf *
Run CMake to configure the build:
cmake ..
Build the package:
make
Install the package:
sudo make install

Now the jetson-utils package should build successfully, and the missing json-glib/json-glib.h error should be resolved.



 1190  ll
 1191  cd build/
 1192  make
 1193  sudo apt-get install libsoup2.4-dev
 1194  make
 1195  sudo apt-get install gstreamer1.0-plugins-bad
 1196  rm -rf *
 1197  Reading state information... Done
 1198  cmake ..
 1199  make
 1200  (donkey) rainer@donkeynano10:~/projects/jetson-utils/build$ 
 1201  sudo apt-get install libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev libgstreamer-plugins-good1.0-dev libgstreamer1.0-dev
 1202  git clone https://github.com/GStreamer/gst-plugins-bad.git
 1203  cd gst-plugins-bad
 1204  git checkout 1.18.4  # Replace with the latest stable version of GStreamer
 1205  ./autogen.sh --noconfigure
 1206  ./configure --prefix=/usr --with-package-name="GStreamer Bad Plugins (Ubuntu)" --with-package-origin=https://ubuntu.com --disable-deprecated --disable-examples --disable-tests --disable-docs --disable-gtk-doc --disable-libnice --disable-libwebrtc --disable-lv2 --disable-modplug --disable-mpeg2enc --disable-nsf --disable-opus --disable-realtime --disable-sbc --disable-siren --disable-smoothstreaming --disable-sndfile --disable-soundtouch --disable-spandsp --disable-srtp --disable-teletext --disable-timidity --disable-vulkan --disable-wasapi --disable-wildmidi --disable-x265 --disable-zbar
 1207  make -j$(nproc)
 1208  sudo make install
 1209  ./configure --prefix=/usr --with-package-name="GStreamer Bad Plugins (Ubuntu)" --with-package-origin=https://ubuntu.com --disable-deprecated --disable-examples --disable-tests --disable-docs --disable-gtk-doc --disable-libnice --disable-libwebrtc --disable-lv2 --disable-modplug --disable-mpeg2enc --disable-nsf --disable-opus --disable-realtime --disable-sbc --disable-siren --disable-smoothstreaming --disable-sndfile --disable-soundtouch --disable-spandsp --disable-srtp --disable-teletext --disable-timidity --disable-vulkan --disable-wasapi --disable-wildmidi --disable-x265 --disable-zbar
 1210  ll
 1211  cd ..
 1212  \rm -r gst-plugins-bad/
 1213  rm -rf *
 1214  cmake ..
 1215  make
 1216  sudo apt-get install libjson-glib-dev
 1217  rm -rf *
 1218  cmake ..
 1219  make
 1220  sudo apt-get install libgstrtspserver-1.0-dev
 1221  rm -rf *
 1222  cmake ..
 1223  make
 1224  sudo make install
 1225  history 

/usr/include/gstreamer-1.0/gst/opencv
/usr/include/boost/compute/interop/opencv







Regenerate response


```

## [camera](https://github.com/dusty-nv/ros_deep_learning)
install
```

```
run
```

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

roslaunch slam_toolbox online_async.launch  args:='rb-slam-config.yaml'


```

## rviz 
```
rosrun rviz rviz -d /path/to/your/rb_slam_config.rviz

```

## tf
install
```
sudo apt-get update
sudo apt-get install ros-noetic-tf
```
run
```
rosrun tf tf_monitor
rosrun tf tf_monitor frame1 frame2
```

## rb_robot_slam
```
roslaunch rb_robot_slam rb-robot-slam.launch 
```

## ackerman_msg
```
sudo apt-get install ros-melodic-ackermann-msgs
```

## lidar udev

### LDROBOT D300
```
lsusb
Bus [Bus Number] Device [Device Number]: ID [idVendor]:[idProduct] [Device Manufacturer and Name]
Bus 001 Device 010: ID 10c4:ea60 Cygnal Integrated Products, Inc. CP210x UART Bridge / myAVR mySmartUSB light
```
/etc/udev/rules.d/99-ldrobot-d300.rules 
```
KERNEL=="ttyACM[0-9]*", ACTION=="add", ATTRS{idVendor}=="10c4", ATTRS{idProduct}=="ea60", MODE="0666", GROUP="dialout", SYMLINK+="sensors/hokuyo"
```

### RPlidar
Bus 001 Device 011: ID 10c4:ea60 Cygnal Integrated Products, Inc. CP210x UART Bridge / myAVR mySmartUSB light

/etc/udev/rules.d/99-rplidar.rules 
```
KERNEL=="ttyUSB[0-9]*", ACTION=="add", ATTRS{idVendor}=="10c4", ATTRS{idProduct}=="ea60", MODE="0666", GROUP="dialout", SYMLINK+="sensors/hokuyo"
```



install
```
sudo udevadm control --reload-rules && sudo udevadm trigger
```
