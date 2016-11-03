
export CACA_GEOMETRY=250x66

# Setup terminal, and turn on colors
export TERM=xterm-256color
export CLICOLOR=1

# Enable color in grep
#export GREP_OPTIONS='--color=auto'
#export GREP_COLOR='3;33'

# Editor
export LESS='--ignore-case --raw-control-chars'
export PAGER='less'

# GPG encryption prompt
export GPG_TTY=`tty`

# Taskwarrior
export TASKRC=~/.config/taskwarrior/taskrc
export TASKDATA=~/.local/share/taskwarrior

# SRC
export RUST_SRC_PATH='/usr/share/rust/src'

# Paths
export GOPATH=$(echo ~/.go)

