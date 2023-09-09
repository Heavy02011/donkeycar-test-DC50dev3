# Try03: OpenCV 2nd try on fresh install
*using venv*

# install:

## 1 preparation
```
conda deactivate
pip3 install virtualenv
python3 -m virtualenv -p python3 env --system-site-packages
echo "source env/bin/activate" >> ~/.bashrc
source ~/.bashrc
```

## the following section has been omitted
```
pip3 install -U pip testresources setuptools
pip3 install -U futures==3.1.1 protobuf==3.12.2 pybind11==2.5.0
pip3 install -U cython==0.29.21 pyserial
pip3 install -U future==0.18.2 mock==4.0.2 h5py==2.10.0 keras_preprocessing==1.1.2 keras_applications==1.0.8 gast==0.3.3
pip3 install -U absl-py==0.9.0 py-cpuinfo==7.0.0 psutil==5.7.2 portpicker==1.3.1 six requests==2.24.0 astor==0.8.1 termcolor==1.1.0 wrapt==1.12.1 google-pasta==0.2.0
pip3 install -U gdown
```

## 2 tensorflow
https://docs.nvidia.com/deeplearning/frameworks/install-tf-jetson-platform/index.html
```
pip3 install -U numpy grpcio absl-py py-cpuinfo psutil portpicker six mock requests gast h5py astor termcolor protobuf keras-applications keras-preprocessing wrapt google-pasta setuptools testresources
pip3 install --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v512 tensorflow==2.12.0+nv23.06
```

## 3 donkey

```
git clone https://github.com/autorope/donkeycar
cd donkeycar
git checkout main
pip3 install -e .[nano]
pip install -U albumentations --no-binary qudida,albumentations

export LD_PRELOAD=/usr/lib/aarch64-linux-gnu/libnvinfer.so.8:/usr/lib/aarch64-linux-gnu/libgomp.so.1
```

## fixes for missing install from conda
```
pip uninstall opencv-python-headless
pip install kivy pillow pylint pytest pytest-cov codecov moviepy PrettyTable mypy pyyaml fastai

```

# results:
```
(env) rainer@ubuntu:~$ python3
Python 3.8.10 (default, May 26 2023, 14:05:08) 
[GCC 9.4.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import cv2
>>> print(cv2.getBuildInformation())

General configuration for OpenCV 4.5.4 =====================================
  Version control:               4.5.4-8-g3e4c170df4

  Platform:
    Timestamp:                   2022-01-18T10:01:01Z
    Host:                        Linux 5.10.65-tegra aarch64
    CMake:                       3.16.3
    CMake generator:             Unix Makefiles
    CMake build tool:            /usr/bin/make
    Configuration:               Release

  CPU/HW features:
    Baseline:                    NEON FP16

  C/C++:
    Built as dynamic libs?:      YES
    C++ standard:                11
    C++ Compiler:                /usr/bin/c++  (ver 9.3.0)
    C++ flags (Release):         -fsigned-char -W -Wall -Werror=return-type -Werror=non-virtual-dtor -Werror=address -Werror=sequence-point -Wformat -Werror=format-security -Wmissing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-promo -Wuninitialized -Wsuggest-override -Wno-delete-non-virtual-dtor -Wno-comment -Wimplicit-fallthrough=3 -Wno-strict-overflow -fdiagnostics-show-option -pthread -fomit-frame-pointer -ffunction-sections -fdata-sections    -fvisibility=hidden -fvisibility-inlines-hidden -O3 -DNDEBUG  -DNDEBUG
    C++ flags (Debug):           -fsigned-char -W -Wall -Werror=return-type -Werror=non-virtual-dtor -Werror=address -Werror=sequence-point -Wformat -Werror=format-security -Wmissing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-promo -Wuninitialized -Wsuggest-override -Wno-delete-non-virtual-dtor -Wno-comment -Wimplicit-fallthrough=3 -Wno-strict-overflow -fdiagnostics-show-option -pthread -fomit-frame-pointer -ffunction-sections -fdata-sections    -fvisibility=hidden -fvisibility-inlines-hidden -g  -O0 -DDEBUG -D_DEBUG
    C Compiler:                  /usr/bin/cc
    C flags (Release):           -fsigned-char -W -Wall -Werror=return-type -Werror=address -Werror=sequence-point -Wformat -Werror=format-security -Wmissing-declarations -Wmissing-prototypes -Wstrict-prototypes -Wundef -Winit-self -Wpointer-arith -Wshadow -Wuninitialized -Wno-comment -Wimplicit-fallthrough=3 -Wno-strict-overflow -fdiagnostics-show-option -pthread -fomit-frame-pointer -ffunction-sections -fdata-sections    -fvisibility=hidden -O3 -DNDEBUG  -DNDEBUG
    C flags (Debug):             -fsigned-char -W -Wall -Werror=return-type -Werror=address -Werror=sequence-point -Wformat -Werror=format-security -Wmissing-declarations -Wmissing-prototypes -Wstrict-prototypes -Wundef -Winit-self -Wpointer-arith -Wshadow -Wuninitialized -Wno-comment -Wimplicit-fallthrough=3 -Wno-strict-overflow -fdiagnostics-show-option -pthread -fomit-frame-pointer -ffunction-sections -fdata-sections    -fvisibility=hidden -g  -O0 -DDEBUG -D_DEBUG
    Linker flags (Release):      -Wl,--gc-sections -Wl,--as-needed  
    Linker flags (Debug):        -Wl,--gc-sections -Wl,--as-needed  
    ccache:                      NO
    Precompiled headers:         NO
    Extra dependencies:          dl m pthread rt
    3rdparty dependencies:

  OpenCV modules:
    To be built:                 calib3d core dnn features2d flann gapi highgui imgcodecs imgproc ml objdetect photo python2 python3 stitching ts video videoio
    Disabled:                    world
    Disabled by dependency:      -
    Unavailable:                 java
    Applications:                tests perf_tests examples apps
    Documentation:               NO
    Non-free algorithms:         NO

  GUI:                           GTK2
    GTK+:                        YES (ver 2.24.32)
      GThread :                  YES (ver 2.64.6)
      GtkGlExt:                  NO

  Media I/O: 
    ZLib:                        /usr/lib/aarch64-linux-gnu/libz.so (ver 1.2.11)
    JPEG:                        /usr/lib/aarch64-linux-gnu/libjpeg.so (ver 80)
    WEBP:                        build (ver encoder: 0x020f)
    PNG:                         /usr/lib/aarch64-linux-gnu/libpng.so (ver 1.6.37)
    TIFF:                        /usr/lib/aarch64-linux-gnu/libtiff.so (ver 42 / 4.1.0)
    JPEG 2000:                   build (ver 2.4.0)
    HDR:                         YES
    SUNRASTER:                   YES
    PXM:                         YES
    PFM:                         YES

  Video I/O:
    FFMPEG:                      YES
      avcodec:                   YES (58.54.100)
      avformat:                  YES (58.29.100)
      avutil:                    YES (56.31.100)
      swscale:                   YES (5.5.100)
      avresample:                YES (4.0.0)
    GStreamer:                   YES (1.16.2)
    v4l/v4l2:                    YES (linux/videodev2.h)

  Parallel framework:            TBB (ver 2020.1 interface 11101)

  Trace:                         YES (with Intel ITT)

  Other third-party libraries:
    Lapack:                      NO
    Eigen:                       YES (ver 3.3.7)
    Custom HAL:                  YES (carotene (ver 0.0.1))
    Protobuf:                    build (3.5.1)

  Python 2:
    Interpreter:                 /usr/bin/python2.7 (ver 2.7.18)
    Libraries:                   /usr/lib/aarch64-linux-gnu/libpython2.7.so (ver 2.7.18)
    numpy:                       /usr/lib/python2.7/dist-packages/numpy/core/include (ver 1.16.5)
    install path:                lib/python2.7/dist-packages/cv2/python-2.7

  Python 3:
    Interpreter:                 /usr/bin/python3 (ver 3.8.10)
    Libraries:                   /usr/lib/aarch64-linux-gnu/libpython3.8.so (ver 3.8.10)
    numpy:                       /usr/lib/python3/dist-packages/numpy/core/include (ver 1.17.4)
    install path:                lib/python3.8/dist-packages/cv2/python-3.8

  Python (for build):            /usr/bin/python2.7

  Java:                          
    ant:                         NO
    JNI:                         NO
    Java wrappers:               NO
    Java tests:                  NO

  Install to:                    /usr
-----------------------------------------------------------------


>>> import tensorflow as tf
>>> tf.__version__
'2.12.0'
>>> from tensorflow.python.compiler.tensorrt import trt_convert as trt
>>> trt._check_trt_version_compatibility()
INFO:tensorflow:Linked TensorRT version: (8, 5, 2)
INFO:tensorflow:Loaded TensorRT version: (8, 5, 2)
>>> 
```

# donkey ui CRASHES
```
...

DEBUG:matplotlib:CACHEDIR=/home/rainer/.cache/matplotlib
[DEBUG  ] CACHEDIR=/home/rainer/.cache/matplotlib
DEBUG:matplotlib.font_manager:Using fontManager instance from /home/rainer/.cache/matplotlib/fontlist-v310.json
[DEBUG  ] Using fontManager instance from /home/rainer/.cache/matplotlib/fontlist-v310.json
INFO:kivy:Factory: 190 symbols loaded
[INFO   ] [Factory     ] 190 symbols loaded
INFO:kivy:Image: Providers: img_tex, img_dds, img_sdl2, img_pil (img_ffpyplayer ignored)
[INFO   ] [Image       ] Providers: img_tex, img_dds, img_sdl2, img_pil (img_ffpyplayer ignored)
INFO:kivy:Text: Provider: sdl2
[INFO   ] [Text        ] Provider: sdl2
INFO:kivy:Window: Provider: sdl2
[INFO   ] [Window      ] Provider: sdl2
INFO:kivy:GL: Using the "OpenGL" graphics system
[INFO   ] [GL          ] Using the "OpenGL" graphics system
INFO:kivy:GL: Backend used <sdl2>
[INFO   ] [GL          ] Backend used <sdl2>
INFO:kivy:GL: OpenGL version <b'4.6.0 NVIDIA 35.4.1'>
[INFO   ] [GL          ] OpenGL version <b'4.6.0 NVIDIA 35.4.1'>
INFO:kivy:GL: OpenGL vendor <b'NVIDIA Corporation'>
[INFO   ] [GL          ] OpenGL vendor <b'NVIDIA Corporation'>
INFO:kivy:GL: OpenGL renderer <b'NVIDIA Tegra Orin (nvgpu)/integrated'>
[INFO   ] [GL          ] OpenGL renderer <b'NVIDIA Tegra Orin (nvgpu)/integrated'>
INFO:kivy:GL: OpenGL parsed version: 4, 6
[INFO   ] [GL          ] OpenGL parsed version: 4, 6
INFO:kivy:GL: Shading version <b'4.60 NVIDIA'>
[INFO   ] [GL          ] Shading version <b'4.60 NVIDIA'>
INFO:kivy:GL: Texture max size <32768>
[INFO   ] [GL          ] Texture max size <32768>
INFO:kivy:GL: Texture max units <32>
[INFO   ] [GL          ] Texture max units <32>
INFO:kivy:Window: auto add sdl2 input provider
[INFO   ] [Window      ] auto add sdl2 input provider
INFO:kivy:Window: virtual keyboard not allowed, single mode, not docked
[INFO   ] [Window      ] virtual keyboard not allowed, single mode, not docked
WARNING:kivy:stderr: Traceback (most recent call last):
 Traceback (most recent call last):
WARNING:kivy:stderr:   File "/home/rainer/env/lib/python3.8/site-packages/sklearn/__check_build/__init__.py", line 45, in <module>
   File "/home/rainer/env/lib/python3.8/site-packages/sklearn/__check_build/__init__.py", line 45, in <module>
WARNING:kivy:stderr:     from ._check_build import check_build  # noqa
     from ._check_build import check_build  # noqa
WARNING:kivy:stderr: ImportError: /home/rainer/env/lib/python3.8/site-packages/sklearn/__check_build/../../scikit_learn.libs/libgomp-d22c30c5.so.1.0.0: cannot allocate memory in static TLS block
 ImportError: /home/rainer/env/lib/python3.8/site-packages/sklearn/__check_build/../../scikit_learn.libs/libgomp-d22c30c5.so.1.0.0: cannot allocate memory in static TLS block
WARNING:kivy:stderr: 
 
WARNING:kivy:stderr: During handling of the above exception, another exception occurred:
 During handling of the above exception, another exception occurred:
WARNING:kivy:stderr: 
 
WARNING:kivy:stderr: Traceback (most recent call last):
 Traceback (most recent call last):
WARNING:kivy:stderr:   File "/home/rainer/env/bin/donkey", line 33, in <module>
   File "/home/rainer/env/bin/donkey", line 33, in <module>
WARNING:kivy:stderr:     sys.exit(load_entry_point('donkeycar', 'console_scripts', 'donkey')())
     sys.exit(load_entry_point('donkeycar', 'console_scripts', 'donkey')())
WARNING:kivy:stderr:   File "/home/rainer/projects/donkeycar/donkeycar/management/base.py", line 626, in execute_from_command_line
   File "/home/rainer/projects/donkeycar/donkeycar/management/base.py", line 626, in execute_from_command_line
WARNING:kivy:stderr:     c.run(args[2:])
     c.run(args[2:])
WARNING:kivy:stderr:   File "/home/rainer/projects/donkeycar/donkeycar/management/base.py", line 597, in run
   File "/home/rainer/projects/donkeycar/donkeycar/management/base.py", line 597, in run
WARNING:kivy:stderr:     from donkeycar.management.kivy_ui import main
     from donkeycar.management.kivy_ui import main
WARNING:kivy:stderr:   File "/home/rainer/projects/donkeycar/donkeycar/management/kivy_ui.py", line 39, in <module>
   File "/home/rainer/projects/donkeycar/donkeycar/management/kivy_ui.py", line 39, in <module>
WARNING:kivy:stderr:     from donkeycar.pipeline.augmentations import ImageAugmentation
     from donkeycar.pipeline.augmentations import ImageAugmentation
WARNING:kivy:stderr:   File "/home/rainer/projects/donkeycar/donkeycar/pipeline/augmentations.py", line 1, in <module>
   File "/home/rainer/projects/donkeycar/donkeycar/pipeline/augmentations.py", line 1, in <module>
WARNING:kivy:stderr:     import albumentations.core.transforms_interface
     import albumentations.core.transforms_interface
WARNING:kivy:stderr:   File "/home/rainer/env/lib/python3.8/site-packages/albumentations/__init__.py", line 5, in <module>
   File "/home/rainer/env/lib/python3.8/site-packages/albumentations/__init__.py", line 5, in <module>
WARNING:kivy:stderr:     from .augmentations import *
     from .augmentations import *
WARNING:kivy:stderr:   File "/home/rainer/env/lib/python3.8/site-packages/albumentations/augmentations/__init__.py", line 8, in <module>
   File "/home/rainer/env/lib/python3.8/site-packages/albumentations/augmentations/__init__.py", line 8, in <module>
WARNING:kivy:stderr:     from .domain_adaptation import *
     from .domain_adaptation import *
WARNING:kivy:stderr:   File "/home/rainer/env/lib/python3.8/site-packages/albumentations/augmentations/domain_adaptation.py", line 6, in <module>
   File "/home/rainer/env/lib/python3.8/site-packages/albumentations/augmentations/domain_adaptation.py", line 6, in <module>
WARNING:kivy:stderr:     from qudida import DomainAdapter
     from qudida import DomainAdapter
WARNING:kivy:stderr:   File "/home/rainer/env/lib/python3.8/site-packages/qudida/__init__.py", line 6, in <module>
   File "/home/rainer/env/lib/python3.8/site-packages/qudida/__init__.py", line 6, in <module>
WARNING:kivy:stderr:     from sklearn.decomposition import PCA
     from sklearn.decomposition import PCA
WARNING:kivy:stderr:   File "/home/rainer/env/lib/python3.8/site-packages/sklearn/__init__.py", line 79, in <module>
   File "/home/rainer/env/lib/python3.8/site-packages/sklearn/__init__.py", line 79, in <module>
WARNING:kivy:stderr:     from . import (
     from . import (
WARNING:kivy:stderr:   File "/home/rainer/env/lib/python3.8/site-packages/sklearn/__check_build/__init__.py", line 47, in <module>
   File "/home/rainer/env/lib/python3.8/site-packages/sklearn/__check_build/__init__.py", line 47, in <module>
WARNING:kivy:stderr:     raise_build_error(e)
     raise_build_error(e)
WARNING:kivy:stderr:   File "/home/rainer/env/lib/python3.8/site-packages/sklearn/__check_build/__init__.py", line 31, in raise_build_error
   File "/home/rainer/env/lib/python3.8/site-packages/sklearn/__check_build/__init__.py", line 31, in raise_build_error
WARNING:kivy:stderr:     raise ImportError("""%s
     raise ImportError("""%s
WARNING:kivy:stderr: ImportError: /home/rainer/env/lib/python3.8/site-packages/sklearn/__check_build/../../scikit_learn.libs/libgomp-d22c30c5.so.1.0.0: cannot allocate memory in static TLS block
 ImportError: /home/rainer/env/lib/python3.8/site-packages/sklearn/__check_build/../../scikit_learn.libs/libgomp-d22c30c5.so.1.0.0: cannot allocate memory in static TLS block
WARNING:kivy:stderr: ___________________________________________________________________________
 ___________________________________________________________________________
WARNING:kivy:stderr: Contents of /home/rainer/env/lib/python3.8/site-packages/sklearn/__check_build:
 Contents of /home/rainer/env/lib/python3.8/site-packages/sklearn/__check_build:
WARNING:kivy:stderr: _check_build.cpython-38-aarch64-linux-gnu.so__init__.py               __pycache__
 _check_build.cpython-38-aarch64-linux-gnu.so__init__.py               __pycache__
WARNING:kivy:stderr: ___________________________________________________________________________
 ___________________________________________________________________________
WARNING:kivy:stderr: It seems that scikit-learn has not been built correctly.
 It seems that scikit-learn has not been built correctly.
WARNING:kivy:stderr: 
 
WARNING:kivy:stderr: If you have installed scikit-learn from source, please do not forget
 If you have installed scikit-learn from source, please do not forget
WARNING:kivy:stderr: to build the package before using it: run `python setup.py install` or
 to build the package before using it: run `python setup.py install` or
WARNING:kivy:stderr: `make` in the source directory.
 `make` in the source directory.
WARNING:kivy:stderr: 
 
WARNING:kivy:stderr: If you have used an installer, please check that it is suited for your
 If you have used an installer, please check that it is suited for your
WARNING:kivy:stderr: Python version, your operating system and your platform.
 Python version, your operating system and your platform.
```

```
(env) rainer@ubuntu:~/projects/donkeycar$ pip list|grep scikit
scikit-image                     0.21.0
scikit-learn                     1.3.0
```

## compiling scikit-learn
```
pip uninstall scikit-learn
git clone https://github.com/scikit-learn/scikit-learn.git
cd scikit-learn/
python setup.py install
```
```
Installed /home/rainer/env/lib/python3.8/site-packages/scikit_learn-1.4.dev0-py3.8-linux-aarch64.egg
Processing dependencies for scikit-learn==1.4.dev0
Searching for threadpoolctl==3.2.0
Best match: threadpoolctl 3.2.0
Adding threadpoolctl 3.2.0 to easy-install.pth file
detected new path './scikit_learn-1.4.dev0-py3.8-linux-aarch64.egg'

Using /home/rainer/env/lib/python3.8/site-packages
Searching for joblib==1.3.2
Best match: joblib 1.3.2
Adding joblib 1.3.2 to easy-install.pth file

Using /home/rainer/env/lib/python3.8/site-packages
Searching for scipy==1.10.1
Best match: scipy 1.10.1
Adding scipy 1.10.1 to easy-install.pth file

Using /usr/local/lib/python3.8/dist-packages
Searching for numpy==1.23.5
Best match: numpy 1.23.5
Adding numpy 1.23.5 to easy-install.pth file
Installing f2py script to /home/rainer/env/bin
Installing f2py3 script to /home/rainer/env/bin
Installing f2py3.8 script to /home/rainer/env/bin

Using /home/rainer/env/lib/python3.8/site-packages
Finished processing dependencies for scikit-learn==1.4.dev0
```


## Attention Dependency conflict qudida // opencv-python-headless>=4.0.1
```
Installing collected packages: scikit-learn
ERROR: pip's dependency resolver does not currently take into account all the packages that are installed. This behaviour is the source of the following dependency conflicts.
qudida 0.0.4 requires opencv-python-headless>=4.0.1, which is not installed.
Successfully installed scikit-learn-1.3.0
(env) rainer@ubuntu:~/mycar$ python train.py --
```
## fix donkey ui crash
```
pip install kivy==2.1.0
```

# additional links
https://www.hackster.io/wallarug/donkey-car-with-jetson-nano-robo-hat-mm1-e53e21
