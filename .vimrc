call pathogen#helptags()
call pathogen#infect()
set wildignore=*.swp,*.bak,*.pyc,*.class
set backspace=2 " make backspace work like most other apps
set visualbell           " don't beep
set noerrorbells         " don't beep
set number " show error lines
set pastetoggle=<F2>
set encoding=utf-8
scriptencoding utf-8
" shortcut to insert python break point at the line above cursor
let @p='Oimport ipdb;ipdb.set_trace()^['
" shortcut to fixup last commit in git rebase
let @f='G?picknxxxrf:'

" indenting settings
" https://wiki.python.org/moin/Vim
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
filetype indent on
" show tabs
set list
set wildmode=longest,list
set wildignore=*.o,*.pyc,*.so,*.swp
set wildignore+=*/.git/*,*/.svn/*,*/.hg/*

" Set following to show "<CAPS>" in the status line when "Caps Lock" is on.
let b:keymap_name = "CAPS"
" Show b:keymap_name in status line.
:set statusline^=%k

" toggle overwriting when deleting
function! ToggleSideEffects()
    if mapcheck("dd", "n") == ""
        noremap dd "_dd
        noremap D "_D
        noremap d "_d
        noremap X "_X
        noremap x "_x
        echo 'side effects off'
    else
        unmap dd
        unmap D
        unmap d
        unmap X
        unmap x
        echo 'side effects on'
    endif
endfunction
nnoremap ,, :call ToggleSideEffects()<CR>
autocmd VimEnter * :call ToggleSideEffects()

" YouCompleteMe options
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_key_list_select_completion = ['<TAB>','<Down>','<Enter>']
" filetype options
filetype plugin on

" Capslock disabled in normal mode
"  Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor
" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0
noremap  <F5> :let &l:imi = !&l:imi<CR>
inoremap <F5> <C-O>:let &l:imi = !&l:imi<CR>
cnoremap <F5> <C-^>

" SnipMate
"Plugin 'ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Plugin 'vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsExpandTrigger="<F3>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
