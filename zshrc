export PATH=$PATH:$HOME/go/bin

export JAVA_HOME=/usr/lib/jvm/jdk-17-oracle-x64
export PATH=$PATH:$JAVA_HOME/bin

export M2_home=/opt/maven
export PATH=$PATH:$M2_home/bin

export PATH=$PATH:/usr/local/texlive/2022/bin/x86_64-linux

export PATH=$PATH:$HOME/.local/bin

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

bindkey '^F' autosuggest-accept 
