# Add all paths in config folder to PATH
_new_path=()
for f in $HOME/.config/zsh/paths/*; do
    p=`cat $f`
    _new_path+=$p
done
path=($path ${_new_path:|path})