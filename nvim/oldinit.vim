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

let $BAT_THEME = 'Dracula'

" Keybindings
let mapleader = ' '
nn <leader>n :NERDTreeToggle<cr>
nn <leader>m :NERDTreeFind<cr>
nn <leader>f :Rg<cr>
nn <leader>p :GFiles<cr>
nn <leader>b :Buffers<cr>
nn <leader>e :!npx eslint %<cr>
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

