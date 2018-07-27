#!/bin/env sh
fifo=$HOME/.mp_pipe
[ ! -e $fifo ] && mkfifo $fifo
if ps -ao comm | grep -q mpv;
then echo loadfile "$@" append-play > $fifo
else mpv --input-file=$fifo "$@" &
fi
