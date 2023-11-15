5.5.0/run.sh 
#!/usr/bin/env bash
docker build -t "rviz" .
port="$1"

xhost +
sudo docker run -it \
    --device=/dev/dri \
    --group-add video \
    --volume=/tmp/.X11-unix:/tmp/.X11-unix \
    --env="DISPLAY=$DISPLAY" \
    --env="semantix_port=$port" \
    --network=host \
    --rm \
    rviz
