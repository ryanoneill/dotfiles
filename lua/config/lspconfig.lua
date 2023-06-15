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

function M.setup_server(lspconfig, capabilities, server)
  local opts = {
    capabilities = capabilities
  }
  lspconfig[server].setup(opts)
end

function M.setup_servers(mason_lspconfig)
  local servers = mason_lspconfig.get_installed_servers()
  local lspconfig = require("lspconfig")
  local capabilities = M.capabilities()

  for _, server in ipairs(servers) do
    if server == "lua_ls" then
      M.setup_lua(lspconfig, capabilities)
    elseif server == "rust_analyzer" then
      M.setup_rust(lspconfig, capabilities)
    else
      M.setup_server(lspconfig, capabilities, server)
    end
  end
end

function M.setup()
  local mason_lspconfig = require("mason-lspconfig")
  mason_lspconfig.setup()
  M.setup_servers(mason_lspconfig)
end

return M
