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

PROMPT='%K{black}${SSH_TTY:+"%F{red}%n%f@%F{yellow}%m%f "}%F{cyan}$(_prompt_path)%k%F{black}$RSEP%f'
RPS1="%(?..%F{red}$LSEP%F{black}%K{red}$CROSS %k%f)"