typeset -U path
typeset -U BSPWM_DIR
typeset -U BROWSER
typeset -U CACA_GEOMETRY

for f in ~/.config/zsh/paths/*; do
 p=`cat $f`
 PATH="$p:$PATH"
done

BSPWM_DIR=(~/.config/bspwm)
BROWSER=(chromium)
CACA_GEOMETRY=250x66
TERM=xterm
