local M = {}

function M.setup()
  local vim = vim
  local whichkey = require("which-key")
  local builtin = require("telescope.builtin")
  local bufferline = require("bufferline")
  local treble = require("treble")

  local conf = {
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
    }
  }

  local function goto_buffer(n)
    return function()
      bufferline.go_to(n, true)
    end
  end

  local buffer = {
    { "<leader>b", group = "Buffer" },
    { "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer"},
    { "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous Buffer" },
    { "<leader>bx", "<cmd>bdelete<cr>", desc = "Close Buffer" },
    { "<leader>bd", "<cmd>bdelete!<cr>", desc = "Force Delete Buffer" },
    { "<leader>bl", "<cmd>BufferLineMovePrev<cr>", desc = "Move Buffer Left" },
    { "<leader>br", "<cmd>BufferLineMoveNext<cr>", desc = "Move Buffer Right" },
    { "<leader>b1", goto_buffer(1), desc = "Buffer  1" },
    { "<leader>b2", goto_buffer(2), desc = "Buffer  2" },
    { "<leader>b3", goto_buffer(3), desc = "Buffer  3" },
    { "<leader>b4", goto_buffer(4), desc = "Buffer  4" },
    { "<leader>b5", goto_buffer(5), desc = "Buffer  5" },
    { "<leader>b6", goto_buffer(6), desc = "Buffer  6" },
    { "<leader>b7", goto_buffer(7), desc = "Buffer  7" },
    { "<leader>b8", goto_buffer(8), desc = "Buffer  8" },
    { "<leader>b9", goto_buffer(9), desc = "Buffer  9" },
    { "<leader>b0", goto_buffer(10), desc = "Buffer 10"},
    { "<leader>b$", goto_buffer(-1), desc = "Last Buffer" },
  }
  whichkey.add(buffer)

  local find = {
    { "<leader>f", group = "Find" },
    { "<leader>ff", builtin.find_files, desc = "Find File" },
    { "<leader>fg", builtin.live_grep, desc = "Live Grep" },
    { "<leader>fh", builtin.help_tags, desc = "Help Tags" },
    { "<leader>fb", treble.buffers, desc = "Find Buffer" },
  }
  whichkey.add(find)

  local trouble = {
    { "<leader>t", group = "Trouble" },
    -- { "<leader>to", "<cmd>Trouble document_diagnostics<cr>", desc = "Document Diagnostics" },
    { "<leader>to", "<cmd>Trouble diagnostics toggle<cr>", desc = "Document Diagnostics" },
    { "<leader>tw", "<cmd>Trouble workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
    { "<leader>tt", "<cmd>Trouble lsp_type_definitions<cr>", desc = "LSP Type Definitions" },
    { "<leader>td", "<cmd>Trouble lsp_definitions<cr>", desc = "LSP Definitions" },
    { "<leader>tr", "<cmd>Trouble lsp_references<cr>", desc = "LSP References" },
    { "<leader>tx", "<cmd>TroubleClose<cr>", desc = "Close" }
  }
  whichkey.add(trouble)

  local directory = {
    { "<leader>d", group = "Directory Tree" },
    { "<leader>dc", "<cmd>NvimTreeCollapse<cr>", desc = "Tree Collapse" },
    { "<leader>df", "<cmd>NvimTreeFocus<cr>", desc = "Tree Focus" },
    { "<leader>do", "<cmd>NvimTreeFindFile<cr>", desc = "Tree Open" },
    { "<leader>dt", "<cmd>NvimTreeToggle<cr>", desc = "Tree Toggle" },
    { "<leader>dx", "<cmd>NvimTreeClose<cr>", desc = "Tree Close" },
  }
  whichkey.add(directory)

  local hop = {
    { "<leader>h", group = "Hop" },
    { "<leader>hw", "<cmd>HopWord<cr>", desc = "Hop Word" },
  }
  whichkey.add(hop)

  local mason = {
    { "<leader>m", group = "Mason" },
    { "<leader>mm", "<cmd>Mason<cr>", desc = "Mason" },
    { "<leader>mu", "<cmd>MasonUpdate<cr>", desc = "Mason Update" },
    { "<leader>ml", "<cmd>MasonLog<cr>", desc = "Mason Log" },
  }
  whichkey.add(mason)

  local paste = {
    { "<leader>p", group = "Paste" },
    { "<leader>pc", "A ✓<esc>", desc = "Paste Checkmark" },
  }
  whichkey.add(paste)

  local code = {
    { "<leader>c", group = "Code" },
    { "<leader>cd", vim.lsp.buf.declaration, desc = "Declaration" },
    { "<leader>ch", vim.lsp.buf.hover, desc = "Hover" },
    { "<leader>ci", vim.lsp.buf.implementation, desc = "Implementation" },
    { "<leader>cs", vim.lsp.buf.signature_help, desc = "Signature Help" },
    { "<leader>ct", vim.lsp.buf.type_definition, desc = "Type Definitions" },
    { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Actions" },
    { "<leader>cn", vim.lsp.buf.rename, desc = "Rename" },
  }
  whichkey.add(code)

  local saga = {
    { "<leader>l", group = "LSP Saga" },
    { "<leader>lf", "<cmd>Lspsaga lsp_finder<cr>", desc = "Finder" },
    { "<leader>la", "<cmd>Lspsaga code_action<cr>", desc = "Code Action" },
    { "<leader>ln", "<cmd>Lspsaga rename<cr>", desc = "Rename" },
  --     N = { "<cmd>Lspsaga rename ++project<cr>", "Rename in Project"},
  --     d = { "<cmd>Lspsaga peek_definition<cr>", "Peek Definition"},
  --     D = { "<cmd>Lspsaga goto_definition<cr>", "Goto Definition"},
  --     t = { "<cmd>Lspsaga peek_type_definition<cr>", "Peek Type Definition"},
  --     T = { "<cmd>Lspsaga goto_type_definition<cr>", "Goto Type Definition"},
  --     l = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show Line Diagnostics"},
  --     b = { "<cmd>Lspsaga show_buf_diagnostics<cr>", "Show Buffer Diagnostics"},
  --     w = { "<cmd>Lspsaga show_workspace_diagnostics<cr>", "Show Workspace Diagnostics"},
  --     c = { "<cmd>Lspsaga show_cursor_diagnostics<cr>", "Show Cursor Diagnostics"},
  --     j = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Diagnostic Jump Next"},
  --     J = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Diagnostic Jump Previous"},
  --     o = { "<cmd>Lspsaga outline<cr>", "Outline"},
  --     h = { "<cmd>Lspsaga hover_doc<cr>", "Hover"},
  --     H = { "<cmd>Lspsaga hover_doc ++keep<cr>", "Hover Keep"},
  --     r = { "<cmd>Lspsaga incoming_calls<cr>", "Incoming Calls"},
  --     R = { "<cmd>Lspsaga outgoing_calls<cr>", "Outgoing Calls"},
  --     s = { "<cmd>Lspsaga term_toggle", "Terminal"},
  }
  whichkey.add(saga)

  whichkey.setup(conf)
end

return M
