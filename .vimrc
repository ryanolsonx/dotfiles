call plug#begin()
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'tomasiser/vim-code-dark'
Plug 'bakpakin/janet.vim'
call plug#end()

syntax on
color solarized
set backspace=2
set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2
set hidden
set laststatus=2
set path+=apps/*/src/**,libs/*/src/**
set dir=/tmp bdir=/tmp
nn <space> :e %:h<cr>
au BufNewFile,BufRead *.go :setlocal noexpandtab sts=0 sw=0
nn <c-p> :GFiles<cr>
nn <c-f> :Rg<cr>
nn , :set nu!<cr>
