#!/bin/env sh
fifo=$XDG_RUNTIME_DIR/mp_pipe
[ ! -e $fifo ] && mkfifo $fifo

if youtube-dl -q -s -f "bestvideo+bestaudio" $@;
then format="bestvideo+bestaudio"
else format="best"
fi

if ps -eo comm | grep -q '^mpv$'; then
    echo loadfile "$@" append-play ytdl-format=$format > $fifo
else
    mpv --ytdl-format=$format --really-quiet --input-file=$fifo $@
fi
