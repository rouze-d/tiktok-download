#!/bin/bash

YELLOW=$(tput setaf 3)
GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
BLUE=$(tput setaf 4)
GGG=$(tput setaf 5)
CYN=$(tput setaf 7)
STAND=$(tput sgr 0)
BOLD=$(tput bold)


GET="$1"
pwd=$(pwd)


if [ -z $GET ]; then #|| [ -z $POST ] ; then
    echo -e "$YELLOW$BOLD Missing video link URL:$STAND$BOLD bash $0 https://www.tiktok.com/@_fucktiktok/video/1234567890$STAND"
    exit
fi


user=$(echo $1 | cut -d '/' -f 4)
id=$(echo $1 | cut -d '/' -f 6 | cut -d '?' -f 1)

aria2c -m 0 -x 10 -c https://tikwm.com/video/media/hdplay/${id}.mp4 -o ${user}-${id}.mp4
