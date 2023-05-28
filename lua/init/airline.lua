local M = {}

function M.setup()
  local vim = vim

  -- Airline Settings
  vim.g.airline_section_c = '%t'                                       -- Show only file tail name
  vim.g.airline_extensions = {'branch', 'whitespace'}       -- Disable other extensions by default
  -- vim.g.airline_theme = 'nord'                                         -- Nord theme
  vim.g["airline#parts#ffenc#skip_expected_string"] = 'utf-8[unix]'    -- Don't display default file format

  -- Airline Branch (Fugitive) Extension Settings
  vim.g["airline#extensions#branch#enabled"] = 1                       -- Confirm Fugitive is enabled
  vim.g["airline#extensions#branch#format"] = 1                        -- Show only branch tail name

  -- Airline Whitespace Extension Settings
  vim.g["airline#extensions#whitespace#enabled"] = 1                   -- Confirm Whitespace is enabled
  vim.g["airline#extensions#whitespace#show_message"] = 1              -- See the line number
  vim.g["airline#extensions#whitespace#trailing_format"] = '%s'        -- Only show the line number
  vim.g["airline#extensions#whitespace#mixed_indent_format"] = '%s'    -- Only show the line number
end

return M
