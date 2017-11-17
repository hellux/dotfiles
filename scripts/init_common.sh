[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

setxkbmap se -variant dvorak -option caps:escape

# remove files older than a day in Downloads
find ~/Downloads -mtime +1 -exec rm -rf {} \;
