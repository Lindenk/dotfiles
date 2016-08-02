function ch_list() {
    emulate -L zsh
    ls
}

chpwd_functions=(${chpwd_functions[@]} "ch_list")