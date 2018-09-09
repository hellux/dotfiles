font="latarcyrheb-sun32.psfu.gz"
dir1="/usr/share/consolefonts"
dir2="/usr/share/kbd/consolefonts"

if [ -r "$dir1/$font" ]; then
    setfont "$dir1/$font"
elif [ -r "$dir2/$font" ]; then
    setfont "$dir2/$font"
else
    exit 1
fi
