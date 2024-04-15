return {
  'junegunn/fzf.vim',
  dependencies = {'junegunn/fzf'},
  init = function()
  end,
  config = function()
    --vim.cmd("fzf#install()")
  end,
  keys = {
    { '<Leader>f', '<cmd>Rg<cr>' },
    { '<Leader>p', '<cmd>GFiles<cr>' },
    { '<Leader>b', '<cmd>Buffers<cr>' }
  }
}
