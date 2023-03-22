if status is-interactive
    # Commands to run in interactive sessions can go here
end

# set proxy
set -gx http_proxy localhost:7891
set -gx https_proxy localhost:7891

# path
set -gx JAVA_HOME /usr/java/jdk1.8.0_361-amd64

# tweak fish_escape_delay_ms
set -g fish_escape_delay_ms 300
