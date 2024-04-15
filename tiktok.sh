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
GET="$1"



if [ -z ${GET} ]; then #|| [ -z $POST ] ; then

    echo -e "$YELLOW$BOLD Missing video link URL:$STAND$BOLD bash $0 https://www.tiktok.com/@_fucktiktok/video/1234567890$STAND"

    exit

fi




test=`echo ${GET} | cut -d '/' -f5`
user=$(echo $1 | cut -d '/' -f 4)
id=$(echo $1 | cut -d '/' -f 6 | cut -d '?' -f 1)

if [ ${test} == "video" ]; then
    aria2c -m 0 -x 10 -c https://tikwm.com/video/media/hdplay/${id}.mp4 -o ${user}-${id}.mp4
fi



if [ ${test} == "photo" ]; then
    for x in `curl -sk 'https://tikwm.com/api/?url='${id}'&count=12&cursor=0&web=1&hd=1' | tr '"' '\n' | grep https | grep -i '.jpeg'  | tr -d '\\'`;do y=$(echo -e ${x} | cut -d '&' -f4 | cut -d '=' -f2); wget -c ${x} -O ${user}-${y}.jpeg;done

fi

#if [ ${test} == "photo" ]; then
#    wget $(curl -sk 'https://tikwm.com/api/?url='${id}'&count=12&cursor=0&web=1&hd=1' | tr '"' '\n' | grep https | grep -i '.jpeg'  | tr -d '\\')
#fi
