local vim = vim

-- Global Settings
vim.g.mapleader = "\\"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- General Settings
vim.opt.expandtab = true                                             -- Tabs as spaces
vim.opt.shiftwidth = 2                                               -- Indentation of 2 spaces
vim.opt.softtabstop = 2                                              -- Indentation without hard tabs
vim.opt.wrap = false                                                 -- Don't wrap lines
vim.opt.number = true                                                -- Turn on line numbers
vim.opt.numberwidth = 2
vim.opt.signcolumn = 'yes'                                           -- Always show signcolumn
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.smartindent = true
vim.opt.fillchars = { eob = " " }

local plugins = require("plugins")
plugins.setup()

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
