[ -r ~/.zshenv.local ] && source ~/.zshenv.local

export EDITOR=vim
export VISUAL=vim

export YTR_PLAYER="$HOME/scripts/play-video.sh -q"
export ISV_WEEK_FMT="Неделя %V"
export ISV_FREE_STR="Свободное время"
export WFV_LON="15.6"
export WFV_LAT="58.4"

# jtsyken
alias шр=cd
alias зж=ls
alias ью=mv
alias шк=cp
alias зф=la

# shortcut
alias ct='alacritty --working-directory "$(pwd)" &' # copy terminal
alias d='dirs -pv'

# rlwrap
alias maxima='rlwrap -pyellow maxima'
alias sbcl='rlwrap -pblue sbcl'

# java options
export JAVA_FONTS=/usr/share/fonts/TTF
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dsun.java2d.opengl=true -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Djdk.gtk.version=3'
