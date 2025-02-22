export PATH=$PATH:/home/duri/.local/bin
PROMPT='%~ %# '
unsetopt BEEP


alias nv="nvim"
alias gd="git add ."
alias gc="git commit"
alias gp="git push"


[ -f "/home/duri/.ghcup/env" ] && . "/home/duri/.ghcup/env" # ghcup-env