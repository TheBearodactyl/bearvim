local M = {}

function M.setup(opts)
  local lspconfig = require("lspconfig")
  lspconfig.pyright.setup(opts or {})
end

return M
