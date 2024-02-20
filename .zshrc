export PS1='%~ $ '

setopt inc_append_history
setopt append_history
setopt extended_history

alias vi="vim -N -u ~/.vimrc.minimal"
alias vim="vim -N -u ~/.vimrc.full"

PATH="$HOME/bin:$PATH"

source ~/.zshrc.private
