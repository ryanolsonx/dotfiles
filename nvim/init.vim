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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
call plug#end()

" Basic settings
let g:dracula_italic = 1
color dracula
set number
set autoindent
set shiftwidth=2
set softtabstop=2
set expandtab
set signcolumn=yes

" Plugin config
let g:ale_set_highlights = 0
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1
" TODO: get stylelint working
let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'javascriptreact': ['prettier', 'eslint']}
let g:ale_linters = {'javascript': ['eslint', 'stylelint'], 'javascriptreact': ['eslint', 'stylelint']}

" Keybindings
let mapleader = ' '
nn <leader>n :NERDTreeToggle<cr>
nn <leader>f :GFiles<cr>
nn <leader>p :Files<cr>
nn <leader>b :Buffers<cr>
nn <leader>s :!npx stylelint %<cr>

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
