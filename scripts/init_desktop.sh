#!/bin/sh
sh ~/scripts/init_common.sh
sh ~/scripts/monitor_desktop.sh

setxkbmap se,ru -variant dvorak, -option caps:escape,grp:alts_toggle
sudo cpupower frequency-set -g performance
numlockx
redshift &
