local M = {}

function M.setup()
  local cmplsp = require("cmp_nvim_lsp")
  local capabilities = cmplsp.default_capabilities()

  require("lspconfig")["intelephense"].setup({
    capabilities = capabilities,
  })
end

return M
