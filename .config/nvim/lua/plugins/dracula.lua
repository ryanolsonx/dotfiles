return {
  'dracula/vim',
  name = 'dracula',
  init = function()
    vim.g.dracula_italic = 1
    vim.opt.termguicolors = true
  end,
  config = function()
    vim.cmd.colorscheme("dracula")
  end,
  priority = 1000,
  lazy = false
}
