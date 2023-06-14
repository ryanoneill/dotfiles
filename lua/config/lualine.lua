local M = {}

function M.setup()
  local lualine = require("lualine")
  local options = {
    theme = "nord",
    globalstatus = true,
    options = {
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
    },
  }
  lualine.setup(options)
end

return M
