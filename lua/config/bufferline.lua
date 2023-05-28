local M = {}

function M.setup()
  local vim = vim

  -- Setup for Bufferline (Buffers Show as Tabs Plugin)
  vim.opt.termguicolors = true
  local bufferline = require("bufferline")
  bufferline.setup({
    options = {
      themable = true,
      style_preset = {
        bufferline.style_preset.no_bold
      },
      diagnostics = "coc",
      numbers = "ordinal",
      show_buffer_close_icons = false,
      tab_size = 12
    }
  })
end

return M
