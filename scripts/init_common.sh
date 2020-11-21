#!/bin/sh

if [ -f ~/.Xresources ]; then
    xrdb -merge -I$HOME ~/.Xresources
fi

mkdir -p /tmp/xdg /tmp/download

setxkbmap se -variant dvorak -option caps:escape
