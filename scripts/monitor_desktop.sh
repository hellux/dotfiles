#!/bin/sh
xrandr --auto
xrandr --output DVI-D-0 --mode 1920x1080 --rate 120 --primary
xrandr --output HDMI-A-1 --mode 1920x1080 --rate 60 --left-of DVI-D-0
xrandr --output HDMI-A-0 --mode 1920x1080 --rate 60 --right-of DVI-D-0
