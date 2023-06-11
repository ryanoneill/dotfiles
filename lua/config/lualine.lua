local M = {}

function M.setup()
  local lualine = require("lualine")
  local options = {
    theme = "nord",
    globalstatus = true,
  }
  lualine.setup(options)
end

return M
