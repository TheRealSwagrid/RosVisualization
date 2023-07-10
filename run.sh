docker build -t "rviz" .

xhost +
sudo docker run -it \
    --device=/dev/dri \
    --group-add video \
    --volume=/tmp/.X11-unix:/tmp/.X11-unix \
    --env="DISPLAY=$DISPLAY" \
    --network=host \
    --rm \
    rviz
