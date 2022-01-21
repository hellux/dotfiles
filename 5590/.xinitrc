sh ~/scripts/init_common.sh

# wallpaper
feh --bg-scale ~/.config/wallpaper/ss.png

# dwm statusbar
while true; do
    xsetroot -name "$(sh ~/scripts/5590/status.sh)"
	sleep 1s
done &

dunst &
exec dwm
