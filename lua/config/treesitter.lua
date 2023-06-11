local M = {}

function M.setup()
  local configs = require("nvim-treesitter.configs")
  local opts = {
    ensure_installed = { "lua", "rust", "vim" },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    }
  }
  configs.setup(opts)
end

return M
