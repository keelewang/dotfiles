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

__conda_setup="$("$HOME/miniconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

