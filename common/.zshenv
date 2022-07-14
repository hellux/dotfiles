[ -r ~/.zshenv.local ] && source ~/.zshenv.local

export XKB_DEFAULT_LAYOUT="se"
export XKB_DEFAULT_VARIANT="dvorak"
export XKB_DEFAULT_OPTIONS="caps:escape"

export PATH="$HOME/scripts:$PATH"

export HISTSIZE=99999999
export SAVEHIST=99999999

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
