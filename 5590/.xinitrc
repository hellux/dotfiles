sh ~/scripts/init_common.sh

# wallpaper
feh --bg-scale ~/.config/wallpaper/ss.png

# dwm statusbar
while true; do
    xsetroot -name "$(sh ~/scripts/5590/status.sh)"
	sleep 1s
done &

if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
    eval `dbus-launch --sh-syntax --exit-with-session`
fi
pipewire &
exec dwm
