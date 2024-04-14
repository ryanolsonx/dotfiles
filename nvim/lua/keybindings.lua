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