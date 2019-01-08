#!/bin/sh

PATH="$PATH:/home/noah/.local/bin"

if [ -f ~/.Xresources ]; then
    xrdb -merge -I$HOME ~/.Xresources
fi

mkdir -p /tmp/xdg /tmp/download

setxkbmap se -variant dvorak -option caps:escape

# merge common and local i3 config
cat ~/.config/i3/config.common \
    ~/.config/i3/config.local > ~/.config/i3/config
