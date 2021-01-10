#!/bin/sh
#▀▛▘▗ ▌ ▀▛▘  ▌   ▛▀▖          ▜         ▌
# ▌ ▄ ▌▗▘▌▞▀▖▌▗▘ ▌ ▌▞▀▖▌  ▌▛▀▖▐ ▞▀▖▝▀▖▞▀▌▞▀▖▙▀▖
# ▌ ▐ ▛▚ ▌▌ ▌▛▚  ▌ ▌▌ ▌▐▐▐ ▌ ▌▐ ▌ ▌▞▀▌▌ ▌▛▀ ▌
# ▘ ▀▘▘ ▘▘▝▀ ▘ ▘ ▀▀ ▝▀  ▘▘ ▘ ▘ ▘▝▀ ▝▀▘▝▀▘▝▀▘▘by rouze_d

echo ""
echo -e "Input Name : \c"
read NAME

mkdir "$NAME"
cat *"$NAME"*.html | tr '"' '\n' | grep @ | grep '/video/' | grep '\.com/@' >> "$NAME"/"$NAME".txt

while read x;
do
    ./tik.sh "$x" "$NAME"/
done < "$NAME"/"$NAME".txt

