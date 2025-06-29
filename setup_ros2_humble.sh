sudo apt-get install git -y
cd ~/
mkdir -p ~/ros2_ws/src
cd ~/ros2_ws/src

sudo apt-get install python3-rosdep python3-rosinstall-generator python3-vcstool python3-rosinstall build-essential

# install zed_sdk 
cd ~
mkdir -p ~/zed_ws/src
cd ~/zed_ws/src
git clone  --recursive https://github.com/stereolabs/zed-ros2-wrapper.git
cd ..
rm -r build # in case of multiple script run, can create linking problems
sudo apt update
rosdep install --from-paths src --ignore-src -r -y # install dependencies
colcon build --symlink-install --cmake-args=-DCMAKE_BUILD_TYPE=Release --parallel-workers $(nproc) # build the workspace
echo source $(pwd)/install/local_setup.bash >> ~/.bashrc # automatically source the installation in every new bash (optional)
export ARECE_MASTER=~/ros2_ws/src
echo 'export ARECE_MASTER=~/ros2_ws/src' >> ~/.bashrc
source ~/.bashrc

cd $ARECE_MASTER
# git arece repos 
git clone https://github.com/arece-fs/arece-sim.git
git clone https://github.com/arece-fs/arece_msgs.git
git clone https://github.com/arece-fs/eufs_msgs.git
git clone https://github.com/arece-fs/arece_compet_python.git
git clone https://github.com/arece-fs/arece_state_machine_python.git 
git clone https://github.com/arece-fs/lap_detection.git 
git clone https://github.com/arece-fs/arece_lidar_cpp.git
git clone --recursive https://github.com/arece-fs/FAST_LIO_ROS2.git
git clone https://github.com/arece-fs/arece_perception_cpp.git
git clone https://github.com/arece-fs/arece_stereo_python.git
git clone --recursive https://github.com/arece-fs/ros_can.git
git clone https://github.com/arece-fs/arece_trajectory_planner_python.git
git clone https://github.com/arece-fs/arece_gps.git
git clone https://github.com/arece-fs/arece_marker_debug_cpp.git
git clone https://github.com/arece-fs/arece_trajectory_torch.git


# set branchs 
cd ~/ros2_ws/src/arece-sim
git checkout humble
cd ~/ros2_ws/src/

# install deps
cd arece_trajectory_planner_python
pip install -r requirements.txt
cd ..
cd ~/ros2_ws/src
sudo apt-get install python3-pip -y
pip3 install colcon-common-extensions -U

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
sudo apt-get install ros-humble-foxglove-bridge
sudo apt install ros-humble-robot-localization

# bag 
sudo apt install sudo apt-get install ros-humble-rosbag2
sudo apt install ros-humble-rosbag2-storage-mcap

mkdir -p ~/dev
cd ~/dev/
wget https://raw.githubusercontent.com/arece-fs/arece-fs/main/arece-doc.sh
chmod +x arece_doc.sh
echo 'alias arece_doc="~/dev/arece_doc.sh"' >> ~/.bashrc
git clone https://github.com/ros-infrastructure/rosdoc2
cd rosdoc2
pip3 install --user --upgrade .
cd ~/ros2_ws
pip3 install --upgrade numpy==1.20.3 numexpr==2.7.3 pandas==1.5.3 pytest==7.2.0
source ~/.bashrc
colcon build
