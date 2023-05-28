local M = {}

function M.setup()
  local vim = vim

  -- Color Scheme Nord
  vim.cmd.colorscheme('nord')

  -- Colorscheme Overrides
  vim.api.nvim_set_hl(0, 'CocInlayHint', { ctermfg=8 })                -- Make hints look like comments
end

return M
