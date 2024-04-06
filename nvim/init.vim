call plug#begin()
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'jbranchaud/vim-bdubs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
call plug#end()

" Basic settings
color dracula
set number
set autoindent
set shiftwidth=2
set softtabstop=2
set expandtab

" Keybindings
let mapleader = ' '
nn <leader>n :NERDTreeToggle<cr>

" Autocmds
augroup FileTypeCommands
  au!
  " Get out of help using q
  autocmd FileType help nnoremap <buffer> q :q<cr>

  " Git
  autocmd FileType gitcommit setlocal spell
  autocmd FileType gitcommit setlocal textwidth=72

  " q to kill terminal (useful for test tabs)
  autocmd TermOpen * nnoremap <buffer> q :bd!<cr>
augroup END
