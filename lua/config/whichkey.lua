local M = {}

function M.setup()
  local whichkey = require("which-key")
  local builtin = require("telescope.builtin")
  local bufferline = require("bufferline")
  local treble = require("treble")

  local conf = {
    window = {
      border = "none",
      position = "bottom",
    },
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
    }
  }

  local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
  }

  local function goto_buffer(n)
    return function()
      bufferline.go_to(n, true)
    end
  end

  local mappings = {
    b = {
      name = "Buffer",
      n = { "<cmd>BufferLineCycleNext<cr>", "Next Buffer" },
      p = { "<cmd>BufferLineCyclePrev<cr>", "Previous Buffer" },
      x = { "<cmd>bdelete<cr>", "Close Buffer" },
      d = { "<cmd>bdelete!<cr>", "Force Delete Buffer" },
      l = { "<cmd>BufferLineMovePrev<cr>", "Move Buffer Left" },
      r = { "<cmd>BufferLineMoveNext<cr>", "Move Buffer Right" },

      ["1"] = { goto_buffer(1), "Buffer  1" },
      ["2"] = { goto_buffer(2), "Buffer  2" },
      ["3"] = { goto_buffer(3), "Buffer  3" },
      ["4"] = { goto_buffer(4), "Buffer  4" },
      ["5"] = { goto_buffer(5), "Buffer  5" },
      ["6"] = { goto_buffer(6), "Buffer  6" },
      ["7"] = { goto_buffer(7), "Buffer  7" },
      ["8"] = { goto_buffer(8), "Buffer  8" },
      ["9"] = { goto_buffer(9), "Buffer  9" },
      ["0"] = { goto_buffer(10), "Buffer 10" },
      ["$"] = { goto_buffer(-1), "Last Buffer" },
    },
    f = {
      name = "Find",
      f = { builtin.find_files, "Find File" },
      g = { builtin.live_grep, "Live Grep" },
      h = { builtin.help_tags, "Help Tags" },
      b = { treble.buffers, "Find Buffer" },
    },
    c = {
      name = "COC",
      l = { "<cmd>CocDiagnostics<cr>", "Diagnostics" },
      n = { "<cmd>CocNext<cr>", "Next" },
      p = { "<cmd>CocPrev<cr>", "Prev" },
      o = { "<cmd>CocOutline<cr>", "Outline" },
    },
    t = {
      name = "Tree",
      c = { "<cmd>NvimTreeCollapse<cr>", "Tree Collapse" },
      f = { "<cmd>NvimTreeFocus<cr>", "Tree Focus" },
      o = { "<cmd>NvimTreeFindFile<cr>", "Tree Open" },
      t = { "<cmd>NvimTreeToggle<cr>", "Tree Toggle" },
      x = { "<cmd>NvimTreeClose<cr>", "Tree Close" },
    },
    h = { "<cmd>HopWord<cr>", "Hop Word" },
    m = {
      name = "Mason",
      m = { "<cmd>Mason<cr>", "Mason" },
      u = { "<cmd>MasonUpdate<cr>", "Mason Update" },
      l = { "<cmd>MasonLog<cr>", "Mason Log" },
    },
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M
