#!/bin/sh
# Toggle between two audio outputs (eg. speakers, headset) pulseaudio.
# usage: ./toggle_audio.sh output1 output2

output1=$1
output2=$2

pacmd list-sinks | grep "\\* index: $output2" > /dev/null

if [ $? -eq 0 ]; then
    output=$output1
else
    output=$output2
fi

pacmd set-default-sink "$output"

for sink_input in $(pacmd list-sink-inputs | awk '$1 == "index:" {print $2}')
do
    pacmd move-sink-input "$sink_input" "$output"
done
