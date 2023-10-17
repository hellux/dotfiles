#!/bin/sh
# Cycle through all audio outputs (eg. speakers, headset) of pulseaudio.
# usage: ./toggle_audio.sh

sinks="$(pacmd list-sinks | grep index:)"
sink_nums=$(echo "$sinks" | awk -F':' '$1 ~ /[*]? index/ {print $2}')
n_sinks=$(echo "$sinks" | wc -l)

current_index=$(echo "$sinks" | awk -F':' '$1 ~ /\* index/ {print NR}')

next_index=$((current_index+1))
if [ "$next_index" -gt "$n_sinks" ]; then
    next_index="1"
fi
next_sink=$(echo "$sink_nums" | awk 'NR == '$next_index' {print $0}')

pacmd set-default-sink "$next_sink"

inputs=$(pacmd list-sink-inputs | awk '$1 == "index:" {print $2}')
for input in $inputs; do
    pacmd move-sink-input "$input" "$next_sink"
done
