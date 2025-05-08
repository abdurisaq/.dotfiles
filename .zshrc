export PATH=$PATH:/home/duri/.local/bin
PROMPT='%~ %# '
unsetopt BEEP


alias nv="nvim"
alias gd="git add ."
alias gc="git commit"
alias gp="git push"


[ -f "/home/duri/.ghcup/env" ] && . "/home/duri/.ghcup/env" # ghcup-env
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(direnv hook zsh)"

# pnpm
export PNPM_HOME="/home/duri/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH="$PATH:$(pnpm bin -g)"

export PNPM_HOME="/home/duri/.local/share/pnpm"
export PATH="/home/duri/.local/share/pnpm:/home/duri/.local/share/pnpm:/home/duri/.cabal/bin:/home/duri/.ghcup/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/duri/.local/bin"
export PNPM_HOME="/home/duri/.local/share/pnpm"
export PATH="/home/duri/.local/share/pnpm:/home/duri/.local/share/pnpm:/home/duri/.nvm/versions/node/v22.15.0/bin:/home/duri/.cabal/bin:/home/duri/.ghcup/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/duri/.local/bin"
export PNPM_HOME="/home/duri/.local/share/pnpm"
export PATH="/home/duri/.local/share/pnpm:/home/duri/.local/share/pnpm:/home/duri/.local/share/pnpm:/home/duri/.local/share/pnpm:/home/duri/.nvm/versions/node/v22.15.0/bin:/home/duri/.cabal/bin:/home/duri/.ghcup/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/duri/.local/bin"
