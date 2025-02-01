local M = {}

function M.setup(opts)
  local lspconfig = require("lspconfig")
  lspconfig.tsserver.setup(opts or {})
end

return M
