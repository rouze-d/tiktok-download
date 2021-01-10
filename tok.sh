#!/bin/sh
#▀▛▘▗ ▌ ▀▛▘  ▌   ▛▀▖          ▜         ▌
# ▌ ▄ ▌▗▘▌▞▀▖▌▗▘ ▌ ▌▞▀▖▌  ▌▛▀▖▐ ▞▀▖▝▀▖▞▀▌▞▀▖▙▀▖
# ▌ ▐ ▛▚ ▌▌ ▌▛▚  ▌ ▌▌ ▌▐▐▐ ▌ ▌▐ ▌ ▌▞▀▌▌ ▌▛▀ ▌
# ▘ ▀▘▘ ▘▘▝▀ ▘ ▘ ▀▀ ▝▀  ▘▘ ▘ ▘ ▘▝▀ ▝▀▘▝▀▘▝▀▘▘by rouze_d

NAME="$1"
[ -z "$NAME" ] && echo 'Please specify a TikTokers username' && exit 1

mkdir "$NAME"
cat *"$NAME"*.html | tr '"' '\n' | grep @ | grep '/video/' | grep '\.com/@' >> "$NAME"/"$NAME".txt

while read -r x;
do
    ./tik.sh "$x" "$NAME"/
done < "$NAME"/"$NAME".txt

