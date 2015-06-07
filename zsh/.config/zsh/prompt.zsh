# Prompt characters
RSEP=`echo "\ue0b0"`
LSEP=`echo "\ue0b2"`
PLUSMINUS="\u00b1"
BRANCH="\ue0a0"
MINUS="\u27a6"
CROSS=`echo "\u2718"`
LIGHTNING="\u26a1"
GEAR="\u2699"

# Truncate path to first letter of all dirs under the current one
function _prompt_path() {
  echo `sed -r 's/([^\/]?)[^\/]*\//\1\//g' <(echo ${PWD/#"$HOME"/"~"})`
}

# Git stuff
function _git_branch() {
    git name-rev --name-only --no-undefined --always HEAD 2> /dev/null
}
function _git_prompt() {
    local git_where="$(_git_branch)"
    if [ -n "$git_where" ]; then
        echo "%K{yellow}%F{black}$RSEP $BRANCH $git_where%F{yellow}%k$RSEP"
    else
        echo "%k%F{black}$RSEP"
    fi
}

PROMPT='%K{black}${SSH_TTY:+"%F{red}%n%f@%F{yellow}%m%f "}%F{cyan}$(_prompt_path)$(_git_prompt)%k%f '
RPS1="%(?..%F{red}$LSEP%F{black}%K{red}$CROSS %k%f)"