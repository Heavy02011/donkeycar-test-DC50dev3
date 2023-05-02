# docker jetson

 1958  git clone https://github.com/dusty-nv/jetson-containers.git
 1959  sudo /etc/docker/daemon.json
 1960  sudo vi /etc/docker/daemon.json
 1961  cd jetson-containers/
 1962  ./scripts/docker_build_ros.sh --distro foxy --package desktop_full
 1963  ./scripts/docker_build_ros.sh --distro foxy --package desktop

(donkey) rainer@donkeynano10:~/dev/jetson-containers$ 
./scripts/docker_build_ros.sh --distro foxy --package desktop
