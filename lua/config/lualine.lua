local M = {}

function M.is_large()
  local columns = vim.opt.columns:get()
  return columns >= 60
end

function M.shorten_filename(value, _)
  if M.is_large() then
    return value
  elseif string.len(value) > 17 then
    return string.sub(value, 1, 17) .. "..."
  else
    return value
  end
end

function M.setup()
  local lualine = require("lualine")
  local options = {
    theme = "nord",
    globalstatus = true,
    options = {
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
      display_components = { 'spinner' },
      spinner_symbols = { '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 ' },
    },
    sections = {
      lualine_a = {
        {
          'mode',
          icons_enabled = true,
          icon = "",
        }
      },
      lualine_b = {
        {
          'b:gitsigns_head',
          icon = '',
          cond = M.is_large,
        },
        {
          'diff',
          cond = M.is_large,
        },
        {
          'diagnostics',
          cond = M.is_large,
        }
      },
      lualine_c = {
        {
          'filetype',
          icon_only = true,
          icon = {
            align = 'right',
          },
          padding = {
            left = 1,
            right = 0,
          },
        },
        {
          'filename',
          file_status = false,
          fmt = M.shorten_filename,
        }
      },
      lualine_x = {
        {
          'lsp_progress',
        },
        {
          'encoding',
          cond = M.is_large,
        },
        {
          'fileformat',
          cond = M.is_large,
        },
      },
      lualine_y = {'progress'},
      lualine_z = {'location'},
    },
  }
  lualine.setup(options)
end

return M
