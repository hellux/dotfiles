#!/bin/env sh
fifo=$XDG_RUNTIME_DIR/mp_pipe
[ ! -e $fifo ] && mkfifo $fifo

if ps -eo comm | grep -q '^mpv$'; then
    echo loadfile "$@" append-play > $fifo
else
    mpv --ytdl-format="bestvideo+bestaudio "--input-file=$fifo "$@" \
        1> /dev/null 2> /dev/null &
fi
