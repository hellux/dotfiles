#!/bin/sh
link=$1
watch=${2:-/net/narwhal/tmp/torrent};
h=$(echo "$link" | awk -F'&' 'BEGIN {RS="xt=urn:btih:"} NR==2 {print $1}')
[ -n "$h" ] && echo "d10:magnet-uri${#link}:${link}e" > "$watch/meta-$h.torrent"
