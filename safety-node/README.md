# Safety Node for Donkey Car
** quick & dirty **

## [code in fork of donkeycar, branch tf_2_9](https://github.com/Heavy02011/donkeycar/tree/tf_2_9)
- ```donkeycar/donkeycar/parts/lidar_hybo.py``` delivers distances & angles

- ```donkeycar/donkeycar/parts/safety.py``` is the actual safety node that uses lidar data and sets throttle to zero when we are close to a collision, i.e.
    - angle    = 70  ... 110 deg
    - distance = 0.2 ... 1.0 m

- [manage_safety.py](./manage_safety.py)
```
# add lidar
if cfg.USE_LIDAR:
    from donkeycar.parts.lidar import RPLidar
    if cfg.LIDAR_TYPE == 'RP':
        print("adding RP lidar part")
        lidar = RPLidar(lower_limit = cfg.LIDAR_LOWER_LIMIT, upper_limit = cfg.LIDAR_UPPER_LIMIT)
        V.add(lidar, inputs=[],outputs=['lidar/dist_array'], threaded=True)
    if cfg.LIDAR_TYPE == 'YD':
        print("YD Lidar not yet supported")

    #rbx>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    if cfg.LIDAR_TYPE == 'HYBO':
        CLOCKWISE = 1
        COUNTER_CLOCKWISE = -1
        print("adding HYBO lidar part")
        from donkeycar.parts.lidar_hybo import HyboLidar
        from donkeycar.parts.safety import Safety
        # lidar = RPLidar(lower_limit = cfg.LIDAR_LOWER_LIMIT, upper_limit = cfg.LIDAR_UPPER_LIMIT)
        # V.add(lidar, inputs=[],outputs=['lidar/dist_array'], threaded=True)

        lidar = HyboLidar(
            min_angle=70, max_angle=110,
            min_distance=0.2, max_distance=1.0,
            forward_angle=90,
            angle_direction=COUNTER_CLOCKWISE,
            batch_ms=50.)
        # V.add(lidar, outputs=['measurements'], threaded=True)
        V.add(lidar, outputs=['measurements'], threaded=True)

    #rbx<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    
aiLauncher = AiLaunch(cfg.AI_LAUNCH_DURATION, cfg.AI_LAUNCH_THROTTLE, cfg.AI_LAUNCH_KEEP_ENABLED)
V.add(aiLauncher,
        inputs=['user/mode', 'pilot/throttle'],
        outputs=['pilot/throttle'])

# add safety node to set user & pilot throttle to zero whenn collision possible

#rbx>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

speed = 1 #m/s
safety_user = Safety(speed)
V.add(safety_user,
    inputs=['speed', 'measurements', 'user/throttle'],
    outputs=['emergency_braking', 'user/throttle'], threaded=False)

speed = 1 #m/s
safety_pilot = Safety(speed)
V.add(safety_pilot,
    inputs=['speed', 'measurements', 'pilot/throttle'],
    outputs=['emergency_braking', 'pilot/throttle'], threaded=False)

#rbx<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

#
# Decide what inputs should change the car's steering and throttle
# based on the choice of user or autopilot drive mode
#
V.add(DriveMode(cfg.AI_THROTTLE_MULT),
        inputs=['user/mode', 'user/angle', 'user/throttle',
                'pilot/angle', 'pilot/throttle'],
        outputs=['steering', 'throttle'])
...
```
## performance is a problem
```
INFO:donkeycar.parts.hybo_ilidar:HyboLidar total scan timfrom hybo import Lidar e = 169.3146412372589 seconds
INFO:donkeycar.parts.hybo_ilidar:HyboLidar total scan count = 194873 scans
INFO:donkeycar.parts.hybo_ilidar:HyboLidar total measurement count = 91622 measurements
INFO:donkeycar.parts.hybo_ilidar:HyboLidar rate = 1150.951852574441 scans per second
INFO:donkeycar.parts.hybo_ilidar:HyboLidar rate = 541.1345370398949 measurements per second
INFO:donkeycar.parts.tub_v2:Closing tub /home/rainer/d2/data/tub_29_23-05-06
INFO:donkeycar.vehicle:Part Profile Summary: (times in ms)
INFO:donkeycar.vehicle:
+-----------------------+--------+--------+--------+--------+--------+--------+--------+
|          part         |  max   |  min   |  avg   |  50%   |  90%   |  99%   | 99.9%  |
+-----------------------+--------+--------+--------+--------+--------+--------+--------+
|       CSICamera       |  2.56  |  0.01  |  0.03  |  0.02  |  0.03  |  0.09  |  2.15  |
|       HyboLidar       |  0.08  |  0.01  |  0.01  |  0.01  |  0.02  |  0.04  |  0.08  |
|   LocalWebController  |  2.02  |  0.04  |  0.09  |  0.05  |  0.09  |  1.00  |  1.89  |
| PS3JoystickController |  0.10  |  0.03  |  0.04  |  0.03  |  0.05  |  0.08  |  0.10  |
|          Pipe         |  0.23  |  0.01  |  0.02  |  0.02  |  0.02  |  0.09  |  0.21  |
|      ExplodeDict      |  0.10  |  0.01  |  0.02  |  0.01  |  0.02  |  0.03  |  0.09  |
|     ThrottleFilter    |  0.03  |  0.01  |  0.02  |  0.02  |  0.02  |  0.02  |  0.03  |
|   UserPilotCondition  |  0.11  |  0.02  |  0.02  |  0.02  |  0.02  |  0.06  |  0.10  |
|     RecordTracker     |  0.47  |  0.01  |  0.03  |  0.02  |  0.02  |  0.27  |  0.46  |
|        AiLaunch       |  0.25  |  0.02  |  0.02  |  0.02  |  0.02  |  0.07  |  0.22  |
|         Safety        | 512.80 | 500.04 | 500.86 | 500.49 | 501.81 | 505.61 | 511.83 |
|         Safety        | 510.24 | 500.05 | 500.91 | 500.49 | 502.32 | 506.81 | 510.02 |
|       DriveMode       |  2.06  |  0.03  |  0.05  |  0.03  |  0.04  |  0.09  |  1.74  |
|    ToggleRecording    |  1.66  |  0.02  |  0.07  |  0.02  |  0.03  |  1.09  |  1.57  |
|      PWMSteering      |  0.15  |  0.03  |  0.04  |  0.04  |  0.04  |  0.09  |  0.14  |
|      PWMThrottle      |  0.32  |  0.02  |  0.03  |  0.02  |  0.03  |  0.08  |  0.28  |
|       TubWriter       | 20.61  |  8.25  | 11.82  | 10.96  | 15.70  | 20.31  | 20.58  |
+-----------------------+--------+--------+--------+--------+--------+--------+--------+
```