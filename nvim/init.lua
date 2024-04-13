vim.cmd.source("~/.config/nvim/oldinit.vim")

-- Colorscheme
vim.g.dracula_italic = 1
vim.opt.termguicolors = true
vim.cmd.colorscheme("dracula")

-- Basic
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 300
vim.opt.hidden = true

-- Plug config
vim.g.airline_powerline_fonts = 1
vim.g.airline_section_y = ''
vim.g.airline_section_z = '%l:%c'
vim.g.airline_skip_empty_sections = 1
vim.g.gitgutter_sign_added = '┃'
vim.g.gitgutter_sign_modified = '┃'
vim.g.gitgutter_sign_modified_removed = '┃'
vim.g.gitgutter_sign_removed = '┃'
vim.g.user_emmet_leader_key = '<C-j>'

-- Key bindings
vim.g.mapleader = ' '
vim.keymap.set('n', '<Leader>n', '<cmd>NERDTreeToggle<cr>')
vim.keymap.set('n', '<Leader>m', '<cmd>NERDTreeFind<cr>')
vim.keymap.set('n', '<Leader>f', '<cmd>Rg<cr>')
vim.keymap.set('n', '<Leader>p', '<cmd>GFiles<cr>')
vim.keymap.set('n', '<Leader>b', '<cmd>Buffers<cr>')
vim.keymap.set('n', '<Leader>e', '<cmd>!npx eslint %<cr>')
vim.keymap.set('n', '<Leader>s', '<cmd>!npx stylelint %<cr>')
vim.keymap.set('n', '<Leader>g', '<cmd>G<cr>')
vim.keymap.set('n', '<Leader>gp', '<cmd>Git push -f<cr>')
vim.keymap.set('n', '<Leader>gn', '<cmd>call GitPushNew()<cr>')
vim.keymap.set('n', '<Leader>t', '<cmd>call RunTestOrLast()<cr>')

-- Autocmds
local group = vim.api.nvim_create_augroup('file_type_commands', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'help',
  group = group,
  callback = function(args)
    vim.keymap.set('n', 'q', '<cmd>q<cr>', { buffer = args.buf })
  end
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'fugitive',
  group = group,
  callback = function(args)
    vim.keymap.set('n', 'q', '<cmd>q<cr>', { buffer = args.buf })
  end
})
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  group = group,
  callback = function(args)
    vim.keymap.set('n', 'q', '<cmd>bd!<cr>', { buffer = args.buf })
  end
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'gitcommit',
  group = group,
  callback = function(args)
    vim.opt_local.spell = true
    vim.opt_local.textwidth = 72
  end
})
