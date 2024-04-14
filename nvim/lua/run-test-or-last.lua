require("util")

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
