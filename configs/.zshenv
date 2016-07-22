#configs
alias zshconf="vim ~/.zshrc"
alias zshenv="vim ~/.zshenv"
alias i3conf="vim ~/.config/i3/config"
alias i3stconf="vim ~/.config/i3status/config"

#prefixes
alias wifi="sudo netctl start"
alias br="xrandr --output eDP1 --brightness"
alias v="vim"
alias sv="sudo vim"

# substitutions/wrappers
alias maxima="rlwrap -p'0;33' maxima -q"
alias diff="colordiff"

# shortcuts
alias _="sudo"
alias sagen="sage -c 'noteboot(automatic_login=True)'"
alias wtf="dmesg | tail"
alias hmm="journalctl -xe"
alias pls="sudo !!"
alias ct="urxvt -cd $(pwd) &"
