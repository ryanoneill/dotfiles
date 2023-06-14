local M = {}

function M.setup()
  local height_ratio = 0.8
  local width_ratio = 0.5

  local vim = vim
  local tree = require("nvim-tree")

  local opts = {
    filters = {
      dotfiles = true,
    },
    git = {
      enable = false,
      ignore = true,
    },
    renderer = {
      icons = {
        webdev_colors = false,
        show = {
          git = false,
          modified = false,
        },
      },
      special_files = {},
    },
    view = {
      signcolumn = "no",
      float = {
        enable = true,
        open_win_config = function()
          local columns = vim.opt.columns:get()
          local lines = vim.opt.lines:get()
          local cmd_height = vim.opt.cmdheight:get()

          local screen_w = columns
          local screen_h = lines - cmd_height
          local window_w = screen_w * width_ratio
          local window_h = screen_h * height_ratio
          local window_w_int = math.floor(window_w)
          local window_h_int = math.floor(window_h)
          local center_x = (screen_w - window_w) / 2
          local center_y = ((lines - window_h) / 2) - cmd_height

          return {
            border = 'rounded',
            relative = 'editor',
            row = center_y,
            col = center_x,
            width = window_w_int,
            height = window_h_int,
          }
        end,
      },
      width = function()
        local columns = vim.opt.columns:get()
        return math.floor(columns * width_ratio)
      end,
    }
  }
  tree.setup(opts)
end

return M
