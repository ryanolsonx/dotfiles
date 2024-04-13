vim.cmd.source("~/.config/nvim/oldinit.vim")



-- Colorscheme

vim.g['$BAT_THEME'] = 'Dracula'
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



-- Utilities

function trim_newline(str)
  return string.gsub(str, '\n', '')
end

function ends_with_extension(str, extension)
  local location = string.find(str, extension)
  return location ~= nil
end



-- Features

function git_push_new_branch()
  local branch = vim.fn.system({'git', 'rev-parse', '--abbrev-ref', 'HEAD'})
  branch = trim_newline(branch)
  vim.cmd("Git push -u origin " .. branch)
end

function is_in_jest_test(current_path)
  return ends_with_extension(current_path, '.test.js') or ends_with_extension(current_path, '.spec.js')
end

function is_in_cypress_test(current_path)
  return ends_with_extension(current_path, '.cy.jsx')
end

function is_in_test(current_path)
  return is_in_cypress_test(current_path) or is_in_jest_test(current_path)
end

function switch_to_source(extension)
  vim.cmd("silent e %:r:r." .. extension)
end

function switch_to_test(extension)
  vim.cmd("silent e %<." .. extension)
end

function toggle_between_test_and_source_file()
  local current_path = vim.fn.expand('%')
  local is_jsx = ends_with_extension(current_path, '.jsx')
  local is_js = ends_with_extension(current_path, '.js')

  if is_in_cypress_test(current_path) then
    switch_to_source('jsx')
  elseif is_in_jest_test(current_path) then
    switch_to_source('js')
  elseif is_jsx then
    switch_to_test('cy.jsx')
  elseif is_js then
    switch_to_test('test.js')
  end
end

function run_test_or_last()
  local current_path = vim.fn.expand('%')

  if is_in_test(current_path) then
    vim.g.last_test_file = current_path
  elseif vim.g.last_test_file == nil then
    return
  end

  vim.cmd("w")
  vim.cmd("silent !clear")

  local cmd = "bin/cy"
  if is_in_jest_test(vim.g.last_test_file) then
    cmd = "npx jest"
  end

  vim.cmd("split term://" .. cmd .. " " .. vim.g.last_test_file)
end



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
vim.keymap.set('n', '<Leader>gn', git_push_new_branch)
vim.keymap.set('n', '<Leader>t', run_test_or_last)
vim.keymap.set('n', 'sj', toggle_between_test_and_source_file, { silent = true })



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
