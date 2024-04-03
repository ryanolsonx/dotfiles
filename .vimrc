syntax on
color desert
set number
set laststatus=2
set backspace=2
set hidden
set autoindent
set softtabstop=2
set shiftwidth=2
set expandtab
set directory=/tmp
set backupdir=/tmp
set path+=app/**,config/**,apps/**,libs/**,.circleci/**,.github/**
nn <space> :e %:h<cr>
set grepprg=git\ grep\ -n

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nmap gm :call SynStack()<cr>
