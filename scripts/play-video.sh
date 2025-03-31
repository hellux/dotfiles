#!/bin/sh

fifo=~/.cache/mp_pipe
[ ! -e $fifo ] && mkfifo $fifo

MAGIC="--title=queue"

args="--keep-open=yes --really-quiet --input-ipc-server=$fifo"
queue=false
while getopts q flag; do
    case "$flag" in
        q) queue=true;;
        [?]) die "invalid flag -- $OPTARG"
    esac
done
shift $((OPTIND-1))

[ "$queue" = "true" ] && args="$MAGIC $args"

urls=""
for url in $*; do
    urls="$urls $(yt-dlp -s -j "$*" | jq -M '.webpage_url' | tr -d \")"
done

for url in $urls; do
    if yt-dlp -q -s -f "bestvideo+bestaudio" "$url";
    then format="bestvideo+bestaudio"
    else format="best"
    fi

    if [ "$queue" = "true" ] && ps -eo command | grep -q "^mpv $MAGIC"; then
        mpv_cmd="loadfile ytdl://$url append-play ytdl-format=$format"
        echo $mpv_cmd | socat - $fifo
    else
        mpv $args --ytdl-format=$format "ytdl://$url" &
    fi
done

