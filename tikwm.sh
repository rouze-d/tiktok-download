#!/bin/sh

TIKTOK_URL="$1"
[ -z "$TIKTOK_URL" ] \
    && echo "Missing video link URL, usage: ./tik.sh https://www.tiktok.com/@tiktok_user/video/1234567890 [destination_folder]" \
    && exit 1
DESTINATION_FOLDER=$2

NAME=$(echo "$TIKTOK_URL" | cut -d '/' -f 4)
AUTHOR=$(echo "$TIKTOK_URL" | cut -d '@' -f 2 | cut -d '/' -f1 | tr -d '._-' )
ID=$(echo "$TIKTOK_URL" | cut -d '/' -f 6 | cut -d '?' -f 1)
USER_AGENT="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36"




VIDEO_URL=$(curl \
    --url https://tikmate.online/"$AUTHOR"/"$ID" -L \
    --silent \
    --user-agent "$USER_AGENT" \
    --connect-timeout 90 | tr '"' '\n' | grep 'video\_mp4\&')

curl --progress-bar \
    --user-agent "$USER_AGENT" \
    --output "$DESTINATION_FOLDER""$NAME"-"$ID".mp4 \
    --continue-at - "$VIDEO_URL"
