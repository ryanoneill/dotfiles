local M = {}


function M.setup()
  local luasnip = require("luasnip")
  local cmp = require("cmp")
  local lspkind = require("lspkind")

  local opts = {
    formatting = {
      format = lspkind.cmp_format({
        mode = "symbol",
        maxwidth = 50,
        ellipsis_char = "...",
      }),
    },
    completion = {
      completeopt = "menuone,noinsert,noselect"
    },
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["C-Space>"] = cmp.mapping.complete(),
      ["<C-x>"] = cmp.mapping.close(),
      ["<C-y>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
      })
    }),
    performance = {
      max_view_entries = 20,
    },
    matching = {
      disallow_fuzzy_matching = true,
    },
    sources = {
      { name = "nvim_lsp", group_index = 1 },
      { name = "buffer", group_index = 2, max_item_count = 10 },
    }
  }
  cmp.setup(opts)
end

return M
