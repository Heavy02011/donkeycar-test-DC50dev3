# Gazebo

## [turtlebopt3, shubhan@shubhan-Predator-PH315-51](https://youtu.be/E7-x7fU-ut4)
install
```
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
catkin_make

Clone the Turtlebot3 packages from the official Github repository:
cd ~/catkin_ws/src
git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
Install Turtlebot3 dependencies:

cd ~/catkin_ws
rosdep install --from-paths src --ignore-src -r -y

Build the packages:
cd ~/catkin_ws
catkin_make

Set the Turtlebot3 model:
For the simulation in Gazebo, you can set the model name by exporting the TURTLEBOT3_MODEL environment variable in your ~/.bashrc file. For example:

echo 'export TURTLEBOT3_MODEL=waffle' >> ~/.bashrc
source ~/.bashrc

sudo apt install ros-melodic-turtlebot3-* # NOT WORKIN
sudo apt-get install ros-melodic-slam-gmapping
```

run
```
roslaunch turtlebot3_gazebo turtlebot3_world.launch
roslaunch turtlebot3_slam   turtlebot3_slam.launch 
roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch OR
roslaunch teleop_twist_joy teleop.launch
rosrun map_server map_saver
rosrun map_server Map_saver -f map.yml
```

## joystick

Install the necessary ROS packages:
```
sudo apt-get install ros-melodic-joy
sudo apt-get install ros-melodic-teleop-twist-joy
Connect the PS3 joystick to your computer via Bluetooth.
```
Launch the joy node to detect the joystick:
```
rosparam set joy_node/dev "/dev/input/js0"
rosrun joy joy_node
Launch the teleop node to control the robot with the joystick:
rosrun teleop_twist_joy teleop_node
rosrun teleop_twist_joy teleop_node _config:=ps3.config.yaml
```
config ps3 with button ZR (number 7) as ENABLE Button, /cmd_vel will only show messages with ZR pressed while giving steering & throttle commands
```
more /opt/ros/melodic/share/teleop_twist_joy/config/ps3.config.yaml
axis_linear: 3
scale_linear: 1.0
scale_linear_turbo: 1.5

axis_angular: 0
scale_angular: 1.0

enable_button: 7  # 8 L2 shoulder button
enable_turbo_button: 10  # L1 shoulder button

```

run
```
roslaunch teleop_twist_joy teleop.launch
rostopic echo /cmd_vel
```