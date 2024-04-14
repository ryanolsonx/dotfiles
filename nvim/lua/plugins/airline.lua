return {
  'vim-airline/vim-airline',
  init = function()
    vim.g.airline_powerline_fonts = 1
    vim.g.airline_section_y = ''
    vim.g.airline_section_z = '%l:%c'
    vim.g.airline_skip_empty_sections = 1
  end
}
