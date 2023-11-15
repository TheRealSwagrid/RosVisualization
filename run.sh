#!/usr/bin/env bash
#5.5.0/run.sh

docker build -t "rviz" .
port="$1"

python /var/RosVizualization.py "$port" &

xhost +
sudo docker run \
    --device=/dev/dri \
    --group-add video \
    --volume=/tmp/.X11-unix:/tmp/.X11-unix \
    --env="DISPLAY=$DISPLAY" \
    --env="semantix_port=$port" \
    --network=host \
    --rm \
    rviz
