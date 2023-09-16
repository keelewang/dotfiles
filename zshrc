export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="kolo"

plugins=(
         colored-man-pages
         git
         nvm
         sudo
         tmux
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

alias cat="ccat"

export LC_ALL=en_US.UTF-8

export HOMEBREW_NO_INSTALL_CLEANUP=true

# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Maven
export PATH="$HOME/Maven/bin:$PATH"

# llvm
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
# export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# Clash Proxy
# export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890

# GHCup
[ -f "/Users/haoyu/.ghcup/env" ] && source "/Users/haoyu/.ghcup/env" # ghcup-env

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# PROMPT
PROMPT='%B%F{magenta}%c%B%F{green}${vcs_info_msg_0_}%B%F{magenta} %{$reset_color%}> '
