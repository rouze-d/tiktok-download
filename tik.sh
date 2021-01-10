#!/bin/bash
# ▀▛▘▗ ▌ ▀▛▘  ▌   ▛▀▖          ▜         ▌
#  ▌ ▄ ▌▗▘▌▞▀▖▌▗▘ ▌ ▌▞▀▖▌  ▌▛▀▖▐ ▞▀▖▝▀▖▞▀▌▞▀▖▙▀▖
#  ▌ ▐ ▛▚ ▌▌ ▌▛▚  ▌ ▌▌ ▌▐▐▐ ▌ ▌▐ ▌ ▌▞▀▌▌ ▌▛▀ ▌
#  ▘ ▀▘▘ ▘▘▝▀ ▘ ▘ ▀▀ ▝▀  ▘▘ ▘ ▘ ▘▝▀ ▝▀▘▝▀▘▝▀▘▘ by rouze_d


VIDEO_URL="$1"
[ -z "$VIDEO_URL" ] \
    && echo "Missing video link URL, usage: ./tik.sh https://www.tiktok.com/@tiktok_user/video/1234567890" \
    && exit 1

AUTHOR=$(echo $1 | cut -d '/' -f 4)
ID=$(echo $1 | cut -d '/' -f 6 | cut -d '?' -f 1)

echo -e "
.www.tiktok.com	TRUE	/	FALSE	1614874506	MONITOR_WEB_ID	b1c73e7a-e9b7-4f6c-8b95-1b49ab3227b8
.tiktok.com	TRUE	/	FALSE	1608332062	CONSENT	YES+
.tiktok.com	TRUE	/	TRUE	1638633279	tt_webid	6902430212190832130
.tiktok.com	TRUE	/	TRUE	1638633279	tt_webid_v2	6902430212190832130
.tiktok.com	TRUE	/	TRUE	0	tt_csrf_token	Htv_7mtkaH1D_ehZr3f84Y5Y
www.tiktok.com	FALSE	/	FALSE	0	s_v_web_id	verify_kiagygei_J4Frui45_RF6k_4r3t_AOr3_ju5FsZ6gWnNv
" > "$PWD"/.t_cookie.txt

down=$(curl --cookie "$PWD"/.t_cookie.txt \
    -s \
    -k \
    --url "$VIDEO_URL" \
    --referer "$VIDEO_URL" \
    --user-agent 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36' \
    --connect-timeout 90 | tr '"' '\n' | grep video_mp4 | head -n 1 | sed 's/amp;//g')

wget --load-cookies "$PWD"/.t_cookie.txt \
    --referer "$VIDEO_URL" \
    --user-agent 'Opera/9.80 (Android 4.1.2; Linux; Opera Mobi/ADR-1305251841) Presto/2.11.355 Version/12.10' \
    --show-progress -c $down \
    -O "$AUTHOR"-"$ID".mp4

