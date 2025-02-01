local M = {}

function M.setup(opts)
  local lspconfig = require("lspconfig")
  local cmplsp = require("cmp_nvim_lsp")

  lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
      },
    },
  }, opts or {}))

  local capabilities = cmplsp.default_capabilities()

  require("lspconfig")["lua_ls"].setup({
    capabilities = capabilities,
  })
end

return M
