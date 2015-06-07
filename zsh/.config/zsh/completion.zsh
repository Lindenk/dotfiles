
autoload -U compinit && compinit
zmodload -i zsh/complist

# Enable completion caching, use rehash to clear
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.cache/zsh/$HOST

# Fallback to built in ls colors
zstyle ':completion:*' list-colors ''
# Add simple colors to kill
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# Make the list prompt friendly
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
# Make the selection prompt friendly when there are a lot of choices
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'


# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ZAW styles
zstyle ':filter-select:highlight' matched fg=yellow,standout
zstyle ':filter-select' max-lines 10 # use 10 lines for filter-select
zstyle ':filter-select' max-lines -10 # use $LINES - 10 for filter-select
zstyle ':filter-select' rotate-list yes # enable rotation for filter-select
zstyle ':filter-select' case-insensitive yes # enable case-insensitive search
zstyle ':filter-select' extended-search no # see below