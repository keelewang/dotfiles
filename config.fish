if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx http_proxy localhost:7890
    set -gx https_proxy localhost:7890
end
