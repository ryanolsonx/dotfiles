require("util")

local function switch_to_source(extension)
  vim.cmd("silent e %:r:r." .. extension)
end

local function switch_to_test(extension)
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
