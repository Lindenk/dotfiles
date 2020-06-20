# Source all .zsh files in the config folder

for f in $HOME/.config/zsh/**/*.zsh; do
  if [[ $(basename "$f") =~ "^[^_]" ]]; then
    source "$f"
  fi
done

source $HOME/scripts/zsh-syntax-highlighting.zsh

if which thefuck >> /dev/null; then eval $(thefuck --alias); fi
if which opam >> /dev/null; then eval $(opam env); fi
