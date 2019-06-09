#!/bin/sh
# font icons from font awesome 4.7.0

WLAN="wlp2s0"
ETH="enp0s31f6"
THRM_DEV="coretemp-isa-0000"
THRM_DEV_SENS="1"

# codes for colors defined in dwm config header
NRM0='\01'
SEL0='\02'
NRM1='\03'
URG0='\04'
URG1='\05'

NETE="$NRM0 " # ethernet
NETW="$NRM0 " # wireless
NETOFF="${URG1} " # disconnected
BAT0="$URG1 " # 0-15
BAT1="$URG0 " # 16-35
BAT2="$NRM1 " # 36-65
BAT3="$NRM1 " # 66-85
BAT4="$NRM1 " # 86-100
BATAC="$NRM1 " # ac
VOLOFF="$NRM0 " # mute
VOL0="$NRM0 " # 1-30
VOL1="$NRM0 " # 31-100
TMP0="$NRM1 " # -35
TMP1="$NRM1 " # 36-45
TMP2="$NRM1 " # 45-55
TMP3="$URG0 " # 56-65
TMP4="$URG1 " # 66-

NET_WLAN=$(ifconfig $WLAN | grep inet | xargs | cut -d' ' -f2)
NET_ETH=$(ifconfig $ETH | grep inet | xargs | cut -d' ' -f2)
BAT=$(acpi | awk -v RS="%" -v FS=" " '{print $(NF);exit}')
VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/' | rev \
    | cut -c 2- | rev)
TMP=$(sensors -u $THRM_DEV | \
    sed -n 's/\.000//;s/  temp'$THRM_DEV_SENS'_input: //p')
DAT=$(date +"%a %d %b %Y")
TIM=$(date +"%H:%M")

if acpi | grep -qE "Charging|Full"; then BATPRE="$BATAC"
elif [ "85" -lt "$BAT" ]; then BATPRE="$BAT4"
elif [ "65" -lt "$BAT" ]; then BATPRE="$BAT3"
elif [ "35" -lt "$BAT" ]; then BATPRE="$BAT2"
elif [ "15" -lt "$BAT" ]; then BATPRE="$BAT1"
else                           BATPRE="$BAT0"
fi

if   [ "65" -lt "$TMP" ]; then TMPPRE="$TMP4"
elif [ "55" -lt "$TMP" ]; then TMPPRE="$TMP3"
elif [ "45" -lt "$TMP" ]; then TMPPRE="$TMP2"
elif [ "35" -lt "$TMP" ]; then TMPPRE="$TMP1"
else                           TMPPRE="$TMP0"
fi

if amixer get Master | tail -1 | grep -q "off"; then
    VOLPRE="$VOLOFF"
elif [ "30" -lt "$VOL" ]; then
    VOLPRE="$VOL1"
else
    VOLPRE="$VOL0"
fi

if [ -n "$NET_WLAN" ]; then
    NETSTR="$NETW$NET_WLAN"
elif [ -n "$NET_ETH" ]; then
    NETSTR="$NETE$NET_ETH"
else
    NETSTR="${NETOFF}disc"
fi

BATSTR="$BATPRE$BAT%%"
VOLSTR="$VOLPRE$VOL%%"
TMPSTR="$TMPPRE$TMP°C"
DATSTR="$NRM0 $DAT"
TIMSTR="$NRM1 $TIM"

printf "$NETSTR$BATSTR$VOLSTR$TMPSTR$DATSTR$TIMSTR"
