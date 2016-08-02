# Dotfiles #

These are my dotfiles. They use [dotbot](https://github.com/anishathalye/dotbot) to for installation and maintenance with serveral configurations available depending on what machine they are used on. Consult the table below for a better explaination of each profile.

If you happen to be looking for my old dotfiles, they are under the branch [old_dotfiles](https://github.com/Lindenk/dotfiles/tree/old_dotfiles).

```
# Top level dotfiles #
common.conf.yaml

# Second level dotfiles #
desktop.conf.yaml   ->  common.conf.yaml
server.conf.yaml    ->  common.conf.yaml

# Third level dotfiles #
linkroot.conf.yaml  ->  desktop.conf.yaml
nagato.conf.yaml    ->  server.conf.yaml
```

If you are by change not me, then the desktop and server configurations are probably most useful to you. Probably. Things might get kind of fragmented until I organize them a bit better (mostly the bspwm/sxhkd stuff).

# Installation #
Run `./install` and you should be all set. You'll need `git` and `python` installed and some times have the potential of breaking without their needed deps, but I haven't fully rooted through everything to pull them out yet.
