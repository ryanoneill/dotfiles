local vim = vim
local api = vim.api
local opt = vim.opt

local M = {}

function M.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    api.nvim_command('augroup ' .. group_name)
    api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten({'autocmd', def}), ' ')
      api.nvim_command(command)
    end
    api.nvim_command('augroup END')
  end
end

function M.setup_code_folding()
  opt.foldmethod = "expr"
  opt.foldexpr = "nvim_treesitter#foldexpr()"

  local autoCommands = {
    open_folds = {
      {"BufReadPost,FileReadPost", "*", "normal zR"}
    }
  }

  M.nvim_create_augroups(autoCommands)
end

function M.setup()
  local configs = require("nvim-treesitter.configs")
  local opts = {
    ensure_installed = { "lua", "rust", "vim" },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    }
  }
  configs.setup(opts)
  M.setup_code_folding()
end

return M
