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

" Basic settings
let $BAT_THEME = 'Dracula'
set termguicolors
let g:dracula_italic = 1
color dracula
" set background=light
" color papercolor
set number
set autoindent
set shiftwidth=2
set softtabstop=2
set expandtab
set signcolumn=yes
set updatetime=300
set hidden
set encoding=utf-8

" Plugin config
let g:airline_powerline_fonts = 1
let g:airline_section_y = ''
let g:airline_section_z = '%l:%c'
let g:airline_skip_empty_sections = 1
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
let g:user_emmet_leader_key='<C-j>'

" Keybindings
let mapleader = ' '
nn <leader>n :NERDTreeToggle<cr>
nn <leader>m :NERDTreeFind<cr>
nn <leader>f :Rg<cr>
nn <leader>p :GFiles<cr>
nn <leader>b :Buffers<cr>
nn <leader>s :!npx stylelint %<cr>
nn <leader>g :G<cr>
nn <leader>gp :Git push -f<cr>
nn <leader>gn :call GitPushNew()<cr>
nn <leader>t :call RunTestOrLast()<cr>

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

fu! GitPushNew()
  let branch = trim(system("git rev-parse --abbrev-ref HEAD"))
  exec ":Git push -u origin " . branch
endfu

fu! RunTestOrLast()
  let in_jest_file = match(expand("%"), '\.test.js$') != -1 || match(expand("%"), '\.spec.js$') != -1
  let in_cypress_file = match(expand("%"), '\.cy.jsx$') != -1

  if in_jest_file
    let t:last_test_file=@%
  elseif in_cypress_file
    let t:last_test_file=@%
  elseif !exists("t:last_test_file")
    return
  end

  :w
  :silent !clear
  let cypress = match(t:last_test_file, '\.cy.jsx$') != -1
  if cypress
    if has("nvim")
      exec ":split term://bin/cy " . t:last_test_file
    else
      exec ":terminal bin/cy " . t:last_test_file
    end
  else
    if has("nvim")
      exec ":split term://npx jest " . t:last_test_file
    else
      exec ":terminal npx jest " . t:last_test_file
    end
  end
  :norm G
endfu

" Autocmds
augroup FileTypeCommands
  au!
  " Get out things using q
  autocmd FileType help nnoremap <buffer> q :q<cr>
  autocmd FileType fugitive nnoremap <buffer> q :q<cr>
  if has("nvim")
    autocmd TermOpen * nnoremap <buffer> q :bd!<cr>
  else
    autocmd TerminalOpen * nnoremap <buffer> q :bd!<cr>
  end

  " Git
  autocmd FileType gitcommit setlocal spell
  autocmd FileType gitcommit setlocal textwidth=72
augroup END

