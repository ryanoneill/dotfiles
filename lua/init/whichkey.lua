local M = {}

function M.setup()
  local vim = vim

  vim.o.timeout = true
  vim.o.timelen = 300
end

return M
