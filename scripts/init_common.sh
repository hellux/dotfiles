#!/bin/sh

if [ -f ~/.Xresources ]; then
    xrdb -merge -I$HOME ~/.Xresources
fi

mkdir -p /tmp/xdg /tmp/download
if [ ! -d ~/tmp ]; then
    ln -s /tmp/download ~/tmp
fi

setxkbmap se -variant dvorak -option caps:escape
