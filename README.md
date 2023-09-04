# donkeycar-test-DC50dev3
testing https://github.com/autorope/donkeycar/tree/main

# Jetson Nano Orin 8GB

## 1 setup

### 1.2 follow [donkeydocs](https://github.com/autorope/donkeydocs/blob/Update_to_tf_29/docs/guide/robot_sbc/setup_jetson_nano.md#installation-for-donkey-car-main)

## 2 results
## 2.1 jtop
![](media/jetson-jtop1.png)
![](media/jetson-jtop4.png)
![](media/jetson-jtop7.png)

## 2.2 [OpenCV 4.6, tf 2.9, camera succesful](https://github.com/Heavy02011/donkeycar-test-tf_2_9/blob/main/test-result.md)

## 2.3 [pytest results in some errors, permissions gpio?](https://github.com/Heavy02011/donkeycar-test-tf_2_9/blob/main/pytest-log.txt)

## 2.4 hints
- [ ] give size of swapfile as default is 6 not 8 G, no way to change afterwards
- [ ] git checkout **main** NOT **tf_2_9**?


# PC Ubuntu 22.04, 16GB, NVIDIA GTX 1040Ti

```mamba env create -f install/envs/ubuntu.yml``` takes "ages" and is not finishing the install
so I copied another env and converted the ```install/envs/ubuntu.yaml``` to a ```ubuntu_requirements.txt```
and installed that with ```pip install -r ubuntu_requrements.txt```:

```
conda create --name tf_2_9 --clone openai
conda activate tf_2_9
python convert-yaml-req.py install/envs/ubuntu.yml ubuntu_requirements.txt
pip install -r ubuntu_requirements.txt 

sudo apt install libopencv-dev python3-opencv
pip install --upgrade pip setuptools
pip cache purge
pip install codecov 
```

- ubuntu_requirements.txt 
```
numpy
h5py
pillow
matplotlib
tornado
opencv-python
docopt
pandas
pylint
pytest
pytest-cov
#codecov
pip
progress
paho-mqtt
PrettyTable
pyfiglet
mypy
#pytorch
#torchvision==0.12
#torchaudio
#pytorch-lightning>=1.9,<2.0
psutil
plotly
pyyaml
tensorflow==2.9
fastai
pynmea2
pyserial
utm
albumentations
```

- Check torch gpu
```
(tf_2_9) rainer@neuron2204:/media/rainer/_data/30-projects/42-DIYrobocars/donkeycar$ 
python
Python 3.8.16 (default, Mar  2 2023, 03:21:46) 
[GCC 11.2.0] :: Anaconda, Inc. on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import torch
>>> torch.cuda.is_available()
True
>>> torch.cuda.device_count()
1
>>> torch.cuda.current_device()
0
>>> torch.cuda.device(0)
<torch.cuda.device object at 0x7ff9914e78b0>
>>> torch.cuda.get_device_name(0)
'NVIDIA GeForce GTX 1080 Ti'
```

- gym-donkeycar
```
(tf_2_9) rainer@neuron2204:/media/rainer/_data/30-projects/42-DIYrobocars/gym-donkeycar$ pip install -e .[gym-donkeycar]
Obtaining file:///media/rainer/_data/30-projects/42-DIYrobocars/gym-donkeycar
  Preparing metadata (setup.py) ... done
WARNING: gym-donkeycar 1.3.0 does not provide the extra 'gym-donkeycar'
Collecting gym==0.21 (from gym-donkeycar==1.3.0)
  Downloading gym-0.21.0.tar.gz (1.5 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1.5/1.5 MB 14.7 MB/s eta 0:00:00
  Preparing metadata (setup.py) ... error
  error: subprocess-exited-with-error
  
  × python setup.py egg_info did not run successfully.
  │ exit code: 1
  ╰─> [1 lines of output]
      error in gym setup command: 'extras_require' must be a dictionary whose values are strings or lists of strings containing valid project/version requirement specifiers.
      [end of output]
  
  note: This error originates from a subprocess, and is likely not a problem with pip.
error: metadata-generation-failed

× Encountered error while generating package metadata.
╰─> See above for output.

note: This is an issue with the package mentioned above, not pip.
hint: See above for details.
```
fixed with a ```pip uninstall gym``` and retrying ```pip install -e .[gym-donkeycar]```

- ```donkey ui``` runs into error
```
(tf_2_9) rainer@neuron2204:/media/rainer/_data/30-projects/mysims/tf_2_9/mycar$ sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 60 --slave /usr/bin/g++ g++ /usr/bin/g++-11
update-alternatives: using /usr/bin/gcc-11 to provide /usr/bin/gcc (gcc) in auto mode
(tf_2_9) rainer@neuron2204:/media/rainer/_data/30-projects/mysims/tf_2_9/mycar$ donkey ui
________             ______                   _________              
___  __ \_______________  /___________  __    __  ____/_____ ________
__  / / /  __ \_  __ \_  //_/  _ \_  / / /    _  /    _  __ `/_  ___/
_  /_/ // /_/ /  / / /  ,<  /  __/  /_/ /     / /___  / /_/ /_  /    
/_____/ \____//_/ /_//_/|_| \___/_\__, /      \____/  \__,_/ /_/     
                                 /____/                              

using donkey v5.0.dev1 ...
[INFO   ] [Logger      ] Record log in /home/rainer/.kivy/logs/kivy_23-04-17_3.txt
INFO:kivy:Logger: Record log in /home/rainer/.kivy/logs/kivy_23-04-17_3.txt
[INFO   ] [Kivy        ] v2.1.0
INFO:kivy:Kivy: v2.1.0
[INFO   ] [Kivy        ] Installed at "/home/rainer/anaconda3/envs/tf_2_9/lib/python3.8/site-packages/kivy/__init__.py"
INFO:kivy:Kivy: Installed at "/home/rainer/anaconda3/envs/tf_2_9/lib/python3.8/site-packages/kivy/__init__.py"
[INFO   ] [Python      ] v3.8.16 (default, Mar  2 2023, 03:21:46) 
[GCC 11.2.0]
INFO:kivy:Python: v3.8.16 (default, Mar  2 2023, 03:21:46) 
[GCC 11.2.0]
[INFO   ] [Python      ] Interpreter at "/home/rainer/anaconda3/envs/tf_2_9/bin/python"
INFO:kivy:Python: Interpreter at "/home/rainer/anaconda3/envs/tf_2_9/bin/python"
[INFO   ] [Logger      ] Purge log fired. Processing...
INFO:kivy:Logger: Purge log fired. Processing...
[INFO   ] [Logger      ] Purge finished!
INFO:kivy:Logger: Purge finished!
[INFO   ] [Factory     ] 189 symbols loaded
INFO:kivy:Factory: 189 symbols loaded
[INFO   ] [Image       ] Providers: img_tex, img_dds, img_sdl2, img_pil (img_ffpyplayer ignored)
INFO:kivy:Image: Providers: img_tex, img_dds, img_sdl2, img_pil (img_ffpyplayer ignored)
[INFO   ] [Text        ] Provider: sdl2
INFO:kivy:Text: Provider: sdl2
[INFO   ] [Window      ] Provider: sdl2
INFO:kivy:Window: Provider: sdl2
libGL error: MESA-LOADER: failed to open iris: /home/rainer/anaconda3/envs/tf_2_9/bin/../lib/libstdc++.so.6: version `GLIBCXX_3.4.30' not found (required by /lib/x86_64-linux-gnu/libLLVM-15.so.1) (search paths /usr/lib/x86_64-linux-gnu/dri:\$${ORIGIN}/dri:/usr/lib/dri, suffix _dri)
libGL error: failed to load driver: iris
libGL error: MESA-LOADER: failed to open iris: /home/rainer/anaconda3/envs/tf_2_9/bin/../lib/libstdc++.so.6: version `GLIBCXX_3.4.30' not found (required by /lib/x86_64-linux-gnu/libLLVM-15.so.1) (search paths /usr/lib/x86_64-linux-gnu/dri:\$${ORIGIN}/dri:/usr/lib/dri, suffix _dri)
libGL error: failed to load driver: iris
libGL error: MESA-LOADER: failed to open swrast: /usr/lib/dri/swrast_dri.so: cannot open shared object file: No such file or directory (search paths /usr/lib/x86_64-linux-gnu/dri:\$${ORIGIN}/dri:/usr/lib/dri, suffix _dri)
libGL error: failed to load driver: swrast
X Error of failed request:  BadValue (integer parameter out of range for operation)
  Major opcode of failed request:  152 (GLX)
  Minor opcode of failed request:  3 (X_GLXCreateContext)
  Value in failed request:  0x0
  Serial number of failed request:  96
  Current serial number in output stream:  97
```

## convert old tub file sto v2
```
python /media/rainer/_data/30-projects/42-DIYrobocars/donkeycar/scripts/convert_to_tub_v2.py --tub=./data/tub_128_19-11-16 --output=tub_128_19-11-16-new

129
130
130

```