local M = {}

function M.setup_lua(lspconfig, capabilities)
  local opts = {
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
          disable = { "different-requires" },
        },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        }
      }
    }
  }
  lspconfig.lua_ls.setup(opts)
end

function M.setup_rust(lspconfig, capabilities)
  local opts = {
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        imports = {
          granularity = {
            group = "module",
          },
          prefix = "self",
        },
        cargo = {
          buildScripts = {
            enable = true,
          },
        },
        procMacro = {
          enable = true,
        },
        checkOnSave = true,
      }
    }
  }
  lspconfig.rust_analyzer.setup(opts)
end

function M.capabilities()
  local cmp_nvim_lsp = require("cmp_nvim_lsp")
  return cmp_nvim_lsp.default_capabilities()
end

function M.setup()
  local mason_lspconfig = require("mason-lspconfig")
  mason_lspconfig.setup()

  local lspconfig = require("lspconfig")
  local capabilities = M.capabilities()
  M.setup_lua(lspconfig, capabilities)
  M.setup_rust(lspconfig, capabilities)
end

return M
