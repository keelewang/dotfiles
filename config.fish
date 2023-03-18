if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx http_proxy localhost:7890
    set -gx https_proxy localhost:7890
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/haoyu/miniconda3/bin/conda
    eval /home/haoyu/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

