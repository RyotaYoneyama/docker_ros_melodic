#!/bin/bash
/home/ubuntu/user_control.sh
cd /home/ubuntu/catkin_ws
if [ -n "$LOCAL_DEVICE" ]; then
    /home/ubuntu/device_control.sh
fi
exec gosu ubuntu "$@"