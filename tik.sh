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
    echo -e "$RED$BOLD
 ▀▛▘▗ ▌ ▀▛▘  ▌   ▛▀▖          ▜         ▌      
  ▌ ▄ ▌▗▘▌▞▀▖▌▗▘ ▌ ▌▞▀▖▌  ▌▛▀▖▐ ▞▀▖▝▀▖▞▀▌▞▀▖▙▀▖
  ▌ ▐ ▛▚ ▌▌ ▌▛▚  ▌ ▌▌ ▌▐▐▐ ▌ ▌▐ ▌ ▌▞▀▌▌ ▌▛▀ ▌  
  ▘ ▀▘▘ ▘▘▝▀ ▘ ▘ ▀▀ ▝▀  ▘▘ ▘ ▘ ▘▝▀ ▝▀▘▝▀▘▝▀▘▘$STAND by-$GREEN$BOLD rouze_d$STAND"
    echo -e "$YELLOW$BOLD Missing video link URL:$STAND$BOLD bash $0 https://www.tiktok.com/@_fucktiktok/video/1234567890$STAND"
    exit
fi

c=$(echo $1 | cut -d '/' -f 4)
b=$(echo $1 | cut -d '/' -f 6 | cut -d '?' -f 1)

# two type URL request

#down=`curl -s -k --url $GET --user-agent 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36' --connect-timeout 90 | tr '"' '\n' | grep -i -E 'video/[a-z]'\|'.mp4' | tail -n 1`
down=`curl -s -k --url https://www.tiktok.com/node/share/video/$c/$b --user-agent 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36' --connect-timeout 90 | tr '"' '\n' | grep -i -E 'video_mp4' | tail -n 1`

#c=$(echo $1 | cut -d '@' -f 2 | cut -d '/' -f 1)

wget --referer=$GET --user-agent='Opera/9.80 (Android 4.1.2; Linux; Opera Mobi/ADR-1305251841) Presto/2.11.355 Version/12.10' --show-progress -c $down -O $c-$b.mp4
