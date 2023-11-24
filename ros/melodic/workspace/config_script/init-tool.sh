#!/bin/bash

locale-gen en_US.UTF-8

rosdep init
rosdep update
rosdep fix-permissions

echo HOME=${HOME}

mkdir -p $HOME/catkin_ws/src && cd $HOME/catkin_ws/src && catkin_init_workspace

cd $HOME/catkin_ws && catkin_make

echo "source /opt/ros/melodic/setup.bash" >> $HOME/.bashrc
echo "source /$HOME/catkin_ws/devel/setup.bash" >> $HOME/.bashrc
echo "export ROS_HOSTNAME=localhost" >> $HOME/.bashrc
echo "export ROS_MASTER_URI=http://localhost:11311" >> $HOME/.bashrc
echo "alias cw='cd ~/catkin_ws'" >> $HOME/.bashrc
echo "alias cs='cd ~/catkin_ws/src'" >> $HOME/.bashrc
echo "alias cm='cd ~/catkin_ws && catkin_make'" >> $HOME/.bashrc

source /opt/ros/$ROS_DISTRO/setup.bash
source /$HOME/catkin_ws/devel/setup.bash

IPADDR=$(hostname -I | cut -d' ' -f1)
echo "USER=$USER"
echo "HOME=$HOME"
echo "IPADDR=$IPADDR"
echo "ROS_ROOT=$ROS_ROOT"
echo "ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH"
echo "ROS_HOSTNAME=$ROS_HOSTNAME"
echo "ROS_MASTER_URI=$ROS_MASTER_URI"
