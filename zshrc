# export PATH=$HOME/bin:/usr/local/bin:$PATH

# User configuration
export JAVA_HOME=/usr/lib/jvm/jdk-17-oracle-x64
export M2_home=/opt/maven
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:$M2_home/bin

# User bin
export PATH=$PATH:$HOME/.local/bin
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="kolo"

plugins=(
    colored-man-pages
    colorize
    sudo
    tmux
    git
    dnf
    themes
    systemd
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# alias zshconfig="mate ~/.zshrc"

bindkey '^F' autosuggest-accept 
