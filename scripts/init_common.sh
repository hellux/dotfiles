[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

setxkbmap se -variant dvorak -option caps:escape

# remove files older than a day in Downloads
find ~/Downloads -mtime +1 -exec rm -rf {} 2> /dev/null \

# merge common and local i3 config
cat ~/.config/i3/config.common \
    ~/.config/i3/config.local > ~/.config/i3/config
