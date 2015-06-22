extract () {
   if [ -f $1 ] ; then
       case $1 in
        *.tar.bz2)      tar xvjf $1 && cd $(basename "$1" .tar.bz2) ;;
        *.tar.gz)       tar xvzf $1 && cd $(basename "$1" .tar.gz) ;;
        *.tar.xz)       tar Jxvf $1 && cd $(basename "$1" .tar.xz) ;;
        *.bz2)          bunzip2 $1 && cd $(basename "$1" /bz2) ;;
        *.rar)          unrar x $1 && cd $(basename "$1" .rar) ;;
        *.gz)           gunzip $1 && cd $(basename "$1" .gz) ;;
        *.xz)           unxz $1 && cd $(basename "$1" .xz) ;;
        *.tar)          tar xvf $1 && cd $(basename "$1" .tar) ;;
        *.tbz2)         tar xvjf $1 && cd $(basename "$1" .tbz2) ;;
        *.tgz)          tar xvzf $1 && cd $(basename "$1" .tgz) ;;
        *.zip)          unzip $1 && cd $(basename "$1" .zip) ;;
        *.Z)            uncompress $1 && cd $(basename "$1" .Z) ;;
        *.7z)           7z x $1 && cd $(basename "$1" .7z) ;;
        *)              echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

<<<<<<< HEAD
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
=======
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
>>>>>>> d77775a3cedb58ada6b138a0f4e27cc64ff89575
