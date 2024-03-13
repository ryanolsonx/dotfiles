if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
"Plug 'pangloss/vim-javascript'
"Plug 'MaxMEllon/vim-jsx-pretty'
"Plug 'altercation/vim-colors-solarized'
call plug#end()

syntax on
set bg=light
color quiet
set number
set backspace=2
set hidden
set autoindent
set softtabstop=2 shiftwidth=2
set expandtab
set dir=/tmp bdir=/tmp
set signcolumn=yes
set laststatus=2
set ruler
set incsearch
set grepprg="git\ grep\ -n"

nn <c-p> :GFiles<cr>
nn <c-f> :Rg<cr>
nn <space> :e %:h<cr>

inoremap <silent><expr> <c-@> coc#refresh()
nnoremap <silent> K :call ShowDocumentation()<CR>

hi! link NonText Normal
hi! link SignColumn LineNr
hi Comment ctermfg=2 cterm=NONE
hi Normal ctermbg=NONE

" Show hover when provider exists, fallback to vim's builtin behavior.
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('definitionHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

packadd! matchit
