#!/bin/bash
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

mkdir -p /tmp/xdg /tmp/download

# merge common and local i3 config
cat ~/.config/i3/config.common \
    ~/.config/i3/config.local > ~/.config/i3/config
