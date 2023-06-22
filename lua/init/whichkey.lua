local M = {}

function M.setup()
  local vim = vim

  vim.o.timeout = true
  vim.o.timeoutlen = 300
end

return M
