FROM ubuntu:18.04

# Install packages without prompting the user to answer any questions
ENV DEBIAN_FRONTEND noninteractive 


# Install packages
RUN apt-get update && apt-get install -y \
locales \
lsb-release \
mesa-utils \
git \
subversion \
wget \
curl \
htop \
libssl-dev \
build-essential \
dbus-x11 \
cmake \
byobu \
gosu \
bash-completion \
sudo \
tzdata \
vim \
software-properties-common \
gdb valgrind && \
apt-get clean && rm -rf /var/lib/apt/lists/*

# Locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

RUN useradd --create-home --home-dir /home/ubuntu  --shell /bin/bash --user-group --groups adm,sudo ubuntu && \
    echo ubuntu:ubuntu | chpasswd && \
    echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers


ENV USER ubuntu
USER ubuntu

# Install ROS
RUN sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
RUN sudo apt-get update && sudo apt-get install -yq --allow-downgrades --allow-remove-essential --allow-change-held-packages python-catkin-tools \
libpcap-dev \
libopenblas-dev \
gstreamer1.0-tools libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev \
ros-melodic-desktop-full python-rosinstall python-rosinstall-generator python-wstool build-essential python-rosdep \
ros-melodic-socketcan-bridge \
ros-melodic-geodesy \
ros-melodic-joint-trajectory-controller ros-melodic-ros-control ros-melodic-ros-controllers \
ros-melodic-moveit && \
sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/*

# Configure ROS
RUN sudo rosdep init && rosdep update 
RUN echo "source /opt/ros/melodic/setup.bash" >> /home/ubuntu/.bashrc
RUN echo "export ROSLAUNCH_SSH_UNKNOWN=1" >> /home/ubuntu/.bashrc

WORKDIR /home/ubuntu
RUN mkdir -p /home/ubuntu/catkin_ws/src

# Entry script - This will also run terminator
COPY ./entrypoint.sh /home/ubuntu/entrypoint.sh
COPY ./user_control.sh /home/ubuntu/user_control.sh
COPY ./device_control.sh /home/ubuntu/device_control.sh
RUN sudo chmod +x /home/ubuntu/*.sh
USER root
ENTRYPOINT ["/home/ubuntu/entrypoint.sh"]
