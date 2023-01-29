# ros-docker-melodic

## Clone dynamixel packages if you need them.
~~~
sh Ubuntu/melodic/clone.sh
~~~
## Build
~~~
docker build -f Ubuntu/melodic/Dockerfile-dynamixel -t ubuntu-melodic  Ubuntu/melodic/ 
~~~

## RUN
- With dynamixel
~~~
docker run -it --privileged --net host --ipc host \
        -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY \
        -e LOCAL_UID=`id -u $USER` -e LOCAL_GID=`id -g $USER` \
        -v $PWD/src:/home/ubuntu/catkin_ws/src/ \
        -e LOCAL_DEVICE=YOUR_DEVICE \
        --device YOUR_DEVICE:YOUR_DEVICE \
        --name ros-melodic-dynamixel \
        ubuntu-melodic:latest bash
~~~
YOUR_DEVICE is, e.g,  /dev/ttyUSB0.

- Without dynamixel
~~~
docker run -it --privileged --net host --ipc host \
        -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY \
        -e LOCAL_UID=`id -u $USER` -e LOCAL_GID=`id -g $USER` \
        -v $PWD/src:/home/ubuntu/catkin_ws/src/ \
        --name ros-melodic-dynamixel \
        ubuntu-melodic:latest bash
~~~

## Dynamixel
### Setup
- Terminal 1
~~~
roscore
~~~

- Terminal 2
~~~
cd /home/ubuntu/catkin_ws
catkin build
source devel/setup.bash
~~~

### Search devices
- Terminal 2
~~~
rosrun dynamixel_workbench_controllers find_dynamixel YOUR_DEVICE
~~~

