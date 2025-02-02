local M = {}

function M.setup()
  local wk = require("which-key")

  wk.add({
    {
      mode = "n",
      { "<leader>l", group = "LSP" },
      { "<leader>ld", vim.lsp.buf.definition, desc = "Go to definition" },
      { "<leader>lD", vim.lsp.buf.declaration, desc = "Go to declaration" },
      { "<leader>li", vim.lsp.buf.implementation, desc = "Go to implementation" },
      { "<leader>lr", vim.lsp.buf.references, desc = "Show references" },
      { "<leader>lh", vim.lsp.buf.hover, desc = "Hover" },
      { "<leader>ls", vim.lsp.buf.signature_help, desc = "Signature help" },
      { "<leader>lR", vim.lsp.buf.rename, desc = "Rename" },
      { "<leader>la", vim.lsp.buf.code_action, desc = "Code action" },
      { "<leader>lf", vim.lsp.buf.format, desc = "Format" },
    },
  })
end

return M
