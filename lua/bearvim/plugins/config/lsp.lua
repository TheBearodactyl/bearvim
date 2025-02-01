local M = {}

function M.setup()
  local lspconfig = require("lspconfig")

  require("mason").setup()

  require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls" },
    automatic_installation = true,
  })

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

  local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  end

  require("mason-lspconfig").setup_handlers({
    function(server_name)
      local ok, server_config = pcall(require, "bearvim.config.lsp." .. server_name)
      if ok then
        server_config.setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      else
        require("lspconfig")[server_name].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end
    end,
  })
end

return M
