require("util")

function git_push_new_branch()
  local branch = vim.fn.system({'git', 'rev-parse', '--abbrev-ref', 'HEAD'})
  branch = trim_newline(branch)
  vim.cmd("Git push -u origin " .. branch)
end
