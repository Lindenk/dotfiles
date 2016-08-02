extract () {
   if [ -f $1 ] ; then
       case $1 in
        *.tar.bz2)      tar xvjf $1 $( [[ -n $2 ]] && echo "-C $2");;
        *.tar.gz)       tar xvzf $1 $( [[ -n $2 ]] && echo "-C $2");;
        *.tar.xz)       tar Jxvf $1 $( [[ -n $2 ]] && echo "-C $2");;
        *.bz2)          bunzip2 $1 $2;;
        *.rar)          unrar x $1;;
        *.gz)           gunzip $1;;
        *.xz)           unxz $1;;
        *.tar)          tar xvf $1;;
        *.tbz2)         tar xvjf $1;;
        *.tgz)          tar xvzf $1;;
        *.zip)          unzip $1 $( [[ -n $2 ]] && echo "-d $2");;
        *.Z)            uncompress $1 ;;
        *.7z)           7z x $1;;
        *)              echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

#cd () {
#  if [ $# -eq 1 ]; then
#    if [ "$1" -eq "..." ]; then
#      _cd ..; _cd ..
#    elif [ "$1" -eq "...."]
#      _cd ..; _cd ..; _cd ..
#    fi
#  else
#    _cd $@
#  fi
#}

local _TEMP_HISTFILE_PATH="/tmp/""$USER""_zsh_history_tmp"
histoff () {
  HISTFILE=$_TEMP_HISTFILE_PATH
  touch $_TEMP_HISTFILE_PATH
  chmod 600 $_TEMP_HISTFILE_PATH
}

histon () {
  HISTFILE=$_HISTFILE
  rm $_TEMP_HISTFILE_PATH 2> /dev/null
}

_ls_or_exa () {
  if which exa >/dev/null; then
    exa $@
  else
    /bin/ls $@
  fi
}