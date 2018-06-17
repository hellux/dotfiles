#!/bin/sh

BAT0="\x05 " # 0-15
BAT1="\x04 " # 16-35
BAT2="\x03 " # 36-65
BAT3="\x03 " # 66-85
BAT4="\x03 " # 86-100
BATAC="\x03 " # ac
VOLOFF="\x01 " # mute
VOL0="\x01 " # 1-30
VOL1="\x01 " # 31-100
TMP0="\x03 " # -35
TMP1="\x03 " # 36-45
TMP2="\x03 " # 45-55
TMP3="\x04 " # 56-65
TMP4="\x05 " # 66-

BAT="$(acpi -b | awk '{ print $4 }' | rev | cut -c 3- | rev)"
VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/' | rev \
    | cut -c 2- | rev)
TMP="$(expr $(cat /sys/class/thermal/thermal_zone1/temp) / 1000)"
DAT=$(date +"%a %d %b %Y")
TIM=$(date +"%H:%M")

if acpi | grep -q "Charging"; then BATPRE="$BATAC"
elif [ "85" -lt "$BAT" ]; then BATPRE="$BAT4"
elif [ "65" -lt "$BAT" ]; then BATPRE="$BAT3"
elif [ "35" -lt "$BAT" ]; then BATPRE="$BAT2"
elif [ "15" -lt "$BAT" ]; then BATPRE="$BAT1"
else                           BATPRE="$BAT0"
fi

if amixer get Master | tail -1 | grep -q "off"; then
    VOLPRE="$VOLOFF"
elif [ "30" -lt "$VOL" ]; then
    VOLPRE="$VOL1"
else
    VOLPRE="$VOL0"
fi

if   [ "65" -lt "$TMP" ]; then TMPPRE="$TMP4"
elif [ "55" -lt "$TMP" ]; then TMPPRE="$TMP3"
elif [ "45" -lt "$TMP" ]; then TMPPRE="$TMP2"
elif [ "35" -lt "$TMP" ]; then TMPPRE="$TMP1"
else                           TMPPRE="$TMP0"
fi

BATSTR="$BATPRE$BAT%"
VOLSTR="$VOLPRE$VOL%"
TMPSTR="$TMPPRE$TMP°C"
DATSTR="\x01 $DAT"
TIMSTR="\x03 $TIM"

echo -e "$BATSTR$VOLSTR$TMPSTR$DATSTR$TIMSTR"
