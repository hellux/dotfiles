[ -r ~/.zshenv.local ] && source ~/.zshenv.local

export EDITOR=vim
export VISUAL=vim

export YTR_PLAYER="$HOME/scripts/play-video.sh -q"
export ISV_WEEK_FMT="Неделя %V"
export ISV_FREE_STR="Свободное"
export WFV_LON="15.6"
export WFV_LAT="58.4"

# shortcut
alias ct='xdg-open "$(pwd)" &' # copy terminal
alias d='dirs -pv'
alias la=exa -la --git
alias ll=exa -l

# substitute
alias maxima='rlwrap -pyellow maxima'
