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

    {"folke/trouble.nvim",
      name = "Trouble",
      dependencies = {
        {"nvim-tree/nvim-web-devicons", name = "Web Dev Icons"},
      },
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

    {"goolord/alpha-nvim",
      name = "Alpha",
      config = function()
        require("config.alpha").setup()
      end,
      dependencies = {
        {"nvim-tree/nvim-web-devicons", name = "Web Dev Icons"},
      },
    },

    {"lewis6991/gitsigns.nvim",
      name = "Git Signs",
      config = function()
        require("config.gitsigns").setup()
      end,
    },

    {"lukas-reineke/indent-blankline.nvim",
      name = "Indent Blankline",
      config = function()
        require("config.blankline").setup()
      end,
    },

    {"neoclide/coc.nvim",
      name = "COC",
      branch = "release"
    },

    {"numToStr/Comment.nvim",
      name = "Comment",
      config = function()
        require("config.comment").setup()
      end,
    },

    {"nvim-lua/plenary.nvim",
      name = "Plenary",
    },

    {"nvim-lualine/lualine.nvim",
      name = "Lualine",
      dependencies = {
        {"nvim-tree/nvim-web-devicons", name = "Web Dev Icons"},
      },
      config = function()
        require("config.lualine").setup()
      end
    },

    {"nvim-telescope/telescope.nvim",
      name = "Telescope",
      tag = "0.1.1",
      dependencies = {
        {"nvim-lua/plenary.nvim", name = "Plenary"},
      }
    },

    {"nvim-tree/nvim-tree.lua",
      name = "Neovim Tree",
      cmd = {"NvimTreeToggle", "NvimTreeFocus", "NvimTreeOpen", "NvimTreeFindFile"},
      config = function()
        require("config.tree").setup()
      end,
      dependencies = {
        {"nvim-tree/nvim-web-devicons", name = "Web Dev Icons"},
      },
    },

    {"nvim-tree/nvim-web-devicons",
      name = "Web Dev Icons",
    },

    {"nvim-treesitter/nvim-treesitter",
      name = "Treesitter",
      build = ":TSUpdate",
      config = function()
        require("config.treesitter").setup()
      end,
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

  }, lazy_opts)
end

return M
