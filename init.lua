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

local lazy = require("lazy")
local lazy_opts = {
  dev = {
    path = "~/workspace",
    patterns = {},
    fallback = false,
  },
  install = {
    missing = true,
    colorscheme = { "nord" },
  },
}

lazy.setup({
  {"akinsho/bufferline.nvim",
    name = "Bufferline",
    version = "*",
    config = function()
      require("config.bufferline").setup()
    end,
    dependencies = {
      {"nvim-tree/nvim-web-devicons", name = "Web Dev Icons"},
    }
  },

  {"arcticicestudio/nord-vim",
    name = "Nord Theme",
    config = function()
      require("config.nord").setup()
    end,
  },

  {"burntsushi/ripgrep",
    name = "Rip Grep",
  },

  { "folke/neodev.nvim",
    name = "Neodev",
  },

  {"neoclide/coc.nvim",
    name = "COC",
    branch = "release"
  },

  {"nvim-lua/plenary.nvim",
    name = "Plenary",
  },

  {"nvim-telescope/telescope.nvim",
    name = "Telescope",
    tag = "0.1.1",
    dependencies = {
      {"nvim-lua/plenary.nvim", name = "Plenary"},
    }
  },

  {"nvim-tree/nvim-web-devicons",
    name = "Web Dev Icons",
  },

  {"nvim-treesitter/nvim-treesitter",
    name = "Treesitter",
    build = ":TSUpdate",
  },

  {"rust-lang/rust.vim",
    name = "Rust",
  },

  {"ryanoneill/treble.nvim",
    name = "Treble",
    dependencies = {
      {"nvim-telescope/telescope.nvim", name = "Telescope"},
      {"akinsho/bufferline.nvim", name = "Bufferline"},
    }
  },

  {"tpope/vim-commentary",
    name = "Commentary",
  },

  {"tpope/vim-fugitive",
    name = "Fugitive",
  },

  {"vim-airline/vim-airline",
    name = "Airline",
    dependencies = {
      {"vim-airline/vim-airline-themes", name = "Airline Themes"},
    },
    init = function()
      require("init.airline").setup()
    end,
  },
}, lazy_opts)

-- Set Leader explicity to \
vim.g.mapleader = "\\"

local normal_mode = 'n'
local visual_mode = 'v'

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
