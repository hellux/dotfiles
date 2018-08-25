source ~/.zshenv.local

export EDITOR=vim
export VISUAL=vim

export YTR_PLAYER="$HOME/scripts/play-video.sh"
export ISV_WEEK_FMT="Неделя %V"
export ISV_TIME_FMT="%H"

# shortcut
alias ct='xdg-open $(pwd) &' # copy terminal
alias d='dirs -pv'

# substitute
alias maxima='rlwrap -pyellow maxima'
