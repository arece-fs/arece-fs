sudo apt-get install git -y
cd ~/
wget https://github.com/cli/cli/releases/download/v2.31.0/gh_2.31.0_linux_amd64.deb
sudo dpkg -i gh_2.31.0_linux_amd64.deb -y
rm gh_2.31.0_linux_amd64.deb
gh auth login
mkdir -p ~/ros2_ws/src
cd ~/ros2_ws/src
git clone https://github.com/arece-fs/arece-sim.git
git clone https://github.com/arece-fs/arece_msgs.git
git clone https://github.com/arece-fs/eufs_msgs.git
cd ~/ros2_ws/src/arece-sim
git checkout humble
cd ~/ros2_ws/src
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
sudo apt-get install ros-humble-gazebo-dev -y
sudo apt-get install ros-humble-gazebo-plugins -y
sudo apt-get install ros-humble-gazebo-ros -y
sudo apt-get install ros-humble-ackermann-msgs -y 
sudo apt-get install ros-humble-joint-state-publisher -y
sudo apt-get install ros-humble-xacro -y
sudo apt-get install gazebo11 libgazebo11 libgazebo11-dev -y
sudo apt-get install libpcl-dev libyaml-cpp-dev -y
sudo apt-get install ros-humble-plotjuggler -y
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
