#!/bin/sh
#▀▛▘▗ ▌ ▀▛▘  ▌   ▛▀▖          ▜         ▌
# ▌ ▄ ▌▗▘▌▞▀▖▌▗▘ ▌ ▌▞▀▖▌  ▌▛▀▖▐ ▞▀▖▝▀▖▞▀▌▞▀▖▙▀▖
# ▌ ▐ ▛▚ ▌▌ ▌▛▚  ▌ ▌▌ ▌▐▐▐ ▌ ▌▐ ▌ ▌▞▀▌▌ ▌▛▀ ▌
# ▘ ▀▘▘ ▘▘▝▀ ▘ ▘ ▀▀ ▝▀  ▘▘ ▘ ▘ ▘▝▀ ▝▀▘▝▀▘▝▀▘▘by rouze_d

TIKTOK_HANDLE="$1"
[ -z "$TIKTOK_HANDLE" ] && echo "Please specify a TikToker's handle (@some_name)" && exit 1

mkdir "$TIKTOK_HANDLE"
tr '"' '\n' < "$(find "$PWD" -iname "*$TIKTOK_HANDLE*.html")" | grep @ | grep '/video/' | grep '\.com/@' >> "$TIKTOK_HANDLE"/urls.txt

while read -r url;
do
    ./tik.sh "$url" "$TIKTOK_HANDLE"/
done < "$TIKTOK_HANDLE"/urls.txt

