
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
export EDITOR='nano'

# GPG encryption prompt
export GPG_TTY=`tty`
gpg-connect-agent updatestartuptty /bye >/dev/null

# GPG agent for ssh
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
fi

# Taskwarrior
export TASKRC=~/.config/taskwarrior/taskrc
export TASKDATA=~/.local/share/taskwarrior

# SRC
export RUST_SRC_PATH='/usr/src/rust/src'

# Paths
export GOPATH=$(echo ~/.go)

# XDG
#export XDG_DESKTOP_DIR="$HOME/"
#export XDG_DOCUMENTS_DIR="$HOME/documents/"
#export XDG_DOWNLOAD_DIR="$HOME/downloads/"
#export XDG_MUSIC_DIR="$HOME/music/"
#export XDG_PICTURES_DIR="$HOME/pictures/"
#export XDG_VIDEOS_DIR="$HOME/videos/"
#export XDG_CONFIG_HOME="$HOME/.config/"
#export XDG_DATA_HOME="$HOME/.local/share/"

# Other
DATA_DIR="$HOME/.local/share"
