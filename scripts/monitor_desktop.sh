#!/bin/sh
primary="DisplayPort-0"
xrandr --auto
xrandr --output "$primary" --mode 3840x2160 --rate 144 --primary
xrandr --output HDMI-A-0 --mode 2560x2880 --rate 60 --left-of "$primary"
xrandr --output DisplayPort-1 --mode 1920x1080 --rate 60 --right-of "$primary"
