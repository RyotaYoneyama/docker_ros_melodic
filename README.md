# ros-docker
This repository contains Dockerfiles for ros.

## Available versions
| Version | Status  | README                                |
| ------- | ------- | ------------------------------------- |
| melodic | Built   | [README.md](Ubuntu/melodic/README.md) |
| noetic  | Built   |                                       |
| foxy    | Not yet |                                       |


## How to run
- Build docker iamge
```
make build_noetic
```
- Run container without devices
```
make run_noetic SRC=YOUR_SRC
```
- Run container with a device SRC=YOUR_SRC
```
make run_noetic_device DEVICE=YOUR_DEVICE
```
YOUR_DEVICE is the name of your usb device, e.g, ttyUSB0. Please replace it with the name.
YOUR_SRC is src directory of your catkin workspace.

## Notes
This repository was developed to use dynamixel motors with ros melodic with [this repository](https://github.com/RyotaYoneyama/wormy_arm.git). 

Your repositories are supposed to be located under ros-docker/src.


## Referene
- [ros-docker-gui](https://github.com/turlucode/ros-docker-gui)
