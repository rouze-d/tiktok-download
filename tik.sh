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

echo -e ".tiktok.com	TRUE	/	TRUE	1636946512	tt_webid_v2	6895185694261839361
.tiktok.com	TRUE	/	TRUE	1636946512	tt_webid	6895185694261839361
.www.tiktok.com	TRUE	/	FALSE	1613928627	MONITOR_WEB_ID	8c80899a-7869-4397-8df6-acdbaf474f9b
.tiktok.com	TRUE	/	TRUE	0	tt_csrf_token	RDaUIcQlHKb5P3nN594tHuOd
www.tiktok.com	FALSE	/	FALSE	0	s_v_web_id	verify_khutsc6w_d9lZBWah_bAU1_4Zx5_9a1T_5FZuFc1gzRAx" > $pwd/.t_cookie.txt

#down=`curl -s -k --url $GET --user-agent 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36' --connect-timeout 90 | tr '"' '\n' | grep -i -E 'video/[a-z]'\|'.mp4' | tail -n 1`

#down=`curl --cookie .t_cookie.txt -s -k --url $GET --user-agent 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36' --connect-timeout 90 | tr '"' '\n' | grep -i -E 'video/[a-z]'\|'.mp4' | tail -n 1`


#down=`curl --cookie $pwd/.t_cookie.txt -s -k --url $GET --referer $GET --user-agent 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36' --connect-timeout 90 | tr '"' '\n' | grep video_mp4 | head -n 1 | sed 's/amp;//g'`

#down=`curl --cookie $pwd/.t_cookie.txt -s -k --url $GET --referer $GET --user-agent 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36' --connect-timeout 90 | tr '"' '\n' | grep video_mp4 | head -n 1 | sed 's/\\u0026/\&/g'`

down=`curl --cookie $pwd/.t_cookie.txt -s -k --url https://www.tiktok.com/node/share/video/$c/$b --referer $GET --user-agent 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36' --connect-timeout 90 | tr '"' '\n' | grep -i -E 'video_mp4' | tail -n 1`

#c=$(echo $1 | cut -d '@' -f 2 | cut -d '/' -f 1)


wget --load-cookies=$pwd/".t_cookie.txt" --referer=$GET --user-agent='Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36' --show-progress -c $down -O $c-$b.mp4
#wget --user-agent='Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36' --show-progress -c $down -O $c-$b.mp4
