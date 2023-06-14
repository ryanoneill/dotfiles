local M = {}

function M.setup()
  local alpha = require("alpha")
  local alpha_themes = require("alpha.themes.dashboard")
  alpha.setup(alpha_themes.config)
end

return M
