#!/bin/sh
sh ~/scripts/init_common.sh
sh ~/scripts/monitor_desktop.sh

numlockx
sudo cpupower frequency-set -g performance
