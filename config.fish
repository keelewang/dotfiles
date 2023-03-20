if status is-interactive
    # Commands to run in interactive sessions can go here
end

# set proxy
set -gx http_proxy localhost:7891
set -gx https_proxy localhost:7891

# tweak fish_escape_delay_ms
set -g fish_escape_delay_ms 300

# init conda
if test -f $HOME/miniconda3/bin/conda
    eval $HOME/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
