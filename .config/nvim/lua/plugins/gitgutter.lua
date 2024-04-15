return {
  'airblade/vim-gitgutter',
  init = function()
    vim.g.gitgutter_sign_added = '┃'
    vim.g.gitgutter_sign_modified = '┃'
    vim.g.gitgutter_sign_modified_removed = '┃'
    vim.g.gitgutter_sign_removed = '┃'
  end
}
