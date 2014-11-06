set encoding=utf-8
scriptencoding utf-8
" shortcut to insert python break point at the line above cursor
let @p='Oimport ipdb;ipdb.set_trace()^['
" indenting settings
" https://wiki.python.org/moin/Vim
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
filetype indent on
" show line endings (to detect trailing whitespace)
set list
