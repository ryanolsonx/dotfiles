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
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}
Plug 'airblade/vim-gitgutter'
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
set updatetime=300
set hidden
set encoding=utf-8
set clipboard+=unnamedplus

" Plugin config
let g:airline_powerline_fonts = 1
let g:ale_set_highlights = 0
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1
" TODO: get stylelint working
let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'javascriptreact': ['prettier', 'eslint']}
let g:ale_linters = {'javascript': ['eslint', 'stylelint'], 'javascriptreact': ['eslint', 'stylelint']}
let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_modified_removed = '┃'
let g:gitgutter_sign_removed = '┃'

" Keybindings
let mapleader = ' '
nn <leader>n :NERDTreeToggle<cr>
nn <leader>m :NERDTreeFind<cr>
nn <leader>f :GFiles<cr>
nn <leader>p :Files<cr>
nn <leader>b :Buffers<cr>
nn <leader>s :!npx stylelint %<cr>
nn <leader>g :G<cr>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
inoremap <silent><expr> <c-space> coc#refresh()
fu! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfu
nnoremap <silent> K :call ShowDocumentation()<CR>

fu! ToggleBetweenTestAndSource()
  let in_cypress_file = match(expand("%"), '\.cy.jsx$') != -1
  let in_jest_file = match(expand("%"), '\.test.js$') != -1
  let in_jsx_file = match(expand("%"), '\.jsx$') != -1

  if in_cypress_file
    :silent e %:r:r.jsx
  elseif in_jest_file
    :silent e %:r:r.js
  elseif in_jsx_file
    :silent! e %<.cy.jsx
  else
    :silent! e %<.test.js
  endif
endfu
nn <silent> sj :call ToggleBetweenTestAndSource()<cr>

function! RunJestTest()
  let in_jest_file = match(expand("%"), '\.test.js$') != -1
  if in_jest_file
    let t:last_test_file=@%
  elseif !exists("t:last_test_file")
    return
  end

  :w
  :silent !clear
  exec ":split term://npx jest " . t:last_test_file
  :norm G
endfunction
nn \ :call RunJestTest()<cr>

" Autocmds
augroup FileTypeCommands
  au!
  " Get out of help using q
  autocmd FileType help nnoremap <buffer> q :q<cr>
  autocmd FileType fugitive nnoremap <buffer> q :q<cr>

  " Git
  autocmd FileType gitcommit setlocal spell
  autocmd FileType gitcommit setlocal textwidth=72

  " q to kill terminal (useful for test tabs)
  autocmd TermOpen * nnoremap <buffer> q :bd!<cr>
augroup END
