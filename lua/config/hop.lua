local M = {}

function M.setup()
  local hop = require("hop")
  local opts = {
    keys = "etovxqpdygfblzhckisuran"
  }
  hop.setup(opts)
end

return M
