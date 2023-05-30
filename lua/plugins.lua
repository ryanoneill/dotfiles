local M = {}

function M.setup()
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

    {"folke/neodev.nvim",
      name = "Neodev",
    },

    {"folke/which-key.nvim",
      name = "Which Key",
      event = "VeryLazy",
      init = function()
        require("init.whichkey").setup()
      end,
      config = function()
        require("config.whichkey").setup()
      end,
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
end

return M
