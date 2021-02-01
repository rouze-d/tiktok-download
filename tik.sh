#!/bin/sh
# ▀▛▘▗ ▌ ▀▛▘  ▌   ▛▀▖          ▜         ▌
#  ▌ ▄ ▌▗▘▌▞▀▖▌▗▘ ▌ ▌▞▀▖▌  ▌▛▀▖▐ ▞▀▖▝▀▖▞▀▌▞▀▖▙▀▖
#  ▌ ▐ ▛▚ ▌▌ ▌▛▚  ▌ ▌▌ ▌▐▐▐ ▌ ▌▐ ▌ ▌▞▀▌▌ ▌▛▀ ▌
#  ▘ ▀▘▘ ▘▘▝▀ ▘ ▘ ▀▀ ▝▀  ▘▘ ▘ ▘ ▘▝▀ ▝▀▘▝▀▘▝▀▘▘ by rouze_d


TIKTOK_URL="$1"
[ -z "$TIKTOK_URL" ] \
    && echo "Missing video link URL, usage: ./tik.sh https://www.tiktok.com/@tiktok_user/video/1234567890 [destination_folder]" \
    && exit 1
DESTINATION_FOLDER=$2

AUTHOR=$(echo "$TIKTOK_URL" | cut -d '/' -f 4)
ID=$(echo "$TIKTOK_URL" | cut -d '/' -f 6 | cut -d '?' -f 1)
USER_AGENT="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36"

VIDEO_URL=$(curl --cookie "$PWD"/.cookie.txt \
    --silent \
    --referer "$TIKTOK_URL" \
    --user-agent "$USER_AGENT" \
    --connect-timeout 90 "$TIKTOK_URL" | tr '"' '\n' | grep video_mp4 | head -n 1 | sed 's/amp;//g')

curl --progress-bar \
    --cookie "$PWD"/.cookie.txt \
    --referer "$TIKTOK_URL" \
    --user-agent "$USER_AGENT" \
    --output "$DESTINATION_FOLDER""$AUTHOR"-"$ID".mp4 \
    --continue-at - "$VIDEO_URL"


