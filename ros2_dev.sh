#!/usr/bin/env bash

locale

sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

locale

sudo apt install -y software-properties-common
sudo add-apt-repository universe

echo "----------Add ROS2 GPG key----------"

sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

echo "----------Install ROS2 development tools----------"
sudo apt update && sudo apt install -y ros-dev-tools

echo "----------Install ROS2----------"
sudo apt update
sudo apt upgrade
sudo apt install -y ros-jazzy-desktop

source /opt/ros/jazzy/setup.bash

echo "----------Install vcstool, nodejs, npm and ros-webbridge----------"

sudo apt install python3-vcstool -y
sudo apt install nodejs npm -y
sudo apt install -y ros-$ROS_DISTRO-rosbridge-suite

echo "----------Install ROS2 Realsense Library----------"

sudo apt install ros-jazzy-realsense2-* -y
