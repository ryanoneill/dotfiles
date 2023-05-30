local vim = vim

-- General Settings
vim.opt.expandtab = true                                             -- Tabs as spaces
vim.opt.shiftwidth = 2                                               -- Indentation of 2 spaces
vim.opt.softtabstop = 2                                              -- Indentation without hard tabs
vim.opt.wrap = false                                                 -- Don't wrap lines
vim.opt.number = true                                                -- Turn on line numbers
vim.opt.signcolumn = 'yes'                                           -- Always show signcolumn

local plugins = require("plugins")
plugins.setup()

-- Set Leader explicity to \
vim.g.mapleader = "\\"

local normal_mode = 'n'
local visual_mode = 'v'

-- Yank to Clipboard
vim.keymap.set(normal_mode, '<leader>yc', '"+y')
vim.keymap.set(visual_mode, '<leader>yc', '"+y')

-- Paste Checkmark (with Space) at End of Row
vim.keymap.set(normal_mode, '<leader>ch', 'A ✓<esc>')

-- Word Under Cursor
local function open_source()
  -- Rust Specific for now
  local under_cursor = vim.fn.expand('<cword>')
  local relative = 'src/' .. under_cursor .. '.rs'
  vim.cmd('e ' .. relative)
end

vim.keymap.set('n', '<leader>os', open_source, {})
