sudo apt-get install git -y
mkdir -p ~/ros2_ws/src
cd ~/ros2_ws/src
git clone https://gitlab.com/eufs/eufs_msgs.git
git clone https://gitlab.com/eufs/eufs_rviz_plugins.git
git clone https://github.com/arece-fs/arece-sim.git
git clone https://github.com/arece-fs/arece_msgs.git
sudo apt-get install python3-pip -y
pip3 install colcon-common-extensions -U
export ARECE_MASTER=~/ros2_ws/src
echo 'export ARECE_MASTER=~/ros2_ws/src' >> ~/.bashrc
sudo apt-get install python3-rosdep -y
sudo rosdep init
rosdep update
rosdep install --from-paths $ARECE_MASTER --ignore-src -r -y
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
sudo apt-get install libpcl-dev libyaml-cpp-dev -y
sudo apt-get install ros-galactic-plotjuggler -y
mkdir -p ~/dev
cd ~/dev/
wget https://raw.githubusercontent.com/arece-fs/arece-fs/main/arece-doc.sh
chmod +x arece-doc.sh
echo 'alias arece-doc="~/dev/arece-doc.sh"' >> ~/.bashrc
git clone https://github.com/ros-infrastructure/rosdoc2
cd rosdoc2
pip3 install --user --upgrade .
cd ~/ros2_ws
pip3 install --upgrade numpy==1.20.3 numexpr==2.7.3 pandas==1.5.3 pytest==7.2.0
source ~/.bashrc
colcon build
