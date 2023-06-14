local M = {}

function M.setup()
  local blankline = require("indent_blankline")
  local opts = {
    show_current_context = true,
    show_current_context_start = true,
  }
  blankline.setup(opts)
end

return M
