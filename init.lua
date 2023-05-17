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
vim.g.airline_extensions = {'branch', 'tabline', 'whitespace'}       -- Disable other extensions by default
vim.g.airline_theme = 'nord'                                         -- Nord theme
vim.g["airline#parts#ffenc#skip_expected_string"] = 'utf-8[unix]'    -- Don't display default file format

-- Airline Tabline Settings
vim.g["airline#extensions#tabline#enabled"] = 1                      -- Turn on tabline extension
vim.g["airline#extensions#tabline#show_buffers"] = 1                 -- Show buffers in tabline
vim.g["airline#extensions#tabline#buffers_label"] = ''               -- Don't display 'buffers' text in tabline
vim.g["airline#extensions#tabline#left_sep"] = ' '                   -- No tabline separators
vim.g["airline#extensions#tabline#left_alt_sep"] = ''                -- No tabline separators
vim.g["airline#extensions#tabline#fnametruncate"] = 30               -- Truncate display to 30 characters
vim.g["airline#extensions#tabline#buffer_nr_show"] = 0               -- Turn off numbers (Use wildmode instead)
vim.g["airline#extensions#tabline#fnamemod"] = ':t'                  -- Only show filename in tab

-- Airline Branch (Fugitive) Extension Settings
vim.g["airline#extensions#branch#enabled"] = 1                       -- Confirm Fugitive is enabled
vim.g["airline#extensions#branch#format"] = 1                        -- Show only branch tail name

-- Airline Whitespace Extension Settings
vim.g["airline#extensions#whitespace#enabled"] = 1                   -- Confirm Whitespace is enabled
vim.g["airline#extensions#whitespace#show_message"] = 1              -- See the line number
vim.g["airline#extensions#whitespace#trailing_format"] = '%s'        -- Only show the line number
vim.g["airline#extensions#whitespace#mixed_indent_format"] = '%s'    -- Only show the line number

require("lazy").setup({
  "arcticicestudio/nord-vim",
  "burntsushi/ripgrep",
  {"neoclide/coc.nvim", branch = "release"},
  {"nvim-telescope/telescope.nvim", tag = "0.1.1", dependencies = {"nvim-lua/plenary.nvim"}},
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "rust-lang/rust.vim",
  "tpope/vim-commentary",
  "tpope/vim-fugitive",
  "vim-airline/vim-airline",
  "vim-airline/vim-airline-themes"
})

-- Color Scheme Nord
vim.cmd.colorscheme('nord')                                          -- Testing out Nord color scheme

-- Colorscheme Overrides
vim.api.nvim_set_hl(0, 'CocInlayHint', { ctermfg=8 })                -- Make hints look like comments

-- Buffer Next, Previous, and Close
vim.keymap.set('n', '<leader>n', '<cmd>bnext<cr>')
vim.keymap.set('n', '<leader>p', '<cmd>bprevious<cr>')
vim.keymap.set('n', '<leader>x', '<cmd>bd<cr>')

-- Telescope Find
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Yank to Clipboard
vim.keymap.set('n', '<leader>yc', '"+y')

-- Paste Checkmark (with Space) at End of Row 
vim.keymap.set('n', '<leader>ch', 'A ✓<esc>')
