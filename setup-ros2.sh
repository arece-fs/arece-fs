sudo apt-get install git -y
mkdir -p ~/ros2_ws/src
cd ~/ros2_ws/src
git clone https://gitlab.com/eufs/eufs_sim.git
git clone https://gitlab.com/eufs/eufs_msgs.git
git clone https://gitlab.com/eufs/eufs_rviz_plugins.git
git clone https://github.com/arece-fs/arece_lidar_cpp.git
git clone https://github.com/arece-fs/arece_msgs.git
git clone https://github.com/arece-fs/arece_marker_debug_py
sudo apt-get install python3-pip -y
pip3 install colcon-common-extensions -U
export EUFS_MASTER=~/ros2_ws/src
echo 'export EUFS_MASTER=~/ros2_ws/src' >> ~/.bashrc
sudo apt-get install python3-rosdep -y
sudo rosdep init
rosdep update
rosdep install --from-paths $EUFS_MASTER --ignore-src -r -y
cd ~/ros2_ws
echo 'source ~/ros2_ws/install/setup.bash' >> ~/.bashrc
source ~/ros2_ws/install/setup.bash
sudo apt install python3-colcon-common-extensions -y
sudo apt-get install ros-galactic-gazebo-dev -y
sudo apt-get install ros-galactic-gazebo-plugins -y
sudo apt-get install ros-galactic-gazebo-ros -y
sudo apt-get install ros-galactic-ackermann-msgs -y 
sudo apt-get install ros-galactic-joint-state-publisher -y
sudo apt-get install ros-galactic-xacro -y
sudo apt-get install gazebo11 libgazebo11 libgazebo11-dev -y
sudo apt-get install libpcl-dev -y
colcon build
