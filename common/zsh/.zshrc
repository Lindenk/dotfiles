# Source all .zsh files in the config folder

for f in $HOME/.config/zsh/*.zsh; do
  source "$f"
done

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#eval $(thefuck --alias)