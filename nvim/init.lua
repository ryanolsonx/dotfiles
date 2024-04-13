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
