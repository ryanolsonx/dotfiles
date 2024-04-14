vim.cmd([[
call plug#begin()
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'sheerun/vim-polyglot'
Plug 'jbranchaud/vim-bdubs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fireplace'
call plug#end()
]])

vim.g.gitgutter_sign_added = '┃'
vim.g.gitgutter_sign_modified = '┃'
vim.g.gitgutter_sign_modified_removed = '┃'
vim.g.gitgutter_sign_removed = '┃'
vim.g.user_emmet_leader_key = '<C-j>'
