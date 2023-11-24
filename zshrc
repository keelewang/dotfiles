# p10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zsh
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
         colored-man-pages
         nvm
         sudo
         z
         zsh-autosuggestions
         zsh-syntax-highlighting
    )

# brew shell completion
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8

export HOMEBREW_NO_INSTALL_CLEANUP=true

# export PATH=$HOME/bin:/usr/local/bin:$PATH

# User bin
export PATH="$HOME/bin:$PATH"

# Maven
export PATH="$HOME/Maven/bin:$PATH"

alias python="python3"
alias pn="pnpm"


# GHCup
[ -f "/Users/haoyu/.ghcup/env" ] && source "/Users/haoyu/.ghcup/env" # ghcup-env


# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# PROMPT
PROMPT='%B%F{magenta}%c%B%F{green}${vcs_info_msg_0_}%B%F{magenta} %{$reset_color%}> '


# conda
__conda_setup="$('/Users/kele/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/kele/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/kele/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/kele/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup


#shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# pnpm
export PNPM_HOME="/Users/kele/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
