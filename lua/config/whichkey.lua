local M = {}

function M.setup()
  local vim = vim
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
    t = {
      name = "Trouble",
      o = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostics" },
      w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics"},
      t = { "<cmd>Trouble lsp_type_definitions<cr>", "LSP Type Definitions" },
      d = { "<cmd>Trouble lsp_definitions<cr>", "LSP Definitions"},
      r = { "<cmd>Trouble lsp_references<cr>", "LSP References" },
      x = { "<cmd>TroubleClose<cr>", "Close" },
    },
    d = {
      name = "Directory Tree",
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
    p = {
      name = "Paste",
      c = { "A ✓<esc>", "Paste Checkmark" },
    },
    c = {
      name = "Code",
      d = { vim.lsp.buf.declaration, "Declaration" },
      h = { vim.lsp.buf.hover, "Hover" },
      i = { vim.lsp.buf.implementation, "Implementation" },
      s = { vim.lsp.buf.signature_help, "Signature Help" },
      t = { vim.lsp.buf.type_definitions, "Type Definitions" },
      a = { vim.lsp.buf.code_action, "Code Actions" },
      n = { vim.lsp.buf.rename, "Rename" },
    },
    l = {
      name = "LSP Saga",
      f = { "<cmd>Lspsaga lsp_finder<cr>", "Finder"},
      a = { "<cmd>Lspsaga code_action<cr>", "Code Action"},
      n = { "<cmd>Lspsaga rename<cr>", "Rename"},
      N = { "<cmd>Lspsaga rename ++project<cr>", "Rename in Project"},
      d = { "<cmd>Lspsaga peek_definition<cr>", "Peek Definition"},
      D = { "<cmd>Lspsaga goto_definition<cr>", "Goto Definition"},
      t = { "<cmd>Lspsaga peek_type_definition<cr>", "Peek Type Definition"},
      T = { "<cmd>Lspsaga goto_type_definition<cr>", "Goto Type Definition"},
      l = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show Line Diagnostics"},
      b = { "<cmd>Lspsaga show_buf_diagnostics<cr>", "Show Buffer Diagnostics"},
      w = { "<cmd>Lspsaga show_workspace_diagnostics<cr>", "Show Workspace Diagnostics"},
      c = { "<cmd>Lspsaga show_cursor_diagnostics<cr>", "Show Cursor Diagnostics"},
      j = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Diagnostic Jump Next"},
      J = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Diagnostic Jump Previous"},
      o = { "<cmd>Lspsaga outline<cr>", "Outline"},
      h = { "<cmd>Lspsaga hover_doc<cr>", "Hover"},
      H = { "<cmd>Lspsaga hover_doc ++keep<cr>", "Hover Keep"},
      r = { "<cmd>Lspsaga incoming_calls<cr>", "Incoming Calls"},
      R = { "<cmd>Lspsaga outgoing_calls<cr>", "Outgoing Calls"},
      s = { "<cmd>Lspsaga term_toggle", "Terminal"},
    }
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M
