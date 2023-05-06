# Safety Node for Donkey Car

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