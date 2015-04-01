call pathogen#helptags()
call pathogen#infect()
set backspace=2 " make backspace work like most other apps
set visualbell           " don't beep
set noerrorbells         " don't beep
set number " show error lines
set pastetoggle=<F2>
set encoding=utf-8
scriptencoding utf-8

" indenting settings
" https://wiki.python.org/moin/Vim
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
 filetype indent on
" show tabs
"set list
set wildmode=longest,list
set wildignore=*.o,*.pyc,*.so,*.swp,*.class
set wildignore+=*/.git/*,*/.svn/*,*/.hg/*

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
