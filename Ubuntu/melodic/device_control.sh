sudo chmod 666 /sys/bus/usb-serial/devices/$LOCAL_DEVICE/latency_timer
echo "1" >/sys/bus/usb-serial/devices/$LOCAL_DEVICE/latency_timer
sudo chmod 666 /dev/$LOCAL_DEVICE