# donkeycar-test-tf_2_9
testing https://github.com/autorope/donkeycar/tree/tf_2_9

## 1 get repos
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
## 2 follow [donkeydocs](https://github.com/autorope/donkeydocs/blob/Update_to_tf_29/docs/guide/robot_sbc/setup_jetson_nano.md#installation-for-donkey-car-main)

## 3 results
## 3.1 jtop
![](media/jetson-jtop1.png)
![](media/jetson-jtop4.png)
![](media/jetson-jtop7.png)

## 3.2 [OpenCV 4.6, tf 2.9, camera succesful](https://github.com/Heavy02011/donkeycar-test-tf_2_9/blob/main/test-result.md)

## 3 hints
- [ ] give size of swapfile as default is 6 not 8 G, no way to change afterwards
- [ ] git checkout **main** NOT **tf_2_9**?
