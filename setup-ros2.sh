sudo apt-get install git -y
mkdir -p ~/ros2_ws/src
cd ~/ros2_ws/src
git clone https://gitlab.com/eufs/eufs_sim.git
git clone https://gitlab.com/eufs/eufs_msgs.git
git clone https://gitlab.com/eufs/eufs_rviz_plugins.git
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
sudo apt-get install ros-galactic-gazebo-dev
sudo apt-get install ros-galactic-gazebo-ros
sudo apt-get install ros-galactic-ackermann-msgs
colcon build
