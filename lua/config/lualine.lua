local M = {}

function M.setup()
  local lualine = require("lualine")
  local options = {
    theme = "nord",
    globalstatus = true,
    options = {
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
      display_components = { 'spinner', { 'percentage' } },
      spinner_symbols = { '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 ' },
      separators = {
        progress = '',
      },
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff'},
      lualine_c = {'filename' },
      lualine_x = {'lsp_progress', 'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'},
    },
  }
  lualine.setup(options)
end

return M
