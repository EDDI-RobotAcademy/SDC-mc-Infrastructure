#!/bin/bash

sudo cat /etc/apt/sources.list
sudo apt-get autoremove --purge --yes \
	&& sudo rm -rf /var/lib/apt/lists/* \
	&& sudo rm -rf /etc/ros/rosdep/sources.list.d/20-default.list

sudo sed -i -e 's+\(^deb http://security.*\)+# \1+g' /etc/apt/sources.list
sudo apt-get clean && sudo apt-get update

sudo apt-get install -y \
	tmux \
	curl \
	wget \
	vim \
	git \
	sudo \
	libgl1-mesa-glx \
	libgl1-mesa-dri \
	mesa-utils \
	unzip \
	ntp \
	whois \
	net-tools \
	locales \
	ssh

locale-gen en_US.UTF-8

FILE="/etc/apt/sources.list.d/ros-latest.list"

if [ ! -e $FILE ];then
  echo "파일이 존재하지 않습니다!"
  sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros-latest.list'
  sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
  sudo apt-get update
  sudo apt-get install -y \
  	protobuf-compiler \
	libeigen3-dev \
	libopencv-dev \
	ros-melodic-rqt*
fi

sudo apt-get install -y python3 python3-pip python-rosinstall python-rosdp python-rosinstall-generator

sudo apt-get autoclean
