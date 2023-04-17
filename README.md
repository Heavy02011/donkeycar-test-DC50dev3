# donkeycar-test-tf_2_9
testing https://github.com/autorope/donkeycar/tree/tf_2_9

# Jetson Nano 4GB

## 1 setup
### 1.1 get repos
- /media/rainer/_data/30-projects/42-DIYrobocars/donkeycar
```
git remote add upstream https://github.com/autorope/donkeycar
git remote add origin https://github.com/Heavy02011/donkeycar

(sds16) rainer@neuron2204:/media/rainer/_data/30-projects/42-DIYrobocars/donkeycar$ 
git remote -v
origin	https://github.com/Heavy02011/donkeycar.git (fetch)
origin	https://github.com/Heavy02011/donkeycar.git (push)
upstream	https://github.com/autorope/donkeycar (fetch)
upstream	https://github.com/autorope/donkeycar (push)
git fetch --all
git push origin tf_2_9
git checkout tf_2_9
```
- /media/rainer/_data/30-projects/42-DIYrobocars/donkeydocs
```
git checkout Update_to_tf_29

(sds16) rainer@neuron2204:/media/rainer/_data/30-projects/42-DIYrobocars/donkeydocs$ 
git remote -v
origin	https://github.com/Heavy02011/donkeydocs.git (fetch)
origin	https://github.com/Heavy02011/donkeydocs.git (push)
```
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

```
2031  mamba env create -f install/envs/ubuntu.yml
 2032  conda create --name tf_2_9 --clone openai
 2033  conda activate tf_2_9
 2034  pip install -r ubuntu_requirements.txt 
 2035  vi ubuntu_requirements.txt 
 2036  pip install -r ubuntu_requirements.txt 
 2037  vi ubuntu_requirements.txt 
 2038  pip install -r ubuntu_requirements.txt 
 2039  vi ubuntu_requirements.txt 
 2040  python
 2041  sudo apt install libopencv-dev python3-opencv
 2042  pkg-config –modversion opencv4
 2043  python
 2044  vi ubuntu_requirements.txt 
 2045  pip install -r ubuntu_requirements.txt 
 2046  vi ubuntu_requirements.txt 
 2047  pip install -r ubuntu_requirements.txt 
 2048  pip install --upgrade pip setuptools
 2049  pip cache purge
 2050  pip install codecov
 2051  vi ubuntu_requirements.txt 
 2052  pip install -r ubuntu_requirements.txt 
 2053  vi ubuntu_requirements.txt 
 2054  pip install -r ubuntu_requirements.txt 
 2055  vi ubuntu_requirements.txt 
 2056  pip install -r ubuntu_requirements.txt 
 2057  vi ubuntu_requirements.txt 
 2058  pip install -r ubuntu_requirements.txt 
 2059  history 
 
 2000  conda deactivate
 2001  mamba info --envs
 2002  free -h
 2003  top
 2004  mamba info --envs
 2005  kill -9 5436
 2006  cd install/
 2007  cd envs/
 2008  more ubuntu.yml 
 2009  top
 2010  kill -9 8803
 2011  cd ..
 2012  vi convert-yaml-req.py
 2013  python convert-yaml-req.py install/envs/ubuntu.yml ubuntu_requirements.txt
 2014  more ubuntu_requirements.txt 
 2015  top
 2016  kill -9 24530
 2017  conda activate tf_2_9
 2018  python
 2019  history 
```
```
(tf_2_9) rainer@neuron2204:/media/rainer/_data/30-projects/42-DIYrobocars/donkeycar$ more ubuntu_requirements.txt 
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


Check torch gpu
```
 
 (tf_2_9) rainer@neuron2204:/media/rainer/_data/30-projects/42-DIYrobocars/donkeycar$ python
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
>>> 


```
