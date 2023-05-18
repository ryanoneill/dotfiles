local vim = vim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- General Settings
vim.opt.expandtab = true                                             -- Tabs as spaces
vim.opt.shiftwidth = 2                                               -- Indentation of 2 spaces
vim.opt.softtabstop = 2                                              -- Indentation without hard tabs
vim.opt.wrap = false                                                 -- Don't wrap lines
vim.opt.number = true                                                -- Turn on line numbers
vim.opt.signcolumn = 'yes'                                           -- Always show signcolumn

-- Airline Settings
vim.g.airline_section_c = '%t'                                       -- Show only file tail name
vim.g.airline_extensions = {'branch', 'whitespace'}       -- Disable other extensions by default
vim.g.airline_theme = 'nord'                                         -- Nord theme
vim.g["airline#parts#ffenc#skip_expected_string"] = 'utf-8[unix]'    -- Don't display default file format

-- Airline Branch (Fugitive) Extension Settings
vim.g["airline#extensions#branch#enabled"] = 1                       -- Confirm Fugitive is enabled
vim.g["airline#extensions#branch#format"] = 1                        -- Show only branch tail name

-- Airline Whitespace Extension Settings
vim.g["airline#extensions#whitespace#enabled"] = 1                   -- Confirm Whitespace is enabled
vim.g["airline#extensions#whitespace#show_message"] = 1              -- See the line number
vim.g["airline#extensions#whitespace#trailing_format"] = '%s'        -- Only show the line number
vim.g["airline#extensions#whitespace#mixed_indent_format"] = '%s'    -- Only show the line number

local lazy = require("lazy")
local lazy_opts = {
  dev = {
    path = "~/workspace",
    patterns = {},
    fallback = false,
  }
}

lazy.setup({
  {"akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons"},
  "arcticicestudio/nord-vim",
  "burntsushi/ripgrep",
  "folke/neodev.nvim",
  {"neoclide/coc.nvim", branch = "release"},
  "nvim-lua/plenary.nvim",
  {"nvim-telescope/telescope.nvim", tag = "0.1.1", dependencies = {"nvim-lua/plenary.nvim"}},
  "nvim-tree/nvim-web-devicons",
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "rust-lang/rust.vim",
  {"ryanoneill/treble.nvim", dev = true, dependencies = {"nvim-telescope/telescope.nvim", "akinsho/bufferline.nvim"}},
  "tpope/vim-commentary",
  "tpope/vim-fugitive",
  "vim-airline/vim-airline",
  "vim-airline/vim-airline-themes"
}, lazy_opts)

-- Color Scheme Nord
vim.cmd.colorscheme('nord')                                          -- Testing out Nord color scheme

-- Set Leader explicity to \
vim.g.mapleader = "\\"

local normal_mode = 'n'
local visual_mode = 'v'

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

-- Colorscheme Overrides
vim.api.nvim_set_hl(0, 'CocInlayHint', { ctermfg=8 })                -- Make hints look like comments

-- Buffer Next, Previous, and Close
vim.keymap.set(normal_mode, '<leader>n', '<cmd>BufferLineCycleNext<cr>')
vim.keymap.set(normal_mode, '<leader>p', '<cmd>BufferLineCyclePrev<cr>')
vim.keymap.set(normal_mode, '<leader>x', '<cmd>bdelete<cr>')
vim.keymap.set(normal_mode, '<leader>xx', '<cmd>bdelete!<cr>')

vim.keymap.set(normal_mode, '<leader>1', '<cmd>lua require("bufferline").go_to(1, true)<cr>')
vim.keymap.set(normal_mode, '<leader>2', '<cmd>lua require("bufferline").go_to(2, true)<cr>')
vim.keymap.set(normal_mode, '<leader>3', '<cmd>lua require("bufferline").go_to(3, true)<cr>')
vim.keymap.set(normal_mode, '<leader>4', '<cmd>lua require("bufferline").go_to(4, true)<cr>')
vim.keymap.set(normal_mode, '<leader>5', '<cmd>lua require("bufferline").go_to(5, true)<cr>')
vim.keymap.set(normal_mode, '<leader>6', '<cmd>lua require("bufferline").go_to(6, true)<cr>')
vim.keymap.set(normal_mode, '<leader>7', '<cmd>lua require("bufferline").go_to(7, true)<cr>')
vim.keymap.set(normal_mode, '<leader>8', '<cmd>lua require("bufferline").go_to(8, true)<cr>')
vim.keymap.set(normal_mode, '<leader>9', '<cmd>lua require("bufferline").go_to(9, true)<cr>')
vim.keymap.set(normal_mode, '<leader>0', '<cmd>lua require("bufferline").go_to(10, true)<cr>')
vim.keymap.set(normal_mode, '<leader>$', '<cmd>lua require("bufferline").go_to(-1, true)<cr>')

-- Telescope Find
local builtin = require('telescope.builtin')
local treble = require('treble')

vim.keymap.set(normal_mode, '<leader>ff', builtin.find_files, {})
vim.keymap.set(normal_mode, '<leader>fg', builtin.live_grep, {})
vim.keymap.set(normal_mode, '<leader>fh', builtin.help_tags, {})
vim.keymap.set(normal_mode, '<leader>fb', treble.buffers, {})

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
