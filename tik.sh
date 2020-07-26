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
    echo -e "$RED$BOLD TikTok Video Downloder $STAND\n by-$GREEN$BOLD rouze_d$STAND"
    echo -e "$YELLOW$BOLD Missing video link URL:$STAND$BOLD bash $0 https://www.tiktok.com/@_fucktiktok/video/1234567890$STAND"
    exit
fi


down=`curl -s -k --url $GET --user-agent 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36' --connect-timeout 90 | tr '"' '\n' | grep -i -E 'video/[a-z]'\|'.mp4' | tail -n 1`

#c=$(echo $1 | cut -d '@' -f 2 | cut -d '/' -f 1)
c=$(echo $1 | cut -d '/' -f 4)
b=$(echo $1 | cut -d '/' -f 6 | cut -d '?' -f 1)

wget --user-agent='Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36' --show-progress -c $down -O $c-$b.mp4
