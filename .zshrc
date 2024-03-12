#export PS1='%~ $ '
export PS1="%{$(tput setaf 2)%}%n%{$(tput setaf 2)%}@%{$(tput setaf 2)%}aumni:%{$(tput setaf 4)%}%~ %{$(tput sgr0)%}$ "

alias ls="ls -FAG"
alias tmux="tmux -u -2"

setopt inc_append_history
setopt append_history
setopt extended_history

PATH="$HOME/bin:$PATH"

source ~/.zshrc.private
