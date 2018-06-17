#!/bin/sh
# Toggle keyboard layout in Xorg.
# usage: ./toggle_layout.sh LAYOUT VARIANT ALT_LAYOUT ALT_VARIANT

layout=$1
variant=$2
alt_layout=$3
alt_variant=$4

query=$(setxkbmap -query)
_=$(echo "$query" | grep "$layout" &&
    echo "$query" | grep "$variant")
toggle=$?

if [ $toggle -eq 0 ]; then
    layout=$alt_layout
    variant=$alt_variant
fi

setxkbmap -verbose 0 "$layout" -variant "$variant"

exit 0
