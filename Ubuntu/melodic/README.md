# ros-docker-melodic


## Build
~~~
docker build -f Ubuntu/melodic/Dockerfile -t ubuntu-melodic-dynamixel  Ubuntu/melodic/ 
~~~

## RUN
- With dynamixel
~~~
docker run -it --privileged --net host --ipc host \
        -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY \
        -e LOCAL_UID=`id -u $USER` -e LOCAL_GID=`id -g $USER` \
        -v $PWD/src:/home/ubuntu/catkin_ws/src/ \
        -e LOCAL_DEVICE=YOUR_DEVICE \
        --device /dev/YOUR_DEVICE:/dev/YOUR_DEVICE \
        ubuntu-melodic-dynamixel:latest bash
~~~
YOUR_DEVICE is your usb device, e.g, ttyUSB0.

- Without dynamixel
~~~
docker run -it --privileged --net host --ipc host \
        -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY \
        -e LOCAL_UID=`id -u $USER` -e LOCAL_GID=`id -g $USER` \
        -v $PWD/src:/home/ubuntu/catkin_ws/src/ \
        --name ros-melodic \
        ubuntu-melodic-dynamixel:latest bash
~~~



