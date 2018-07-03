#!/usr/bin/env python3

import os, sys, yaml

VIM_BINDINGS_COMMAND = {
  # Mode switching
  "append":       'a',
  "append_line":  'A',
  "insert":       'i',
  "insert_below": 'o',
  "insert_above": 'O',
  "insert_begin": 'I',
  "substitute":   's',
  "substitute_line":'S',

  "visual_mode":  'v',

  "ex_mode":      'Q',

  "replace_mode": 'R',
  
  # Movement
  "left":       'h',
  "right":      'l',
  "up":         'k',
  "down":       'j',

  "first_line": 'H',
  "middle_line":'M',
  "last_line":  'L',

  "word_next":  'w',
  "word_next_more": 'W',
  "word_back":  'b', 
  "word_back_more": 'B',
  "word_end":   'e',
  "word_end_more": 'E',

  "line_begin": '0',
  "line_end"  : '$',
  "goto_line":  'G',

  "sentence_next":  '(',
  "sentence_prev":  ')',

  "paragraph_next": '{',
  "paragraph_prev": '}',

  "codeblock_next": '[',
  "codeblock_prev": ']',

  "bracket_next": '%',
  "non_whitespace_next": '^',
  "non_whitespace_numeric_next": '_',
  "non_whitespace_next_line": "+",
  "non_whitespace_prev_line": '-',

  "find_char":  'f',  # Char
  "find_char_rev": 'F', # Char
  "find_char_before": 't', # Char
  "find_char_before_rev": 'T', # Char
  "find_repeat":  ';',
  "find_repeat_rev":  ',',

  "search":     '/',
  "search_rev": '?',
  "search_next":'n',
  "search_next_rev": 'N',

  "mark":       'm',  # Char
  "mark_goto":  "`",  # Char
  "mark_goto_line":  "'",  # Char

  "zoom":       'z',  # CR or other stuff

  # Modification
  "change":           'c', # Motion
  "change_line":      'C',
  "delete":           'd', # Motion
  "delete_line":      'D',
  "delete_char":      'x',
  "delete_char_rev":  'X',
  "flip_case_char":   '~',

  "replace_char": 'r', # Char

  "join_line":    'J',

  "copy":   'y',  # Motion
  "copy_line": 'Y',
  "paste":  'p',

  "undo": 'u',
  "undo_line": 'U',

  "repeat": '.',

  "indent": '>',
  "unindent": '<',

  # Other
  "vi_eval":  '@',
  "command":  ':',

  "buffer_access": '"',


  # Stuff to unbind always
  "unbind_one": '<Space>',
  "unbind_two": '|',
  "quicksave_start": 'Z',
  "repeat_ex": '&',
}

VIM_COMMANDS = {
  # Tabs
  "new_tab":          ':tabnew<ENTER>',
  
  # Window managment
  "split_horizontal":   ':split<Enter>',
  "split_vertical":     ':vs<Enter>',
}

def main():
  with open(sys.argv[1]) as f:
    config = yaml.load(f)

  used_vim_keys = set(VIM_BINDINGS_COMMAND.values())
  vim_config_lines = []

  vim_commands = {**VIM_BINDINGS_COMMAND, **VIM_COMMANDS}

  for keybind in config:
    key = keybind["key"]
    vim_bind_cmd = "nnoremap %s %s" % (key, vim_commands[keybind["command"]])
    
    vim_config_lines.append(vim_bind_cmd)
    
    if keybind["key"] in used_vim_keys:
      used_vim_keys.remove(key)

  for key in used_vim_keys:
    if key == '|':
      key = '\|'
    vim_bind_cmd = "nnoremap %s %s" % (key, '<nop>')
    vim_config_lines.append(vim_bind_cmd)

  plugins = """
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  endif                                                                                                                                 
  call plug#begin('~/.config/nvim/plugged')
  Plug 'junegunn/vim-easy-align'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'terryma/vim-multiple-cursors'
  call plug#end()

  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1

  let g:multi_cursor_use_default_mapping=0
  let g:multi_cursor_quit_key = '<Esc>'
  """

  print('\n'.join(vim_config_lines) + plugins)
    

if __name__ == '__main__':
  main()
