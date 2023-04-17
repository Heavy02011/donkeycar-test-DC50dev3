# OpenCV
```
(donkey) rainer@donkeynano10:~/opencv/build$ python
Python 3.9.16 | packaged by conda-forge | (main, Feb  1 2023, 22:05:40) 
[GCC 11.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import cv2
>>> print(cv2.getBuildInformation()) 

General configuration for OpenCV 4.6.0 =====================================
  Version control:               unknown

  Extra modules:
    Location (extra):            /home/rainer/opencv_contrib/modules
    Version control (extra):     unknown

  Platform:
    Timestamp:                   2023-04-16T12:33:33Z
    Host:                        Linux 4.9.299-tegra aarch64
    CMake:                       3.10.2
    CMake generator:             Unix Makefiles
    CMake build tool:            /usr/bin/make
    Configuration:               RELEASE

  CPU/HW features:
    Baseline:                    NEON FP16
      required:                  NEON

  C/C++:
    Built as dynamic libs?:      YES
    C++ standard:                11
    C++ Compiler:                /usr/bin/c++  (ver 7.5.0)
    C++ flags (Release):         -fsigned-char -ffast-math -W -Wall -Wreturn-type -Wnon-virtual-dtor -Waddress -Wsequence-point -Wformat -Wformat-security -Wmissing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-promo -Wuninitialized -Wsuggest-override -Wno-delete-non-virtual-dtor -Wno-comment -Wimplicit-fallthrough=3 -Wno-strict-overflow -fdiagnostics-show-option -pthread -fomit-frame-pointer -ffunction-sections -fdata-sections    -fvisibility=hidden -fvisibility-inlines-hidden -fopenmp -O3 -DNDEBUG  -DNDEBUG
    C++ flags (Debug):           -fsigned-char -ffast-math -W -Wall -Wreturn-type -Wnon-virtual-dtor -Waddress -Wsequence-point -Wformat -Wformat-security -Wmissing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-promo -Wuninitialized -Wsuggest-override -Wno-delete-non-virtual-dtor -Wno-comment -Wimplicit-fallthrough=3 -Wno-strict-overflow -fdiagnostics-show-option -pthread -fomit-frame-pointer -ffunction-sections -fdata-sections    -fvisibility=hidden -fvisibility-inlines-hidden -fopenmp -g  -O0 -DDEBUG -D_DEBUG
    C Compiler:                  /usr/bin/cc
    C flags (Release):           -fsigned-char -ffast-math -W -Wall -Wreturn-type -Waddress -Wsequence-point -Wformat -Wformat-security -Wmissing-declarations -Wmissing-prototypes -Wstrict-prototypes -Wundef -Winit-self -Wpointer-arith -Wshadow -Wuninitialized -Wno-comment -Wimplicit-fallthrough=3 -Wno-strict-overflow -fdiagnostics-show-option -pthread -fomit-frame-pointer -ffunction-sections -fdata-sections    -fvisibility=hidden -fopenmp -O3 -DNDEBUG  -DNDEBUG
    C flags (Debug):             -fsigned-char -ffast-math -W -Wall -Wreturn-type -Waddress -Wsequence-point -Wformat -Wformat-security -Wmissing-declarations -Wmissing-prototypes -Wstrict-prototypes -Wundef -Winit-self -Wpointer-arith -Wshadow -Wuninitialized -Wno-comment -Wimplicit-fallthrough=3 -Wno-strict-overflow -fdiagnostics-show-option -pthread -fomit-frame-pointer -ffunction-sections -fdata-sections    -fvisibility=hidden -fopenmp -g  -O0 -DDEBUG -D_DEBUG
    Linker flags (Release):      -Wl,--gc-sections -Wl,--as-needed -Wl,--no-undefined  
    Linker flags (Debug):        -Wl,--gc-sections -Wl,--as-needed -Wl,--no-undefined  
    ccache:                      NO
    Precompiled headers:         NO
    Extra dependencies:          m pthread cudart_static dl rt nppc nppial nppicc nppicom nppidei nppif nppig nppim nppist nppisu nppitc npps cublas cudnn cufft -L/usr/local/cuda/lib64 -L/usr/lib/aarch64-linux-gnu
    3rdparty dependencies:

  OpenCV modules:
    To be built:                 alphamat aruco barcode bgsegm bioinspired calib3d ccalib core cudaarithm cudabgsegm cudacodec cudafeatures2d cudafilters cudaimgproc cudalegacy cudaobjdetect cudaoptflow cudastereo cudawarping cudev datasets dnn dnn_objdetect dnn_superres dpm face features2d flann freetype fuzzy gapi hdf hfs highgui img_hash imgcodecs imgproc intensity_transform line_descriptor mcc ml objdetect optflow phase_unwrapping photo plot python3 quality rapid reg rgbd saliency sfm shape stereo stitching structured_light superres surface_matching text tracking ts video videoio videostab wechat_qrcode xfeatures2d ximgproc xobjdetect xphoto
    Disabled:                    python2 world
    Disabled by dependency:      -
    Unavailable:                 cvv java julia matlab ovis viz
    Applications:                perf_tests apps
    Documentation:               NO
    Non-free algorithms:         YES

  GUI:                           GTK3
    GTK+:                        YES (ver 3.22.30)
      GThread :                  YES (ver 2.56.4)
      GtkGlExt:                  NO
    VTK support:                 NO

  Media I/O: 
    ZLib:                        /usr/lib/aarch64-linux-gnu/libz.so (ver 1.2.11)
    JPEG:                        /usr/lib/aarch64-linux-gnu/libjpeg.so (ver 80)
    WEBP:                        /home/rainer/mambaforge/envs/donkey/lib/libwebp.so (ver encoder: 0x020f)
    PNG:                         /usr/lib/aarch64-linux-gnu/libpng.so (ver 1.6.34)
    TIFF:                        build (ver 42 - 4.2.0)
    JPEG 2000:                   build (ver 2.4.0)
    OpenEXR:                     build (ver 2.3.0)
    HDR:                         YES
    SUNRASTER:                   YES
    PXM:                         YES
    PFM:                         YES

  Video I/O:
    DC1394:                      YES (2.2.5)
    FFMPEG:                      YES
      avcodec:                   YES (57.107.100)
      avformat:                  YES (57.83.100)
      avutil:                    YES (55.78.100)
      swscale:                   YES (4.8.100)
      avresample:                YES (3.7.0)
    GStreamer:                   YES (1.14.5)
    v4l/v4l2:                    YES (linux/videodev2.h)

  Parallel framework:            TBB (ver 2020.2 interface 11102)

  Trace:                         YES (with Intel ITT)

  Other third-party libraries:
    Lapack:                      YES (/usr/lib/aarch64-linux-gnu/liblapack.so /usr/lib/aarch64-linux-gnu/libcblas.so /usr/lib/aarch64-linux-gnu/libatlas.so)
    Eigen:                       YES (ver 3.3.4)
    Custom HAL:                  YES (carotene (ver 0.0.1))
    Protobuf:                    build (3.19.1)

  NVIDIA CUDA:                   YES (ver 10.2, CUFFT CUBLAS FAST_MATH)
    NVIDIA GPU arch:             53
    NVIDIA PTX archs:

  cuDNN:                         YES (ver 8.2.1)

  Python 3:
    Interpreter:                 /home/rainer/mambaforge/envs/donkey/bin/python3 (ver 3.9.16)
    Libraries:                   /home/rainer/mambaforge/envs/donkey/lib/libpython3.9.so (ver 3.9.16)
    numpy:                       /home/rainer/mambaforge/envs/donkey/lib/python3.9/site-packages/numpy/core/include (ver 1.23.5)
    install path:                /home/rainer/mambaforge/envs/donkey/lib/python3.9/site-packages/cv2/python-3.9

  Python (for build):            /usr/bin/python2.7

  Java:                          
    ant:                         NO
    JNI:                         NO
    Java wrappers:               NO
    Java tests:                  NO

  Install to:                    /home/rainer/mambaforge/envs/donkey
-----------------------------------------------------------------


>>> quit()
```

# camera
```
(donkey) rainer@donkeynano10:~/dev/CSI-Camera$ python simple_camera.py 
nvarguscamerasrc sensor-id=0 !video/x-raw(memory:NVMM), width=(int)1920, height=(int)1080, framerate=(fraction)30/1 ! nvvidconv flip-method=0 ! video/x-raw, width=(int)960, height=(int)540, format=(string)BGRx ! videoconvert ! video/x-raw, format=(string)BGR ! appsink
GST_ARGUS: Creating output stream
CONSUMER: Waiting until producer is connected...
GST_ARGUS: Available Sensor modes :
GST_ARGUS: 3264 x 2464 FR = 21.000000 fps Duration = 47619048 ; Analog Gain range min 1.000000, max 10.625000; Exposure Range min 13000, max 683709000;

GST_ARGUS: 3264 x 1848 FR = 28.000001 fps Duration = 35714284 ; Analog Gain range min 1.000000, max 10.625000; Exposure Range min 13000, max 683709000;

GST_ARGUS: 1920 x 1080 FR = 29.999999 fps Duration = 33333334 ; Analog Gain range min 1.000000, max 10.625000; Exposure Range min 13000, max 683709000;

GST_ARGUS: 1640 x 1232 FR = 29.999999 fps Duration = 33333334 ; Analog Gain range min 1.000000, max 10.625000; Exposure Range min 13000, max 683709000;

GST_ARGUS: 1280 x 720 FR = 59.999999 fps Duration = 16666667 ; Analog Gain range min 1.000000, max 10.625000; Exposure Range min 13000, max 683709000;

GST_ARGUS: 1280 x 720 FR = 120.000005 fps Duration = 8333333 ; Analog Gain range min 1.000000, max 10.625000; Exposure Range min 13000, max 683709000;

GST_ARGUS: Running with following settings:
   Camera index = 0 
   Camera mode  = 2 
   Output Stream W = 1920 H = 1080 
   seconds to Run    = 0 
   Frame Rate = 29.999999 
GST_ARGUS: Setup Complete, Starting captures for 0 seconds
GST_ARGUS: Starting repeat capture requests.
CONSUMER: Producer has connected; continuing.
[ WARN:0@1.878] global /home/rainer/opencv/modules/videoio/src/cap_gstreamer.cpp (1405) open OpenCV | GStreamer warning: Cannot query video position: status=0, value=-1, duration=-1
GST_ARGUS: Cleaning up
CONSUMER: Done Success
GST_ARGUS: Done Success

# tensorflow
(donkey) rainer@donkeynano10:~/dev/CSI-Camera$ python
Python 3.9.16 | packaged by conda-forge | (main, Feb  1 2023, 22:05:40) 
[GCC 11.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import tensorflow as tf
>>> tf.__version__
'2.9.3'
>>> from tensorflow.python.compiler.tensorrt import trt_convert as trt
>>> trt._check_trt_version_compatibility()
INFO:tensorflow:Linked TensorRT version: (8, 2, 1)
INFO:tensorflow:Loaded TensorRT version: (8, 2, 1)
>>> quit()
```
