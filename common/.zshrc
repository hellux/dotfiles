set -o vi

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'l:|=* r:|=*'

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

command fortune -s science wisdom computers people \
    | fmt -80 -s \
        | $(shuf -n 1 -e cowsay cowthink) \
         -$(shuf -n 1 -e b d g p s t w y) -f \
          $(shuf -n 1 -e $(cowsay -l | tail -n +2)) -n
