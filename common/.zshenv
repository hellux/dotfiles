[ -r ~/.zshenv.local ] && source ~/.zshenv.local

export PATH="$HOME/scripts:$PATH"

export HISTSIZE=99999999
export SAVEHIST=99999999

export EDITOR=vim
export VISUAL=vim

export YTR_PLAYER="$HOME/scripts/play-video.sh -q"
export WFV_LON="15.6"
export WFV_LAT="58.4"

# shortcut
alias d='dirs -pv'

# rlwrap
alias maxima='rlwrap -pyellow maxima'
alias sbcl='rlwrap -pblue sbcl'

# git
alias gac='git add -u && git rebase --continue'
alias gc='git commit'
alias gco='git checkout'
alias gcp='git checkout -p'
alias gd='git diff'
alias gds='git diff --stat'
alias gl='git log'
alias glo='git log --oneline --graph'
alias glp='git log -p'
alias gls='git log --stat'
alias gp='git push'
alias gr='git rebase'
