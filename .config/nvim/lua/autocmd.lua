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
