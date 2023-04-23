# F1TENTH

launch
```
roscore
roslaunch ldlidar_stl_ros ld06.launch
roslaunch teleop_twist_joy teleop.launch

roslaunch racecar teleop.launch
```

slam
```
roslaunch slam_toolbox online_async.launch 
```

rviz:
Transform [sender=unknown_publisher]
For frame [base_laser]: No transform to fixed frame [map]. TF error: [Could not find a connection between 'map' and 'base_laser' because they are not part of the same tree.Tf has two or more unconnected trees.]

rosrun tf static_transform_publisher 0.0 0.0 0.0 0 0 0 map base_laser 100
