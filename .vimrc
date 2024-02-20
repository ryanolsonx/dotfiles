if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'tpope/vim-fugitive'
Plug 'ku1ik/vim-monokai'
call plug#end()

syn on
color monokai
set updatetime=100
set signcolumn=yes
set ai sts=2 sw=2 et
set nu
set laststatus=2
set dir=/tmp bdir=/tmp
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
nn <c-p> :GFiles<cr>
nn <c-f> :Rg<cr>
nn <c-t> :Tags<cr>
hi SignColumn ctermbg=235
nn <space> :e %:h<cr>
