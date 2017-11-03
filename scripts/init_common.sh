export XKB_DEFAULT_LAYOUT=se
export XKB_DEFAULT_VARIANT=dvorak
export XKB_DEFAULT_OPTIONS=caps:escape
setxkbmap se -variant dvorak -option caps:escape

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
