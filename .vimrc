filetype plugin indent on
syntax on
color desert
set number
set laststatus=2
set ruler
set backspace=2
set hidden
set autoindent
set softtabstop=2
set shiftwidth=2
set expandtab
set directory=/tmp
set backupdir=/tmp
set path+=app/**,config/**,apps/**,libs/**,.circleci/**,.github/**,src/**
set grepprg=git\ grep\ -n
nn <space> :e %:h<cr>
nn ]b :bnext<cr>
nn [b :bprev<cr>
nn ]q :cnext<cr>
nn [q :cprev<cr>
