#!/bin/bash
/home/ubuntu/usercontrol.sh
cd /home/ubuntu/catkin_ws
if [ -n "$LOCAL_DEVICE" ]; then
    /home/ubuntu/devicecontrol.sh
fi
exec gosu ubuntu "$@"