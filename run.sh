#! /bin/bash

echo $DISPLAY
xhost +
clear

docker run -it --net=host -v /tmp/.X11-unix:/tmp/.X11-unix --env QT_X11_NO_MITSHM=1 -e DISPLAY --rm anto112/dsp:1.2
