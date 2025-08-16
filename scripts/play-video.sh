#!/bin/sh

fifo=~/.cache/mp_pipe
[ ! -e $fifo ] && mkfifo $fifo

MAGIC="--title=queue"

args="--keep-open=yes --quiet --input-ipc-server=$fifo"
queue=false
while getopts q flag; do
    case "$flag" in
        q) queue=true;;
        [?]) die "invalid flag -- $OPTARG"
    esac
done
shift $((OPTIND-1))

[ "$queue" = "true" ] && args="$MAGIC $args"

urls="$*"

max_res=1080
ytdlp="format-sort=res:$max_res"
for url in $urls; do
    if [ "$queue" = "true" ] && pgrep -f "mpv $MAGIC" >/dev/null; then
        mpv_cmd="loadfile ytdl://$url append-play 0 ytdl-raw-options=$ytdlp"
        echo $mpv_cmd
        echo $mpv_cmd | socat - $fifo
    else
        mpv $args --ytdl-raw-options="$ytdlp" "ytdl://$url" &
    fi
done
