# Try01: OpenCV
*using donkeycar/install/envs/jetson.yml*

problem:
```
conda list | grep opencv
opencv                    4.6.0            py38h5f62720_5  
opencv-python-headless    4.8.0.76                 pypi_0    pypi
```
fix:
```
conda uninstall opencv
pip uninstall opencv-python-headless
pip install opencv-python
```

OpenCV:
```
Collecting opencv-python
  Obtaining dependency information for opencv-python from https://files.pythonhosted.org/packages/1c/1f/e2fecc126554b84ddea6a159564f3ee21ae9ce52148d72e0d66d655a511c/opencv_python-4.8.0.76-cp37-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl.metadata
  Downloading opencv_python-4.8.0.76-cp37-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl.metadata (19 kB)
Requirement already satisfied: numpy>=1.19.3 in ./miniconda3/envs/donkey/lib/python3.8/site-packages (from opencv-python) (1.24.3)
Downloading opencv_python-4.8.0.76-cp37-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl (41.0 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 41.0/41.0 MB 4.0 MB/s eta 0:00:00
Installing collected packages: opencv-python
Successfully installed opencv-python-4.8.0.76
```

test results:
```
(donkey) rainer@ubuntu:~$ python
Python 3.8.17 (default, Jul  5 2023, 20:40:03) 
[GCC 11.2.0] :: Anaconda, Inc. on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import tensorflow as tf
>>> tf.__version__
'2.9.1'
>>> from tensorflow.python.compiler.tensorrt import trt_convert as trt
>>> trt._check_trt_version_compatibility()
INFO:tensorflow:Linked TensorRT version: (8, 4, 1)
INFO:tensorflow:Loaded TensorRT version: (8, 5, 2)
INFO:tensorflow:Loaded TensorRT 8.5.2 and linked TensorFlow against TensorRT 8.4.1. This is supported because TensorRT minor/patch upgrades are backward compatible.
>>> 


>>> import cv2
>>> print(cv2.getBuildInformation())

General configuration for OpenCV 4.8.0 =====================================
  Version control:               4.8.0-dirty

  Platform:
    Timestamp:                   2023-08-09T11:21:07Z
    Host:                        Linux 5.3.0-28-generic aarch64
    CMake:                       3.27.1
    CMake generator:             Unix Makefiles
    CMake build tool:            /bin/gmake
    Configuration:               Release

  CPU/HW features:
    Baseline:                    NEON FP16

  C/C++:
    Built as dynamic libs?:      NO
    C++ standard:                11
    C++ Compiler:                /opt/rh/devtoolset-10/root/usr/bin/c++  (ver 10.2.1)
    C++ flags (Release):         -Wl,-strip-all   -fsigned-char -W -Wall -Wreturn-type -Wnon-virtual-dtor -Waddress -Wsequence-point -Wformat -Wformat-security -Wmissing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-promo -Wuninitialized -Wsuggest-override -Wno-delete-non-virtual-dtor -Wno-comment -Wimplicit-fallthrough=3 -Wno-strict-overflow -fdiagnostics-show-option -pthread -fomit-frame-pointer -ffunction-sections -fdata-sections    -fvisibility=hidden -fvisibility-inlines-hidden -O3 -DNDEBUG  -DNDEBUG
    C++ flags (Debug):           -Wl,-strip-all   -fsigned-char -W -Wall -Wreturn-type -Wnon-virtual-dtor -Waddress -Wsequence-point -Wformat -Wformat-security -Wmissing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-promo -Wuninitialized -Wsuggest-override -Wno-delete-non-virtual-dtor -Wno-comment -Wimplicit-fallthrough=3 -Wno-strict-overflow -fdiagnostics-show-option -pthread -fomit-frame-pointer -ffunction-sections -fdata-sections    -fvisibility=hidden -fvisibility-inlines-hidden -g  -O0 -DDEBUG -D_DEBUG
    C Compiler:                  /opt/rh/devtoolset-10/root/usr/bin/cc
    C flags (Release):           -Wl,-strip-all   -fsigned-char -W -Wall -Wreturn-type -Waddress -Wsequence-point -Wformat -Wformat-security -Wmissing-declarations -Wmissing-prototypes -Wstrict-prototypes -Wundef -Winit-self -Wpointer-arith -Wshadow -Wuninitialized -Wno-comment -Wimplicit-fallthrough=3 -Wno-strict-overflow -fdiagnostics-show-option -pthread -fomit-frame-pointer -ffunction-sections -fdata-sections    -fvisibility=hidden -O3 -DNDEBUG  -DNDEBUG
    C flags (Debug):             -Wl,-strip-all   -fsigned-char -W -Wall -Wreturn-type -Waddress -Wsequence-point -Wformat -Wformat-security -Wmissing-declarations -Wmissing-prototypes -Wstrict-prototypes -Wundef -Winit-self -Wpointer-arith -Wshadow -Wuninitialized -Wno-comment -Wimplicit-fallthrough=3 -Wno-strict-overflow -fdiagnostics-show-option -pthread -fomit-frame-pointer -ffunction-sections -fdata-sections    -fvisibility=hidden -g  -O0 -DDEBUG -D_DEBUG
    Linker flags (Release):      -L/ffmpeg_build/lib  -Wl,--gc-sections -Wl,--as-needed -Wl,--no-undefined  
    Linker flags (Debug):        -L/ffmpeg_build/lib  -Wl,--gc-sections -Wl,--as-needed -Wl,--no-undefined  
    ccache:                      YES
    Precompiled headers:         NO
    Extra dependencies:          /lib64/libopenblas.so Qt5::Core Qt5::Gui Qt5::Widgets Qt5::Test Qt5::Concurrent /usr/local/lib/libpng.so /lib64/libz.so dl m pthread rt
    3rdparty dependencies:       libprotobuf ade ittnotify libjpeg-turbo libwebp libtiff libopenjp2 IlmImf quirc tegra_hal

  OpenCV modules:
    To be built:                 calib3d core dnn features2d flann gapi highgui imgcodecs imgproc ml objdetect photo python3 stitching video videoio
    Disabled:                    world
    Disabled by dependency:      -
    Unavailable:                 java python2 ts
    Applications:                -
    Documentation:               NO
    Non-free algorithms:         NO

  GUI:                           QT5
    QT:                          YES (ver 5.15.0 )
      QT OpenGL support:         NO
    GTK+:                        NO
    VTK support:                 NO

  Media I/O: 
    ZLib:                        /lib64/libz.so (ver 1.2.7)
    JPEG:                        libjpeg-turbo (ver 2.1.3-62)
    WEBP:                        build (ver encoder: 0x020f)
    PNG:                         /usr/local/lib/libpng.so (ver 1.6.40)
    TIFF:                        build (ver 42 - 4.2.0)
    JPEG 2000:                   build (ver 2.5.0)
    OpenEXR:                     build (ver 2.3.0)
    HDR:                         YES
    SUNRASTER:                   YES
    PXM:                         YES
    PFM:                         YES

  Video I/O:
    DC1394:                      NO
    FFMPEG:                      YES
      avcodec:                   YES (59.37.100)
      avformat:                  YES (59.27.100)
      avutil:                    YES (57.28.100)
      swscale:                   YES (6.7.100)
      avresample:                NO
    GStreamer:                   NO
    v4l/v4l2:                    YES (linux/videodev2.h)

  Parallel framework:            pthreads

  Trace:                         YES (with Intel ITT)

  Other third-party libraries:
    Lapack:                      YES (/lib64/libopenblas.so)
    Eigen:                       NO
    Custom HAL:                  YES (carotene (ver 0.0.1))
    Protobuf:                    build (3.19.1)
    Flatbuffers:                 builtin/3rdparty (23.5.9)

  OpenCL:                        YES (no extra features)
    Include path:                /io/opencv/3rdparty/include/opencl/1.2
    Link libraries:              Dynamic load

  Python 3:
    Interpreter:                 /opt/python/cp37-cp37m/bin/python3.7 (ver 3.7.17)
    Libraries:                   libpython3.7m.a (ver 3.7.17)
    numpy:                       /home/ci/.local/lib/python3.7/site-packages/numpy/core/include (ver 1.19.3)
    install path:                python/cv2/python-3

  Python (for build):            /opt/python/cp37-cp37m/bin/python3.7

  Java:                          
    ant:                         NO
    Java:                        NO
    JNI:                         NO
    Java wrappers:               NO
    Java tests:                  NO

  Install to:                    /io/_skbuild/linux-aarch64-3.7/cmake-install
-----------------------------------------------------------------
```


