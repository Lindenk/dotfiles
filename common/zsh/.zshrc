# Source all .zsh files in the config folder

for f in $HOME/.config/zsh/**/*.zsh; do
  if [[ $(basename "$f") =~ "^[^_]" ]]; then
    source "$f"
  fi
done

source $HOME/scripts/zsh-syntax-highlighting.zsh

if which thefuck >> /dev/null; then eval $(thefuck --alias); fi
test -r /home/lindenk/.opam/opam-init/init.zsh && . /home/lindenk/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
which mcfly > /dev/null && source <(mcfly init zsh)
