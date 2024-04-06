call plug#begin()
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
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
augroup END
