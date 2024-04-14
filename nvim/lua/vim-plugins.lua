vim.cmd([[
call plug#begin()
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'jbranchaud/vim-bdubs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fireplace'
call plug#end()
]])

vim.g.airline_powerline_fonts = 1
vim.g.airline_section_y = ''
vim.g.airline_section_z = '%l:%c'
vim.g.airline_skip_empty_sections = 1
vim.g.gitgutter_sign_added = '┃'
vim.g.gitgutter_sign_modified = '┃'
vim.g.gitgutter_sign_modified_removed = '┃'
vim.g.gitgutter_sign_removed = '┃'
vim.g.user_emmet_leader_key = '<C-j>'
